package membership;

import org.apache.ibatis.annotations.Param;
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
}
