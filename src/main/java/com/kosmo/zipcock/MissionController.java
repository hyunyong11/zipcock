package com.kosmo.zipcock;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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

import board.util.EnvFileReader;
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
		
		// 게시물 카운트(DTO객체를 인수로 전달)
		int totalRecordCount =
				sqlSession.getMapper(MissionImpl.class)
					.getTotalCountSearch(parameterDTO);
		//System.out.println("totalRecordCount= "+ totalRecordCount);
		
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
				int Addr = mWay.lastIndexOf("|");
				
				String way_rest = mWay.substring(1, Addr);
                String way_2 = mWay.substring(Addr+1);
				
                int way_num = way_rest.lastIndexOf("|");
                String way_1 = way_rest.substring(way_num+1);
				
				dto.setMission_waypoint(way_1+","+way_2);
			}
			
			String mEnd = dto.getMission_end();
			int Addr2 = mEnd.lastIndexOf("|");
			
			String end_rest = mEnd.substring(1, Addr2);
            String end_2 = mEnd.substring(Addr2+1);
            
            int end_num = end_rest.lastIndexOf("|");
            String end_1 = end_rest.substring(end_num+1);
            dto.setMission_end(end_1+","+end_2);

            
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
		
		return "mission/missionAlert";
	}
	

	
	//서버 업로드를 위한 메소드
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		
		return uuid;
	}
	
	
	//헬퍼 마이페이지 요청내역
	@RequestMapping("/HInfoAll.do")
	public String hInfoAll(Model model, HttpServletRequest req, HttpSession session) {
		
		MissionDTO parameterDTO = new MissionDTO();
		String mission_hid = ((MemberDTO)session.getAttribute("siteUserInfo")).getMember_id();
		
		int totalRecordCount =
                sqlSession.getMapper(MissionImpl.class)
                    .getTotalCount1(mission_hid);
		
		//페이지 처리를 위한 설정값
		int pageSize = 7;
        int blockPage = 3;
        
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
		
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		/*
		서비스 역할의 인터페이스의 추상메서드를 호출하면 mapper가 동작됨
		전달된 파라미터는 #{param1}과 같이 순서대로 사용한다. */
		 
		ArrayList<MissionDTO> lists =
	            sqlSession.getMapper(MissionImpl.class).listPage1(mission_hid, start, end);
	                
	            //가상번호 계산후 부여하기 
	              int virtualNum = 0;
	              int countNum = 0;
	              for(MissionDTO row : lists) {
	                 //전체게시물의 갯수에서 하나씩 차감하면서 가상번호를 부여한다.(페이징X)
	                 //virtualNum = totalRecordCount --;
	                 
	                 /*********가상번호계산 추가코드 Start****************/
	                 
	                 virtualNum = totalRecordCount - 
	                       (((nowPage-1)*pageSize) + countNum++);
	                 /*********가상번호계산 추가코드 End****************/
	                 
	                 //가상번호를 setter를 통해 저장
	                 row.setVirtualNum(virtualNum);
	              }
				
		String pagingImg =
			PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath()+"/hInfoAll.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		//내용에 대한 줄바꿈 처리
		for(MissionDTO dto : lists){
            String temp = dto.getMission_content().replace("\r\n","<br/>");
            
            dto.setMission_content(temp);
        }
        model.addAttribute("lists", lists);
		
		
		return "/member/hInfoAll";
	}
	
	//마이페이지 사용자 사용내역
	@RequestMapping("/CInfoAll.do")
	public String cInfoAll(Model model, HttpServletRequest req, HttpSession session) {
		
		//방명록 테이블의 게시물의 갯수 카운트
		/*
		컨트롤러에서 Service객체 역할을 하는 interface에 정의된 추상메서드를 
		호출한다. 그러면 mapper에 정의된 쿼리문이 실행되는 형식으로 동작한다. 
		동작방식] 컨트롤러에서 메서드 호출 -> interface의 추상메서드 호출
			-> namespace에 해당 interface를 namespace로 지정된 매퍼 선택
			-> 추상메서드와 동일한 이름의 id속성을 가진 엘리먼트 선택
			-> 쿼리문 실행 및 결과 반환
		 */
		//Map<String, Object> paramMap = model.asMap();
		//ParameterDTO parameterDTO = new ParameterDTO();
		MissionDTO parameterDTO = new MissionDTO();
		String mission_id = ((MemberDTO)session.getAttribute("siteUserInfo")).getMember_id();
		int totalRecordCount =
				sqlSession.getMapper(MissionImpl.class)
					.getTotalCount(mission_id);
		
		//페이지 처리를 위한 설정값
		int pageSize = 7;
        int blockPage = 3;
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
		
		// 게시물의 구간을 DTO에 저장
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		//paramMap.put("start", start);
        //paramMap.put("end", end);
		/*
		서비스 역할의 인터페이스의 추상메서드를 호출하면 mapper가 동작됨
		전달된 파라미터는 #{param1}과 같이 순서대로 사용한다. 
		 */
		ArrayList<MissionDTO> lists =
			sqlSession.getMapper(MissionImpl.class).listPage(mission_id, start, end);
		//가상번호 계산후 부여하기 
	      int virtualNum = 0;
	      int countNum = 0;
	      for(MissionDTO row : lists) {
	         //전체게시물의 갯수에서 하나씩 차감하면서 가상번호를 부여한다.(페이징X)
	         //virtualNum = totalRecordCount --;
	         
	         /*********가상번호계산 추가코드 Start****************/
	         
	         virtualNum = totalRecordCount - 
	               (((nowPage-1)*pageSize) + countNum++);
	         /*********가상번호계산 추가코드 End****************/
	         
	         //가상번호를 setter를 통해 저장
	         row.setVirtualNum(virtualNum);
	      }
		
		String pagingImg =
			PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath()+"/CInfoAll.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		//내용에 대한 줄바꿈 처리
		for(MissionDTO dto : lists){
			String temp = dto.getMission_content().replace("\r\n","<br/>");
			
			dto.setMission_content(temp);
		}
		model.addAttribute("pagingImg", pagingImg);
        model.addAttribute("totalPage", totalPage);//전체페이지 수
        model.addAttribute("nowPage", nowPage);//현제페이지 번호
        model.addAttribute("lists", lists);
		
		return "/member/cInfoAll";
	}
	
	//마이페이지 사용자 사용내역 자세히 보기
	@RequestMapping("/missionCDetail.do")
	public String missionCDetail(Model model, HttpServletRequest req, HttpSession session) {
		
		int mission_num = Integer.parseInt(req.getParameter("mission_num"));

		ArrayList<MissionDTO> lists =
			sqlSession.getMapper(MissionImpl.class).missionCDetail(mission_num);
		//System.out.println(lists);
			
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
	
	 //사용자요청 수정페이지 진입
    @RequestMapping("userEdit.do")
    public String userEdit(Model model, HttpServletRequest req, HttpSession session) {
        
        String num = req.getParameter("num");
        String id = (String)session.getAttribute("Id");
        
        MissionDTO missionDTO = new MissionDTO();
        
        missionDTO = sqlSession.getMapper(MissionImpl.class).statusSelect(num, id);
        session.setAttribute("missionStatus", missionDTO.getMission_status());
        
        ArrayList<MissionDTO> lists = sqlSession.getMapper(MissionImpl.class).missionCEdit(num);
        
        for(MissionDTO dto : lists) {
            if(!(dto.getMission_waypoint() == null)) {
                String waypoint = dto.getMission_waypoint();
                int way = waypoint.lastIndexOf("|");
                String way_rest = waypoint.substring(1, way);
                String way_2 = waypoint.substring(way+1);
                model.addAttribute("way_2", way_2);
                
                int way_num = way_rest.lastIndexOf("|");
                String way_1 = way_rest.substring(way_num+1);
                model.addAttribute("way_1", way_1);
            }
            
            String end = dto.getMission_end();
            
            int e = end.lastIndexOf("|");
            
            String end_rest = end.substring(1, e);
            String end_2 = end.substring(e+1);
            
            model.addAttribute("end_2", end_2);
            
            int end_num = end_rest.lastIndexOf("|");
            String end_1 = end_rest.substring(end_num+1);
            model.addAttribute("end_1", end_1);
        }
        
        model.addAttribute("lists", lists);
        
        return "member/missionCEdit";
    }
    //사용자요청 수정처리
    @RequestMapping("/userEditAction.do")
    public String userEditAction(HttpSession session, Model model, MultipartHttpServletRequest req, MissionDTO missionDTO) {
        
        String id = (String)session.getAttribute("Id");
        int num = Integer.parseInt(req.getParameter("num"));
        
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
                String saveFileName = getUuid() + ext;
                
                //물리적 경로에 새롭게 생성된 파일명으로 파일 저장
                mfile.transferTo(new File(path + File.separator + saveFileName));
                
                missionDTO.setMission_ofile(originalName);
                missionDTO.setMission_sfile(saveFileName);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        //예약이 즉시일 경우
        if(missionDTO.getMission_mission() == 1) {
            
            // 예약한 날짜(현재날짜)를 DB에 저장한다.
            LocalDate now = LocalDate.now();
            
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            
            String formated = now.format(formatter);
            
            missionDTO.setMission_reservation(formated);
        }
        
        missionDTO.setMission_id(id);
        missionDTO.setMission_num(num);
        
        missionDTO.setMission_start(req.getParameter("start_1") + "|" + req.getParameter("start_2"));
        missionDTO.setMission_waypoint(req.getParameter("way_1") + "|" + req.getParameter("way_2"));
        missionDTO.setMission_end(req.getParameter("end_1") + "|" + req.getParameter("end_2"));
        
        sqlSession.getMapper(MissionImpl.class).EditAction(missionDTO);
        
        return "redirect:CInfoAll.do";
    }
    
    //사용자 요청 삭제처리
    @RequestMapping("/deleteAction.do")
    public String deleteAction(HttpSession session, HttpServletRequest req) {
        
        String id = (String)session.getAttribute("Id");
        int num = Integer.parseInt(req.getParameter("num"));
        
        sqlSession.getMapper(MissionImpl.class).delete(id, num);
        
        return "redirect:CInfoAll.do";
        
    }
    
    //사용자가 심부름 완료버튼을 눌렀을때
    @RequestMapping(value="/missionAction.do", method=RequestMethod.POST)
    public String missionAction(Model model, HttpServletRequest req, MissionDTO missionDTO) {
        
    	int mission_status = Integer.parseInt(req.getParameter("mission_status"));
    	int mission_num = Integer.parseInt(req.getParameter("mission_num"));
    	
    	missionDTO.setMission_status(mission_status);
    	missionDTO.setMission_num(mission_num);
    	
        int result = sqlSession.getMapper(MissionImpl.class).missionAction(missionDTO);
        
        return "redirect:mypage.do";
    }
    
    //헬퍼가 지원하기버튼을 눌렀을때
    @RequestMapping(value="/missionMatch.do", method=RequestMethod.POST)
    public String missionMatch(Model model, HttpServletRequest req, MissionDTO missionDTO, HttpSession session) {
        
    	String mission_Hid = ((MemberDTO)session.getAttribute("siteUserInfo")).getMember_id();
    	int mission_status = Integer.parseInt(req.getParameter("mission_status"));
    	int mission_num = Integer.parseInt(req.getParameter("mission_num"));
    	
    	missionDTO.setMission_Hid(mission_Hid);
    	missionDTO.setMission_status(mission_status);
    	missionDTO.setMission_num(mission_num);
    	
        int result = sqlSession.getMapper(MissionImpl.class).missionMatch(missionDTO);
        
        return "redirect:HList.do";
    }
}
