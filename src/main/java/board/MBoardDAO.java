package board;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import common.JDBConnect; // DB연결을 위한 클래스로 패키지가 다르므로 import 해야한다.
 
@Repository
public class MBoardDAO extends JDBConnect{
	
	@Autowired
	JdbcTemplate template;
	
	public MBoardDAO() {
		/*
		컨트롤러에서 @Autiwired를 통해 자동 주입 받았던 빈을 정적변수인
		JdbcTemplateConst.template에 값을 할당하였으므로, DB연결정보를
		DAO에서 바로 사용할 수 있다. 
		*/
		this.template = JdbcTemplateConst.template;
		System.out.println("MBoardDAO() 생성자 호출");
	}
	public void close() {

	}
	// 부모의 인자생성자를 호출한다. 이때 application내장객체를 매개변수로 전달한다.
	public MBoardDAO(ServletContext application) {
		// 내장객체를 통해 web.xml에 작성된 컨텍스트 초기화 파라미터를 얻어온다.
		super(application);
	}
	
	public MBoardDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	/*
	board 테이블에 저장된 게시물의 갯수를 카운트하기 위한 메서드
	카운트 한 결과값을 통해 목록에서 게시물의 순번을 출력한다. 
	*/
	public int selectCount(Map<String, Object> map) {
		//카운트 변수
		int totalCount = 0;
		//쿼리문 작성
		String query = "SELECT COUNT(*) FROM mboard";
		//검색어가 있는 경우 where절을 동적으로 추가한다.
		if(map.get("searchWord") != null) {
			query += " and " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		
		try {
			//정적쿼리문(?가 없는 쿼리문) 실행을 위한 Statement 객체 생성
			stmt = con.createStatement();
			// select 쿼리문을 실행 후 ResultSet객체를 반환받음
			rs = stmt.executeQuery(query);
			// 커서를 이동시켜 결과데이터를 읽음
			rs.next();
			// 결과값을 변수에 저장
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	//게시판 리스트 가져오기 (페이지 처리 없음)-스프링
	public ArrayList<MBoardDTO> list(Map<String, Object> map){
		
	String sql = " SELECT * FROM mboard ";
		if(map.get("Word")!=null) {
			sql +=" WHERE "+map.get("Column")+" "
				+ " LIKE '%"+map.get("Word")+"%' ";
		}
		sql += " ORDER BY mboard_num DESC";
		
		/*
		RowMapper가 select를 통해 얻어온 ResultSet을 DTO객체에
		저장하고, List컬렉션에 적재하여 반환한다. 그러므로 DAO에서
		개발자가 반복적으로 하던 작업을 자동으로 처리해 준다.
		*/
		return (ArrayList<MBoardDTO>)
				template.query(sql, new BeanPropertyRowMapper<MBoardDTO>(MBoardDTO.class));
		}
	

		
	
	//게시물의 갯수 카운트-스프링
	public int getTotalCount(Map<String, Object> map)
	{
		String sql = "SELECT COUNT(*) FROM mboard";
		if(map.get("Word")!=null) {
			sql +=" WHERE "+map.get("Column")+" "
				+ "		Like '%"+map.get("Word")+"%' ";
		}
		
		//쿼리문에서 count(*)을 통해 반환되는 값을 정수형태로 가져온다.
		return template.queryForObject(sql, Integer.class);
	}
	//게시물의 페이징-스프링
	public ArrayList<MBoardDTO> listPage(
			Map<String, Object> map){

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String sql = ""
				+"SELECT * FROM ("
				+"    SELECT Tb.*, rownum rNum FROM ("
				+"        SELECT * FROM mboard "			
				+" ORDER BY mboard_num DESC"
				+"    ) Tb"
				+")"
				+" WHERE rNum BETWEEN "+start+" and "+end;
		
		return (ArrayList<MBoardDTO>)
			template.query(sql, 
				new BeanPropertyRowMapper<MBoardDTO>(
						MBoardDTO.class));
	}

	//게시물 조회수 증가
	public void updateCount(final String num)
	{
		//쿼리문 작성
		String sql = "UPDATE mboard SET "
				+ " mboard_count=mboard_count+1 "
				+ " WHERE mboard_num=? ";
		
		/*
		행의 변화를 주는 쿼리문 실행이므로 update메서드를 사용한다.
		첫번째 인자는 쿼리문, 두번째 인자는 익명클래스를 통해 인파라미터를 설정한다.
		*/
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(num));
			}
		});
	}
	
	public MBoardDTO view(String num)
	{
		//조회수 증가 위한 메서드 호출
		updateCount(num);
		
		MBoardDTO dto = new MBoardDTO();
		String sql = "SELECT * FROM mboard "
				+ " WHERE mboard_num="+num;
		try {
			/*
			queryForObject() 메서드는 쿼리문을 실행한 후 반드시 하나의 결과를
			반환해야 한다. 그렇지 않으면 에러가 발생하게 되므로 예외처리를 하는것이
			좋다.
			*/
			dto = template.queryForObject(sql, new BeanPropertyRowMapper<MBoardDTO>(MBoardDTO.class));
			/*
			BeanPropertyRowMapper 클래스는 쿼리의 실행결과를  DTO에 저장해주는 역할을
			한다.이떄 테이블의 컬럼명과 DTO의 멤버변수명은 일치해야 한다.
			*/
		}
		catch (Exception e) {
			System.out.println("View() 실행시 예외발생");
		}
		return dto; 
	}
	
	
	
	/*
	목록에 출력할 게시물을 오라클로부터 추출하기 위한 쿼리문 실행 (페이지처리 없음) 
	*/
	public List<MBoardDTO> selectList(Map<String, Object> map) {
		/*
		board테이블에서 select한 결과데이터를 저장하기 위한 리스트 컬렉션
		여러가지의 list컬렉션 중 동기화가 보장되는 Vector를 사용한다. 
		*/
		List<MBoardDTO> List = new Vector<MBoardDTO>();
		
		/*
		목록에 출력한 게시물을 추출하기 위한 쿼리문으로 항상 일련번호의
		역순(내림차순)으로 정렬해야 한다. 게시판의 목록은 최근 게시물이
		제일 앞에 노출되기 떄문이다. 
		*/
		String query = "SELECT * FROM mboard";
		// 검색어가 있는 경우에 where 절을 추가한다.
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			//추출된 결과에 따라 반복한다.
			while(rs.next()) {
				// 하나의 레코드를 읽어서 DTO객체에 저장한다.
				MBoardDTO dto = new MBoardDTO();
				
				dto.setMboard_num(rs.getInt(1));
				dto.setMboard_id(rs.getString(2));
				dto.setMboard_title(rs.getString(3));
				dto.setMboard_content(rs.getString(4));
				dto.setMboard_date(rs.getDate(5));
				dto.setMboard_count(rs.getInt(6));
				//리스트 컬렉션에 DTO객체를 추가한다.
				List.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return List;
	}
	
	
	 //사용자가 입력한 내용을 board테이블에 insert 처리하는 메서드
	public int insertWrite(MBoardDTO dto) {
		// 입력결과 확인용 변수
		int result = 0;
		
		try {
			// 인파라미터가 있는 쿼리문 작성(동적쿼리문)
			String query = " INSERT INTO mboard( "
						 + " mboard_num, mboard_id, mboard_title, mboard_content, mboard_date, mboard_count) "
						 + " VALUES ( "
						 + " mboard_seq.nextval, ?, ?, ?, sysdate, 0)";
			
			// 동적쿼리문 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			// 순서대로 인파라미터 설정
			psmt.setString(1, dto.getMboard_id());
			psmt.setString(2, dto.getMboard_title());
			psmt.setString(3, dto.getMboard_content());
			
			//쿼리문 실행 : 입력에 성공한다면 1이 반환된다 실패시 0 반환
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	//상세보기
	public MBoardDTO selectView(String num) {
		MBoardDTO dto = new MBoardDTO();
		
		String query = "SELECT * FROM mboard "
					 + " WHERE mboard_num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			//일련번호는 중복되지 않으므로 if문에서 처리하면 된다.
			
			if(rs.next()) { // ResultSet에서 커서를 이동시켜 레코드를 읽은 후
				// DTO 객체에 레코드의 내용을 추가한다.
				dto.setMboard_num(rs.getInt(1));
				dto.setMboard_id(rs.getString(2));
				dto.setMboard_title(rs.getString(3));
				dto.setMboard_content(rs.getString(4));
				dto.setMboard_date(rs.getDate(5)); //날짜타입이므로 getDate()사용함
				dto.setMboard_count(rs.getInt(6));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//게시물의 조회수를 1 증가 시킨다.
	public void updateVisitCount(int num) {
		// visitcount 컬럼은 number 타입이므로 덧셈이 가능하다.
		String query = "UPDATE mboard SET "
					 + " mboard_count=mboard_count+1 "
					 + " WHERE mboard_num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);
			psmt.executeQuery();
		}
		catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	
	//DTO객체를 받아 게시물 삭제처리
	public int deletePost(String num) {
		int result = 0;
		
		try {
			// 쿼리문 작성
			String query = "DELETE FROM mboard WHERE mboard_num=?";
			
			//prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			// 쿼리 실행
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//게시물 수정 : 수정할 내용을 DTO객체에 저장 후 매개변수로 전달
	public int updateEdit(MBoardDTO dto) {
		int result = 0;
		
		try {
			// update를 위한 쿼리문
			String query = "UPDATE mboard SET "
						 + " mboard_title=?, mboard_content=? "
						 + " WHERE mboard_num=?";
			
			// prepared객체 생성
			psmt = con.prepareStatement(query);
			// 인파라미터 설정
			psmt.setString(1, dto.getMboard_title());
			psmt.setString(2, dto.getMboard_content());
			psmt.setInt(3, dto.getMboard_num());
			//쿼리 실행
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
}
