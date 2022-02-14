package board;

import lombok.Data;

@Data
public class MBoardDTO {
	
	private int mboard_num; 
	private String mboard_id;
	private String mboard_title;
	private String mboard_content;
	private java.sql.Date mboard_date;	//작성일
	private int mboard_count;	//조회수
	private String mboard_flag;
	//가상번호 부여를 위한 멤버변수 추가
	private int virtualNum;
	//상세보기 처리를 위한 멤버변수 추가
	private String nowPage;
}
