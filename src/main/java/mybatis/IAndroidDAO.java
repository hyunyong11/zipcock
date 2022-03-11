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
	
	public MissionDTO helperLocation(MissionDTO missionDTO);
	
	public int insertLocation(MissionDTO missionDTO);
	
	public int complete(MissionDTO missionDTO);
	
	public int Hcomplete(MissionDTO missionDTO);
	
	public int matching(MissionDTO missionDTO);
	
	public MBoardDTO mboardView(MBoardDTO mboardDTO);
	
	public ArrayList<MBoardDTO> mboardList();
	
	public MemberDTO ImemberDelete(MemberDTO memberDTO);

    public ArrayList<MissionDTO> missionList();
    
    public ArrayList<MissionDTO> missionView(MissionDTO missionDTO);
    
    public ArrayList<MissionDTO> missionListSearch (mission.ParameterDTO parameterDTO);
    
    public ArrayList<ParameterDTO> reviewList(ParameterDTO parameterDTO);
    
    public int Reviewmodify(ParameterDTO parameterDTO);
    
    public ParameterDTO Reviewdelete(ParameterDTO parameterDTO);
    
    public int memberInfoEdit(MemberDTO memberDTO);
    
    public int hmemberInfoEdit(MemberDTO memberDTO);
    
    public MemberDTO idCheck(MemberDTO memberDTO);
    
    public void memberJoin(MemberDTO memberDTO);
    
    public void cMemberJoin(MemberDTO memberDTO);
    	
    public MemberDTO findId(MemberDTO memberDTO);
	
	public MemberDTO findPass(MemberDTO memberDTO);
	
	public void missionRegist(MissionDTO missionDTO);	
	
	public ArrayList<MissionDTO> chatList(MissionDTO missionDTO);
	
    public ArrayList<MissionDTO> simList(MissionDTO missionDTO);
    
    public ArrayList<MissionDTO> HsimList(MissionDTO missionDTO);

}
