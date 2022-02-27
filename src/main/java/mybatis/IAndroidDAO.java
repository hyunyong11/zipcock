package mybatis;

import java.util.ArrayList;

import membership.MemberDTO;

public interface IAndroidDAO {

	public ArrayList<MemberDTO> memberList();
	
	public MemberDTO memberLogin(MemberDTO memberDTO);
}
