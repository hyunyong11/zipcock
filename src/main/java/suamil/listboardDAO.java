package suamil;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class listboardDAO extends JDBConnect {

	//부모의 인자생성자를 호출한다. 이때 application내장객체를 매개변수로 전달한다.
		public listboardDAO(ServletContext application) {
			//내장객체를 통해 web.xml에 작성된 컨텍스트 초기화 파라미터를 얻어온다.
			super(application);
		}
		
		public listboardDAO(String drv, String url, String id, String pw) {
			super(drv, url, id, pw);
		}
		
		
		public int selectCount(Map<String, Object> map) {
			//카운트 변수
			int totalCount = 0;
			//쿼리문 작성
			String query = "SELECT COUNT(*) FROM pgoods";
			//검색어가 있는 경우 where절을 동적으로 추가한다.
			if(map.get("searchWord") != null) {
				query += " WHERE " + map.get("searchField") + " "
						+ " LIKE '%" + map.get("searchWord") + "%'";
			}
			
			try {
				//정적쿼리문(?가 없는 쿼리문) 실행을 위한 Statement객체 생성
				stmt = con.createStatement();
				//select 쿼리문을 실행 후 ResultSet객체를 반환받음
				rs = stmt.executeQuery(query);
				//커서를 이동시켜 결과데이터를 읽음
				rs.next();
				//결과값을 변수에 저장
				totalCount = rs.getInt(1);
			}
			catch (Exception e) {
				System.out.println("게시물 수를 구하는 중 예외 발생");
				e.printStackTrace();
			}
			
			return totalCount;
		}
		
		
		//게시판의 페이징 처리를 위한 메서드
		public List<listboardDTO> selectListPage(Map<String, Object> map){
			List<listboardDTO> bbs = new Vector<listboardDTO>();
			
			//3개의 서브쿼리문을 통한 페이지 처리
			String query =" SELECT * FROM pgoods ";
			//검색 조건 추가 (검색어가 있는 경우에만 where절이 추가됨)
			if (map.get("searchWord") != null) {
				query += " WHERE " + map.get("searchField")
						+" LIKE '%" + map.get("searchWord") + "%' ";
			}
			
			query += " ORDER BY goods_num DESC  LIMIT ?, ? ";

			
			try {
				//쿼리 실행을 위한 prepared 객체 생성
				psmt = con.prepareStatement(query);
				//인파라미터 설정 : 구간을 위한 start, end를 설정함
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
				//쿼리문 실행
				rs = psmt.executeQuery();
				
				//select한 게시물의 갯수만큼 반복
				while (rs.next()) {
					//한 행(게시물 하나)의 데이터를 DTO에 저장
					listboardDTO dto = new listboardDTO();
					//
					dto.setGoods_num(rs.getString("goods_num"));
					dto.setGoods_choice(rs.getString("goods_choice"));
					dto.setGoods_image(rs.getString("goods_image"));
					dto.setGoods_id(rs.getString("goods_id"));
					dto.setGoods_price(rs.getString("goods_price"));
					dto.setGoods_stampprice(rs.getString("goods_stampprice"));
					dto.setGoods_count(rs.getString("goods_count"));
					dto.setGoods_content(rs.getString("goods_content"));
					dto.setReg_date(rs.getDate("reg_date"));
					
					//반환할 결과 목록에 게시물 추가
					bbs.add(dto);
				}
			}
			catch (Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			
			//목록 반환
			return bbs;
		}
		
		public listboardDTO selectView(String num) {
			
			listboardDTO dto = new listboardDTO();
			//join을 이용해서 member테이블의 name컬럼까지 가져온다.
			String query = "SELECT * FROM "
						+ " pgoods WHERE goods_num=? ";
			
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, num);
				rs = psmt.executeQuery();
				//일련번호는 중복되지 않으므로 if문에서 처리하면 된다.
				if(rs.next()) {//ResultSet에서 커서를 이동시켜 레코드를 읽은 후
					//DTO객체에 레코드의 내용을 추가한다.
					dto.setGoods_num(rs.getString(1));
					dto.setGoods_choice(rs.getString(2));
					dto.setGoods_image(rs.getString(3));
					dto.setGoods_id(rs.getString(4));
					dto.setGoods_price(rs.getString(5));
					dto.setGoods_stampprice(rs.getString(6));
					dto.setGoods_count(rs.getString(7));
					dto.setGoods_content(rs.getString(8));
					dto.setReg_date(rs.getDate(9));
				}
			}
			
			catch (Exception e) {
				System.out.println("게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			
			return dto;
		}
}
