package mybatis;

import java.util.ArrayList;

import board.MBoardDTO;
import membership.MemberDTO;
import mission.MissionDTO;

public interface IAndroidDAO {

	public ArrayList<MemberDTO> memberList();
	
	public MemberDTO memberInfo(MemberDTO memberDTO);
	
	public MemberDTO memberLogin(MemberDTO memberDTO);
	
	public MissionDTO delstart(MissionDTO missionDTO);
	
	public MBoardDTO mboardView(MBoardDTO mboardDTO);
	
	public ArrayList<MBoardDTO> mboardList();
	
	public MemberDTO ImemberDelete(MemberDTO memberDTO);

    public ArrayList<MissionDTO> missionList();
    
    public ArrayList<MissionDTO> missionView(MissionDTO missionDTO);
}
