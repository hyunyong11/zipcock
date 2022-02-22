package mybatis;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Data;
@Data
//파라미터 처리를 위한 DTO객체
public class ParameterDTO {
	private String review_id;//사용자아이디
	private String review_num;//게시판일련번호
	private String review_point;
	private String review_content;
	private Date review_date;
	private String mission_num;
	private String mission_category;
	private int start; 	
	private int end;
	 
	


}
