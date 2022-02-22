package mission;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import membership.MemberDTO;


@Service
public interface MissionImpl {

	
	/*
	 로그인 처리를 위한 추상메서드
	 	: 아이디, 패스워드와 일치하는 회원정보가 있는 경우
	 	MemberVO객체를 통해 반환 받는다.
	 */
	public MemberDTO login (String member_id, String member_pass);
	
	//심부름 등록
	public int mission(MissionDTO missionDTO);
	

	
	/*
	 방명록 1차 버전에서 사용하는 메서드
	 게시물 수 카운트와 목록에 출력할 게시물 가져오기
	 */
	public int getTotalCount();
	public ArrayList<MissionDTO> listPage(int s, int e);
	
	/*
	 방명록 2차 버전에서 사용할 메서드
	 파라미터를 저장한 DTO객체를 매개변수로 사용한다.
	 즉, Mapper로 DTO를 통해 파라미터를 전달한다.
	 */
	public int getTotalCountSearch(ParameterDTO parameterDTO);
	public ArrayList<MissionDTO> listPageSearch (ParameterDTO parameterDTO);
	
	// 기존 게시물의 내용을 읽어오기 위한 메서드
	public MissionDTO view(ParameterDTO parameterDTO);
}
