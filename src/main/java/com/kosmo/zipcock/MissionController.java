package com.kosmo.zipcock;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mission.MissionDTO;
import mission.MissionImpl;


@Controller
public class MissionController {

	private SqlSession sqlSession;
	
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("My MissionController 준비끝");
		
	}
	

	
	///mission/regist.do
	//심부름 등록 요청(이미지업로드)
	@RequestMapping(value="/mission/regist.do", method=RequestMethod.POST)
	public String missonRegist(MissionDTO missionDTO, MultipartHttpServletRequest req, Model model) throws Exception {
		
		
		//물리적 경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		MultipartFile mfile = null;
		// 파일정보를 저장한 Map컬렉션을 2개이상 저장하기 위한 용도의 List컬렉션
		List<Object> resultList = new ArrayList<Object>();
		
		try {
			
			//업로드폼의 file속성의 필드를 가져온다. (여기서는 2개임)
			Iterator itr = req.getFileNames();
			
			//갯수만큼 반복
			while(itr.hasNext()) {
				//전송된 파일명을 읽어온다.
				mfile = req.getFile(itr.next().toString());
				
				//한글깨짐방지 처리 후 전송된 파일명을 가져온다.
				String originalName = new String(mfile.getOriginalFilename().getBytes(), "UTF-8");
				
				//서버로 전송된 파일이 없다면 파일없이 서버에 저장
				
				if("".equals(originalName)) continue;
					
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				//UUID를 통해 생성된 문자열과 확장자를 결합해서 파일명을 완성한다.
				String saveFileName = getUuid()	+ ext;
				
				//물리적 경로에 새롭게 생성된 파일명으로 파일 저장
				mfile.transferTo(new File(path + File.separator + saveFileName));
				
				missionDTO.setMission_ofile(originalName);
				missionDTO.setMission_sfile(saveFileName);
				
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		

		missionDTO.setMission_start(req.getParameter("mission_start1")+"|"+req.getParameter("mission_start2"));
		missionDTO.setMission_waypoint(req.getParameter("mission_waypoint1")+"|"+req.getParameter("mission_waypoint2"));
		missionDTO.setMission_end(req.getParameter("mission_end1")+"|"+req.getParameter("mission_end2"));
		
		int result = sqlSession.getMapper(MissionImpl.class).mission(missionDTO);
		System.out.println("입력결과 : "+ result);
		
		return "mission/missionAlert";
	}
	

	
	//서버 업로드를 위한 메소드
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		//System.out.println("생성된UUID-1:"+uuid);
		
		return uuid;
	}
	
	
}
