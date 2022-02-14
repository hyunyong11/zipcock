package mission;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class MissionDAO extends JDBConnect {
	
	public MissionDAO(ServletContext application) {
		super(application);
	}
	
	public MissionDAO(String drv, String url, String id, String pw) {
		   super(drv, url, id, pw);
	}
	
	public List<MissionDTO> getmission(Map<String, Object> map){
		List<MissionDTO> bbs = new Vector<MissionDTO>();

		String query = "SELECT * FROM MISSION";
		
		try {
			// 쿼리 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			//쿼리문 실행
			rs = psmt.executeQuery();
			while (rs.next()) {
				// 한 행(게시물 하나)의 데이터를 DTO에 저장
				MissionDTO dto = new MissionDTO();
				
				dto.setNum(rs.getInt(1));
				dto.setId(rs.getString(2));
	            dto.setCategory(rs.getInt(3));
	            dto.setName(rs.getString(4));
	            dto.setContent(rs.getString(5));
	            dto.setFile(rs.getString(6));
	            dto.setSex(rs.getInt(7));
	            dto.setHid(rs.getString(8));
	            dto.setStart(rs.getString(9));
	            dto.setEnd(rs.getString(10));
	            dto.setWaypoint(rs.getInt(11));
	            dto.setMission(rs.getString(12));
	            dto.setReservation(rs.getString(13));
	            dto.setTime(rs.getString(14));
	            dto.setCost(rs.getInt(15));
	            dto.setStatus(rs.getInt(16));
				
				bbs.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("미션 조회  예외 발생");
		e.printStackTrace();
		}	
		return bbs;	
	}
}
