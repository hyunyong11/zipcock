package com.kosmo.zipcock;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.util.PagingUtil;
import membership.MemberDTO;
import mission.MissionDTO;
import mission.MissionImpl;
import mission.ParameterDTO;



@Controller
public class MissionController {

	private SqlSession sqlSession;
	
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("My MissionController 준비끝");
		
	}
	
	
	/*
	 방명록리스트 Ver02
	 : 페이징 기능과 검색 기능을 동시에 구현(기존 Ver01을 업그레이드)
	 */
	@RequestMapping("HList.do")
	public String listSearch(Model model, HttpServletRequest req) {
		
		// Mapper로 전달할 파라미터를 저장할 DTO객체 생성
		ParameterDTO parameterDTO = new ParameterDTO();
		// 검색어가 있을 경우 저장
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		System.out.println("검색어: "+ parameterDTO.getSearchTxt());
		
		// 게시물 카운트(DTO객체를 인수로 전달)
		int totalRecordCount =
				sqlSession.getMapper(MissionImpl.class)
					.getTotalCountSearch(parameterDTO);
		System.out.println("totalRecordCount= "+ totalRecordCount);
		
		int pageSize = 4; 
		int blockPage = 2;
		int totalPage =
				(int)Math.ceil((double)totalRecordCount/pageSize);
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals("")) 
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		// 게시물의 구간을 DTO에 저장
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		
		// 출력할 게시물 select(DTO객체를 인수로 전달)
		ArrayList<MissionDTO> lists = 
				sqlSession.getMapper(MissionImpl.class)
					.listPageSearch(parameterDTO);
		
		String pagingImg =
				PagingUtil.pagingImg(
						totalRecordCount,
						pageSize, blockPage, nowPage,
						req.getContextPath()
							+"/HList.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		for(MissionDTO dto : lists) {
			
			String temp =
					dto.getMission_content().replace("\r\n", "<br/>");
			dto.setMission_content(temp);
			
			String mStart = dto.getMission_start();
			String mEnd = dto.getMission_end();
			
			String Addr =
					mStart.substring(0, mStart.lastIndexOf("|")+1);
					
			String Addr2 =
					mEnd.substring(0, mEnd.lastIndexOf("|")+1);
			
			dto.setMission_start(Addr);
			dto.setMission_end(Addr2);
		}
		model.addAttribute("lists", lists);
		
		// 검색기능이 추가된 View를 반환
		return "mission/HList";
		
	}

	
	///mission/regist.do
	//심부름 등록 요청(이미지업로드)
	@RequestMapping(value="/mission_regist.do", method=RequestMethod.POST)
	public String missonRegist(MissionDTO missionDTO, MultipartHttpServletRequest req, Model model,  HttpSession session) throws Exception {
		
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
