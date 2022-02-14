package mvcboard;

public class MVCBoardDTO {
	//멤버변수 : board테이블의 컬럼과 동일한 이름으로 생성
	
	private String num;		//일련번호
	private String title;	//제목
	private String content;	//내용
	private java.sql.Date postdate;	//작성일
	private String id;		//작성자 아이디
	private int visitcount;	//조회수
	private String ofile;	//원본파일명
	private String sfile;	//저장된파일명
	private String flag;	//파라미터분기
	private String name;	//작성자 이름


	
	//getter/setter 메서드
	//생성자 : 우리가 작성하지 않으므로, 디폴트 생성자가 추가될것임.
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	
}
