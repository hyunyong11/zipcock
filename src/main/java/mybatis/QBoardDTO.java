package mybatis;

import lombok.Data;

@Data
public class QBoardDTO {
	
	private String num;
	
    private String title;
    private String content;
    private String id;    
    //private java.sql.Date postdate;
    private String postdate;
    private String visitcount;
	
}
