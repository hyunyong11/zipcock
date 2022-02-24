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
			
			String mWay = dto.getMission_waypoint();
			
			if (mWay != null) {
				String Addr =
					mWay.substring(0, mWay.lastIndexOf("|")+1);
				dto.setMission_waypoint(Addr);
			}
			
			String mEnd = dto.getMission_end();
			String Addr2[] =
					mEnd.split("|");
//					mEnd.substring(0, mEnd.lastIndexOf("|")+1);
			
			dto.setMission_end(Addr2[2]);
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
		
		missionDTO.setMission_waypoint(req.getParameter("mission_waypoint0")+"|"+req.getParameter("mission_waypoint1")+"|"+req.getParameter("mission_waypoint2"));
		missionDTO.setMission_end(req.getParameter("mission_end0")+"|"+req.getParameter("mission_end1")+"|"+req.getParameter("mission_end2"));
		
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
	
	//헬퍼 마이페이지 요청내역
	@RequestMapping("/HInfoAll.do")
	public String hInfoAll(Model model, HttpServletRequest req) {
		
		
		int totalRecordCount =
			sqlSession.getMapper(MissionImpl.class).getTotalCount();
		
		//페이지 처리를 위한 설정값
		int pageSize = 4;//한 페이지당 출력할 게시물의 갯수
		int blockPage = 2;//한 블럭당 출력할 페이지번호의 갯수
		//전체 페이지 수 계산
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		//현제페이지 번호 설정
		/*
		방명록URL?nowPage=		-> 이경우 페이지번호는 빈값
		방명록URL?nowPage=10	-> 10으로 설정
		방명록URL				-> null로 판단
		*/
		//페이지번호가 null이거나 빈값인 경우 1페이지로 설정한다. 
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals("")) 
			? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		//해당 페이지에 출력할 게시물의 구간을 계산한다. 
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		/*
		서비스 역할의 인터페이스의 추상메서드를 호출하면 mapper가 동작됨
		전달된 파라미터는 #{param1}과 같이 순서대로 사용한다. 
		 */
		ArrayList<MissionDTO> lists =
			sqlSession.getMapper(MissionImpl.class).listPage(start, end);
				
		String pagingImg =
			PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath()+"/hInfoAll.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		//내용에 대한 줄바꿈 처리
		for(MissionDTO dto : lists){
			String temp = dto.getMission_id().replace("\r\n","<br/>");
			
			dto.setMission_id(temp);
		}
		model.addAttribute("lists", lists);
		
		
		return "/member/hInfoAll";
	}
	
	//마이페이지 사용자 사용내역
	@RequestMapping("/CInfoAll.do")
	public String cInfoAll(Model model, HttpServletRequest req) {
		
		//방명록 테이블의 게시물의 갯수 카운트
		/*
		컨트롤러에서 Service객체 역할을 하는 interface에 정의된 추상메서드를 
		호출한다. 그러면 mapper에 정의된 쿼리문이 실행되는 형식으로 동작한다. 
		동작방식] 컨트롤러에서 메서드 호출 -> interface의 추상메서드 호출
			-> namespace에 해당 interface를 namespace로 지정된 매퍼 선택
			-> 추상메서드와 동일한 이름의 id속성을 가진 엘리먼트 선택
			-> 쿼리문 실행 및 결과 반환
		 */
		int totalRecordCount =
			sqlSession.getMapper(MissionImpl.class).getTotalCount();
		
		//페이지 처리를 위한 설정값
		int pageSize = 4;//한 페이지당 출력할 게시물의 갯수
		int blockPage = 2;//한 블럭당 출력할 페이지번호의 갯수
		//전체 페이지 수 계산
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		//현제페이지 번호 설정
		/*
		방명록URL?nowPage=		-> 이경우 페이지번호는 빈값
		방명록URL?nowPage=10	-> 10으로 설정
		방명록URL				-> null로 판단
		*/
		//페이지번호가 null이거나 빈값인 경우 1페이지로 설정한다. 
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals("")) 
			? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		//해당 페이지에 출력할 게시물의 구간을 계산한다. 
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		/*
		서비스 역할의 인터페이스의 추상메서드를 호출하면 mapper가 동작됨
		전달된 파라미터는 #{param1}과 같이 순서대로 사용한다. 
		 */
		ArrayList<MissionDTO> lists =
			sqlSession.getMapper(MissionImpl.class).listPage(start, end);
				
		String pagingImg =
			PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath()+"/cInfoAll.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		//내용에 대한 줄바꿈 처리
		for(MissionDTO dto : lists){
			String temp = dto.getMission_id().replace("\r\n","<br/>");
			
			dto.setMission_id(temp);
		}
		model.addAttribute("lists", lists);
		
		
		return "/member/cInfoAll";
	}
	
	//마이페이지 사용자 사용내역 자세히 보기
	@RequestMapping("/missionCDetail.do")
	public String missionCDetail(Model model, HttpServletRequest req) {
			
			int mission_num = Integer.parseInt(req.getParameter("mission_num"));

			ArrayList<MissionDTO> lists =
				sqlSession.getMapper(MissionImpl.class).missionCDetail(mission_num);
					
		model.addAttribute("lists", lists);
		
		return "/member/missionCDetail";
		
	}
	
	//마이페이지 헬퍼 요청내역 자세히 보기
	@RequestMapping("/missionHDetail.do")
	public String missionHDetail(Model model, HttpServletRequest req) {
		
		
		int  mission_num = Integer.parseInt(req.getParameter("mission_num"));

		ArrayList<MissionDTO> lists =
			sqlSession.getMapper(MissionImpl.class).missionHDetail(mission_num);
				
		model.addAttribute("lists", lists);
		
		return "/member/missionHDetail";
		
	}
	
	//심부름 결제 API
	@RequestMapping(value="/mission_pay.do", method=RequestMethod.POST)
    public String pay(Model model, HttpServletRequest request)  {
        String referer = request.getHeader("referer");
        model.addAttribute("referer", referer);
        return "mission/pay";
    }
	
	
}
