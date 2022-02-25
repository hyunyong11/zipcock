package membership;

import java.util.ArrayList;

import org.springframework.stereotype.Service;


@Service
public interface MemberImpl {

	// String, int가 있으니 다 가능한 void로 작성
	public void member(MemberDTO MemberDTO);

	//헬퍼가입
	public void helper(MemberDTO MemberDTO);
	
	//아이디 중복체크
	public boolean idCheck(String id);

	//로그인
	public MemberDTO login (String id, String pass);
	
	//아이디찾기
	public MemberDTO findId (String name, String email);
		
	//회원정보 수정(조회)
	public ArrayList<MemberDTO> getMemberInfo(String id);
	
	//회원정보 수정(헬퍼)
	public void helperMyPage(MemberDTO memberDTO);
	
	//회원정보 수정(사용자)
	public void userMyPage(MemberDTO memberDTO);
	
	//카카오 로그인
	public MemberDTO kakaoLogin(String id);
	
	//회원탈퇴
	public void memberDelete(String member_id);
	
}
