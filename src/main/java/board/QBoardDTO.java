package board;

import lombok.Data;

@Data
public class QBoardDTO {
	
	private int qboard_num; 
	private String qboard_id;
	private String qboard_title;
	private String qboard_content;
	private java.sql.Date qboard_date;	//작성일
	private int qboard_count;	//조회수
	

	
}
