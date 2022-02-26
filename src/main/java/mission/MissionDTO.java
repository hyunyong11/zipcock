package mission;

import lombok.Data;

@Data
public class MissionDTO {

	private int mission_num;
	private String mission_id;
	private String mission_category;
	private String mission_name;
	private String mission_content;
	private String mission_ofile;
	private String mission_sfile;
	private int mission_sex;
	private String mission_Hid;
	private String mission_start;
	private String mission_waypoint;
	private String mission_end;
	private int mission_mission;
	private String mission_reservation;
	private String mission_time;
	private int mission_cost;
	private int mission_status;
	
	//가상번호 부여를 위한 멤버변수 추가
	private int virtualNum;
	//상세보기 처리를 위한 멤버변수 추가
	private String nowPage;
	private int start;
	private int end;
}
