package mission;

import org.springframework.stereotype.Service;

@Service
public interface MissionImpl {

	
	//심부름 등록
	public int mission(MissionDTO missionDTO);
	
}
