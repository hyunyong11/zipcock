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
	
	public MissionDAO() {}
	
	public List<MissionDTO> getmission(Map<String, Object> map){
		List<MissionDTO> bbs = new Vector<MissionDTO>();

		String query = "SELECT * FROM MISSION WHERE Mission_status=1";
		
		try {
			// 쿼리 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			//쿼리문 실행
			rs = psmt.executeQuery();
			while (rs.next()) {
				// 한 행(게시물 하나)의 데이터를 DTO에 저장
				MissionDTO dto = new MissionDTO();
				
				dto.setMission_num(rs.getInt(1));
				dto.setMission_id(rs.getString(2));
	            dto.setMission_category(rs.getString(3));
	            dto.setMission_name(rs.getString(4));
	            dto.setMission_content(rs.getString(5));
	            dto.setMission_ofile(rs.getString(6));
	            dto.setMission_sfile(rs.getString(7));
	            dto.setMission_sex(rs.getInt(8));
	            dto.setMission_Hid(rs.getString(9));
	            dto.setMission_start(rs.getString(10));
	            dto.setMission_end(rs.getString(11));
	            dto.setMission_waypoint(rs.getString(12));
	            dto.setMission_mission(rs.getInt(13));
	            dto.setMission_reservation(rs.getString(14));
	            dto.setMission_time(rs.getString(15));
	            dto.setMission_cost(rs.getInt(16));
	            dto.setMission_status(rs.getInt(17));
				
				bbs.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("미션 조회  예외 발생");
		e.printStackTrace();
		}	
		return bbs;	
	}
	
	public List<MissionDTO> getmission1(Map<String, Object> map){
		List<MissionDTO> bbs = new Vector<MissionDTO>();

		String query = "SELECT * FROM MISSION WHERE Mission_status=2";
		
		try {
			// 쿼리 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			//쿼리문 실행
			rs = psmt.executeQuery();
			while (rs.next()) {
				// 한 행(게시물 하나)의 데이터를 DTO에 저장
				MissionDTO dto = new MissionDTO();
				
				dto.setMission_num(rs.getInt(1));
				dto.setMission_id(rs.getString(2));
	            dto.setMission_category(rs.getString(3));
	            dto.setMission_name(rs.getString(4));
	            dto.setMission_content(rs.getString(5));
	            dto.setMission_ofile(rs.getString(6));
	            dto.setMission_sfile(rs.getString(7));
	            dto.setMission_sex(rs.getInt(8));
	            dto.setMission_Hid(rs.getString(9));
	            dto.setMission_start(rs.getString(10));
	            dto.setMission_end(rs.getString(11));
	            dto.setMission_waypoint(rs.getString(12));
	            dto.setMission_mission(rs.getInt(13));
	            dto.setMission_reservation(rs.getString(14));
	            dto.setMission_time(rs.getString(15));
	            dto.setMission_cost(rs.getInt(16));
	            dto.setMission_status(rs.getInt(17));
				
				bbs.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("미션 조회  예외 발생");
		e.printStackTrace();
		}	
		return bbs;	
	}
	
	public List<MissionDTO> getmission2(Map<String, Object> map){
		List<MissionDTO> bbs = new Vector<MissionDTO>();

		String query = "SELECT * FROM MISSION WHERE Mission_status=3";
		
		try {
			// 쿼리 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			//쿼리문 실행
			rs = psmt.executeQuery();
			while (rs.next()) {
				// 한 행(게시물 하나)의 데이터를 DTO에 저장
				MissionDTO dto = new MissionDTO();
				
				dto.setMission_num(rs.getInt(1));
				dto.setMission_id(rs.getString(2));
	            dto.setMission_category(rs.getString(3));
	            dto.setMission_name(rs.getString(4));
	            dto.setMission_content(rs.getString(5));
	            dto.setMission_ofile(rs.getString(6));
	            dto.setMission_sfile(rs.getString(7));
	            dto.setMission_sex(rs.getInt(8));
	            dto.setMission_Hid(rs.getString(9));
	            dto.setMission_start(rs.getString(10));
	            dto.setMission_end(rs.getString(11));
	            dto.setMission_waypoint(rs.getString(12));
	            dto.setMission_mission(rs.getInt(13));
	            dto.setMission_reservation(rs.getString(14));
	            dto.setMission_time(rs.getString(15));
	            dto.setMission_cost(rs.getInt(16));
	            dto.setMission_status(rs.getInt(17));
				
				bbs.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("미션 조회  예외 발생");
		e.printStackTrace();
		}	
		return bbs;	
	}
	
	public List<MissionDTO> missionCDetail(Map<String, Object> map){
		List<MissionDTO> bbs = new Vector<MissionDTO>();

		String query = "SELECT * FROM MISSION ";
		
		try {
			// 쿼리 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			//쿼리문 실행
			rs = psmt.executeQuery();
			while (rs.next()) {
				// 한 행(게시물 하나)의 데이터를 DTO에 저장
				MissionDTO dto = new MissionDTO();
				
				dto.setMission_num(rs.getInt(1));
				dto.setMission_id(rs.getString(2));
	            dto.setMission_category(rs.getString(3));
	            dto.setMission_name(rs.getString(4));
	            dto.setMission_content(rs.getString(5));
	            dto.setMission_ofile(rs.getString(6));
	            dto.setMission_sfile(rs.getString(7));
	            dto.setMission_sex(rs.getInt(8));
	            dto.setMission_Hid(rs.getString(9));
	            dto.setMission_start(rs.getString(10));
	            dto.setMission_end(rs.getString(11));
	            dto.setMission_waypoint(rs.getString(12));
	            dto.setMission_mission(rs.getInt(13));
	            dto.setMission_reservation(rs.getString(14));
	            dto.setMission_time(rs.getString(15));
	            dto.setMission_cost(rs.getInt(16));
	            dto.setMission_status(rs.getInt(17));
				
				bbs.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("미션 조회  예외 발생");
		e.printStackTrace();
		}	
		return bbs;	
	}
	
	public List<MissionDTO> missionHDetail(Map<String, Object> map){
		List<MissionDTO> bbs = new Vector<MissionDTO>();

		String query = "SELECT * FROM MISSION ";
		
		try {
			// 쿼리 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			//쿼리문 실행
			rs = psmt.executeQuery();
			while (rs.next()) {
				// 한 행(게시물 하나)의 데이터를 DTO에 저장
				MissionDTO dto = new MissionDTO();
				
				dto.setMission_num(rs.getInt(1));
				dto.setMission_id(rs.getString(2));
	            dto.setMission_category(rs.getString(3));
	            dto.setMission_name(rs.getString(4));
	            dto.setMission_content(rs.getString(5));
	            dto.setMission_ofile(rs.getString(6));
	            dto.setMission_sfile(rs.getString(7));
	            dto.setMission_sex(rs.getInt(8));
	            dto.setMission_Hid(rs.getString(9));
	            dto.setMission_start(rs.getString(10));
	            dto.setMission_end(rs.getString(11));
	            dto.setMission_waypoint(rs.getString(12));
	            dto.setMission_mission(rs.getInt(13));
	            dto.setMission_reservation(rs.getString(14));
	            dto.setMission_time(rs.getString(15));
	            dto.setMission_cost(rs.getInt(16));
	            dto.setMission_status(rs.getInt(17));
				
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
