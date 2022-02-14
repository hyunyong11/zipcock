package membership;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;
/*
DAO(Data Access Object) : 실제 데이터베이스에 접근하여
   여러가지 CRUD작업을 하기 위한 객체.
*/
//DB 연결을 위한 클래스를 상속한다.
public class MemberDAO extends JDBConnect{
   
   //인자가 4개인 부모의 생성자를 호출하여 연결한다.
   public MemberDAO(ServletContext application) {
      super(application);
   }
   
   
   public MemberDAO(String drv, String url, String id, String pw) {
	   super(drv, url, id, pw);
   }

	public MemberDAO(){}
   
   /*
   사용자가 입력한 아이디, 패스워드를 통해 회원테이블을 확인한 후 
   존재하는 정보인 경우 DTO객체에 그 정보를 담아 반환한다.
   */
   public MemberDTO getMemberVO(String uid, String upass) {
      
      MemberDTO dto = new MemberDTO();
      //회원로그인을 위한 쿼리문
      String query = "SELECT * FROM member WHERE member_id=? AND member_pass=?";
      
      try {
         psmt = con.prepareStatement(query);
         //쿼리문에 사용자가 입력한 아이디, 패스워드를 설정
         psmt.setString(1, uid);
         psmt.setString(2, upass);
         //쿼리실행
         rs = psmt.executeQuery();
         
         //회원정보가 존재한다면 DTO객체에 회원정보를 저장한다.
         if(rs.next()) {
			dto.setMember_name(rs.getString(1));
			dto.setMember_id(rs.getString(2));
            dto.setMember_pass(rs.getString(3));
            dto.setMember_email(rs.getString(4));
            dto.setMember_age(rs.getString(5));
            dto.setMember_sex(rs.getInt(6));
            dto.setMember_phone(rs.getString(7));
            dto.setMember_missionN(rs.getInt(8));
            dto.setMember_status(rs.getInt(9));
//	          헬퍼
            dto.setMember_bank(rs.getString(10));
            dto.setMember_account(rs.getString(11));
            dto.setMember_vehicle(rs.getInt(12));
            dto.setMember_introduce(rs.getString(13));
            dto.setMember_review(rs.getInt(16));
            dto.setMember_missionC(rs.getInt(17));
            dto.setMember_point(rs.getInt(18));
				
         }
      }
      catch (Exception e) {
          e.printStackTrace();
      }

      return dto; 
   }
   
 		
	public List<MemberDTO> selectListPage(Map<String, Object> map){
		List<MemberDTO> bbs = new Vector<MemberDTO>();
		
		
		//3개의서브 쿼리문을 통한
		String query = "SELECT * FROM MEMBER";
		
		try {
			// 쿼리 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			//쿼리문 실행
			rs = psmt.executeQuery();
			while (rs.next()) {
				// 한 행(게시물 하나)의 데이터를 DTO에 저장
				MemberDTO dto = new MemberDTO();
				
				dto.setMember_name(rs.getString(1));
				dto.setMember_id(rs.getString(2));
	            dto.setMember_pass(rs.getString(3));
	            dto.setMember_email(rs.getString(4));
	            dto.setMember_age(rs.getString(5));
	            dto.setMember_sex(rs.getInt(6));
	            dto.setMember_phone(rs.getString(7));
	            dto.setMember_missionN(rs.getInt(8));
	            dto.setMember_status(rs.getInt(9));
//	          헬퍼
	            dto.setMember_bank(rs.getString(10));
	            dto.setMember_account(rs.getString(11));
	            dto.setMember_vehicle(rs.getInt(12));
	            dto.setMember_introduce(rs.getString(13));
	            dto.setMember_review(rs.getInt(16));
	            dto.setMember_missionC(rs.getInt(17));
	            dto.setMember_point(rs.getInt(18));
				
				bbs.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("유저 조회  예외 발생");
		e.printStackTrace();
		}	
		return bbs;	
	}
	
	public int updateType(MemberDTO dto) {
		int result = 0;
		
		try {
			//update를 위한 커리
			String query = "UPDATE member SET "
					+ " member_status=? "
					+ " WHERE member_id=?";
			//prepare객체 생성
			psmt = con.prepareStatement(query);
			psmt.setString(2, dto.getMember_id());
			psmt.setInt(1, dto.getMember_status());
			
			result = psmt.executeUpdate();	
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생 ");
		e.printStackTrace();
		}
		return result;
	}
	
	
	public MemberDTO viewMember(String userId)
		{
			MemberDTO dto = new MemberDTO();
			
			String query = "SELECT * FROM member WHERE member_id=?";
			
			try
			{
				psmt = con.prepareStatement(query);
				
				psmt.setString(1, userId);
				
				rs = psmt.executeQuery();
				
				if (rs.next())
				{
					
	
					
					dto.setMember_name(rs.getString(1));
					dto.setMember_id(rs.getString(2));
		            dto.setMember_pass(rs.getString(3));
		            dto.setMember_email(rs.getString(4));
		            dto.setMember_age(rs.getString(5));
		            dto.setMember_sex(rs.getInt(6));
		            dto.setMember_phone(rs.getString(7));
		            dto.setMember_missionN(rs.getInt(8));
		            dto.setMember_status(rs.getInt(9));
//		          헬퍼
		            dto.setMember_bank(rs.getString(10));
		            dto.setMember_account(rs.getString(11));
		            dto.setMember_vehicle(rs.getInt(12));
		            dto.setMember_introduce(rs.getString(13));
		            dto.setMember_review(rs.getInt(16));
		            dto.setMember_missionC(rs.getInt(17));
		            dto.setMember_point(rs.getInt(18));
				}
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			
		return dto;
	}
	
	
	//아이디중복체크
	public boolean idCheck(String id) {
		boolean isCorr = false;
		  
		String query = "select member_id from member where member_id = ?";
		  
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
		 
			if (rs.next()) { isCorr = true; }
		     
	    }
		catch (Exception e) {
	    	e.printStackTrace();
	    }
		
		return isCorr;
	}
	
	
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
}
