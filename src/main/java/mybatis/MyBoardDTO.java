package mybatis;

import java.sql.Date;

import lombok.Data;
@Data
public class MyBoardDTO {
	private int review_num;
	private int mission_num;
	private String review_id;
	private String review_content;
	private int review_point;
	private Date review_date;
	private String mission_category;
	//getter/setter만 생성
	//가상번호 부여를 위한 멤버변수 추가
	private int virtualNum;
	//상세보기 처리를 위한 멤버변수 추가
	private String nowPage;
	private int start;
	private int end;
}
