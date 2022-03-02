package mybatis;

import java.util.ArrayList;

import membership.MemberDTO;
import mission.MissionDTO;

public interface IAndroidDAO {

	public ArrayList<MemberDTO> memberList();
	
	public MemberDTO memberInfo(MemberDTO memberDTO);
	
	public MemberDTO memberLogin(MemberDTO memberDTO);
	
}
