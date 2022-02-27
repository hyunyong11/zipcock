package mybatis;

import java.util.ArrayList;

import lombok.Data;

@Data
public class QParameterDTO {
	//게시물의 일련번호
	private String num;
	//검색어 필드
	private String searchField;
	//검색어(2개 이상을 처리하기 위해 List컬렉션을 사용한다.)
	private ArrayList<String> searchTxt;
	//출력할 게시물의 구간을 설정
	private int start; 	
	private int end;
	
}