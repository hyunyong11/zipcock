package membership;

import lombok.Data;

@Data
public class MemberDTO {

	private String member_id; //아이디
	private String member_pass; //패스워드
	private String member_name; //이름
	private String member_email; //이메일
	private String member_age; //연령대
	private int member_sex; // 성별
	private String member_phone; //연락처
	
	private int member_missionN;
	private int member_status;
	
	//헬퍼추가정보
	private String member_bank;
	private String member_account;
	private int member_vehicle;
	private String member_introduce;
	private String member_ofile;
	private String member_sfile;
	private int member_review;
	private int member_missionC;
	private int member_point;
}
