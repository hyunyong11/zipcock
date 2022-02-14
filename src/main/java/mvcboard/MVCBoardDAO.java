package mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class MVCBoardDAO extends JDBConnect {
	public MVCBoardDAO() {
		super();
	}
	// 부모의 인자생성자를 호출한다. 이때 application내장객체를 매개변수로 전달한다.
	public MVCBoardDAO(ServletContext application) {
		// 내장객체를 통해 web.xml에 작성된 컨텍스트 초기화 파라미터를 얻어온다.
		super(application);
	}
	
	public MVCBoardDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}

	public int selectCount(Map<String, Object> map) {
		// 카운트 변수
		int totalCount = 0;
		// 쿼리문 작성
		String query = "SELECT COUNT(*) FROM pboard where flag='"+map.get("flag")+"'";
		//검색어가 있는 경우 where절을 동적으로 추가한다.
		if(map.get("searchWord") != null) {
			query += " and " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}

		try {
			// 정적쿼리문(?가 없는 쿼리문) 실행을 위한 Statement객체 생성
			stmt = con.createStatement();
			// select 쿼리문을 실행 후 ResultSet객체에 반환받음
			rs = stmt.executeQuery(query);
			// 커서를 이동시켜 결과데이터를 읽음
			rs.next();
			// 결과값을 변수에 저장
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}

	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();

		String query =" SELECT * FROM pboard WHERE flag='"+map.get("flag")+"'";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
				+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " ORDER BY num DESC LIMIT ?,? ";
			
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
            psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();

			while (rs.next()) {

				MVCBoardDTO dto = new MVCBoardDTO();

				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setName(rs.getString("name"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setFlag(rs.getString("flag"));
				dto.setVisitcount(rs.getInt("Visitcount"));

				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	public void downCountPlus(String idx) {
        String sql = "UPDATE pboard SET "
                + " downcount=downcount+1 "
                + " WHERE idx=? "; 
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, idx);
            psmt.executeUpdate();
        }
        catch (Exception e) {}
    }

	// 새로운 게시물에 대한 입력처리
	public int insertWrite(MVCBoardDTO dto) {
		// 입력결과 확인용 변수
		int result = 0;
		try {
			// 인파라미터가 있는 쿼리문 작성(동적쿼리문)
			String query = " INSERT INTO pboard ( " 
					+ " name, id, title, visitcount, content, ofile, sfile, flag) " 
					+ " VALUES ( "
					+ " ?,?, ?, 0, ?, ?, ?, ?)";
			// 동적쿼리문 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			// 순서대로 인파라미터 설정
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getOfile());
			psmt.setString(6, dto.getSfile());
			psmt.setString(7, dto.getFlag());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 주어진 일련번호에 해당하는 게시물을 DTO에 담아 반환한다.
	public MVCBoardDTO selectView(String num) {
		MVCBoardDTO dto = new MVCBoardDTO();// DTO 객체 생성
		String query = "SELECT * FROM pboard WHERE num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();

			if (rs.next()) {// 결과를 DTO에 저장
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setName(rs.getString("name"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setFlag(rs.getString("flag"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getInt("Visitcount"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	// 주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킨다.
	public void updateVisitCount(String num) {
		String query = " UPDATE pboard SET " + " visitcount=visitcount+1 " + " WHERE num=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.execute();
		} catch (Exception e) {
			System.out.println("개시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	// 패스워드 검증을 위해 해당 게시물이 존재하는지 확인
	public boolean confirmPassword(String pass, String num) {
		boolean isCorr = true;
		try {
			String sql = "SELECT COUNT(*) FROM pboard WHERE pass=? AND num=?";
			// 인파라미터 설정
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, num);
			rs = psmt.executeQuery();
			// 커서 이동을 위한 next() 호출. count()함수를 항상 결과를 반환하므로
			// if문은 별도로 필요하지 않다.
			rs.next();
			if (rs.getInt(1) == 0) { // 결과가 없을때 false로 처리
				isCorr = false;
			}
		} catch (Exception e) {
			isCorr = false; // 예외가 발생해도 확인이 안되므로 false로 처리
			e.printStackTrace();
		}
		return isCorr;
	}

	// 일련번호에 해당하는 게시물 삭제
	public int deletePost(String num) {
		int result = 0;
		try {
			String query = "DELETE FROM pboard WHERE num=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 일련번호와 패스워드가 일치할때만 게시물 업데이트 처리
	public int updatePost(MVCBoardDTO dto) {
		int result = 0;
		try {
			String query = "UPDATE pboard " + " SET title=?, name=?, content=?, ofile=?, sfile=? "
					+ " WHERE num=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getNum());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

}
