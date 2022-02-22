package mission;

import lombok.Data;

// 파라미터 처리를 위한 DTO객체
@Data
public class ParameterDTO {
	private String user_id; 	// 사용자아이디
	private String board_idx; 	// 게시판일련번호
	
	// 검색기능 추가
	private String searchField; // 검색할 필드명
	private String searchTxt; 	// 검색어
	// 페이징 기능 추가
	private int start; 			// 게시물 구간의 시작
	private int end;			// 게시물 구간의 끝
	
}
