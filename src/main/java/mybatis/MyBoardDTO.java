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
	

}
