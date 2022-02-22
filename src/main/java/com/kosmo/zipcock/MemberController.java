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
import org.springframework.web.servlet.ModelAndView;

import membership.MemberDTO;
import membership.MemberImpl;

@Controller
public class MemberController {
	
	private SqlSession sqlSession;
	
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		
	}
	
	
	@RequestMapping(value="/member.do", method=RequestMethod.POST)
	public String member(HttpServletRequest req, MemberDTO memberDTO, Model model) throws Exception {
		
		memberDTO.setMember_email(req.getParameter("email_1") + "@" + req.getParameter("email_2"));
		sqlSession.getMapper(MemberImpl.class).member(memberDTO);

		return "redirect:welcomAlert.do";
	}
	
	//헬퍼 회원가입(이미지업로드)
	@RequestMapping(value="/helper.do", method=RequestMethod.POST)
	public String helper(MemberDTO memberDTO, MultipartHttpServletRequest req, Model model) throws Exception {
		
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
				
				memberDTO.setMember_ofile(originalName);
				memberDTO.setMember_sfile(saveFileName);
				
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		memberDTO.setMember_email(req.getParameter("email_1") + "@" + req.getParameter("email_2"));
		sqlSession.getMapper(MemberImpl.class).helper(memberDTO);
		
		return "redirect:welcomAlert.do";
	}
	
	//서버 업로드를 위한 메소드
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		System.out.println("생성된UUID-1:"+uuid);
		
		return uuid;
	}
	
	
	// 로그인 처리(session객체 사용)
	@RequestMapping("/memberLoginAction.do")
	public ModelAndView memberLoginAction (
			HttpServletRequest req, HttpSession session) {
		// 폼값으로 전송된 id, pass를 매개변수로 전달하여 Mapper호출
		MemberDTO dto =
			sqlSession.getMapper(MemberImpl.class).login(
					req.getParameter("id"),
					req.getParameter("pass")
			);
		ModelAndView mv = new ModelAndView();
		if (dto == null) {
			// 로그인에 실패한 경우(정보 불일치 등)
			mv.addObject("LoginNG", "아이디/비밀번호가 틀렸습니다.");
			// 로그인 페이지로 다시 돌아간다.
			mv.setViewName("member/login");
			return mv;
		}
		else {
			// 로그인에 성공한 경우 세션 영역에 MemberDTO객체를 저장한다.
			session.setAttribute("siteUserInfo", dto); 
			session.setAttribute("Id", dto.getMember_id());
			session.setAttribute("UserName", dto.getMember_name());
			session.setAttribute("UserStatus", dto.getMember_status());
		}
		
		// 글쓰기 페이지로의 진입에 실패한 경우라면 backUrl을 통해 글쓰기 페이지로 이동시킨다.
		String backUrl = req.getParameter("backUrl");
		if (backUrl==null || backUrl.equals("")) {
			// 디폴트로 이동할 페이지는 로그인이다.
			mv.setViewName("member/login");
		}
		else {
			mv.setViewName(backUrl);
		}
		return mv;
	}
	
	//회원정보 수정(입장)
	@RequestMapping("/myPage.do")
	public String change(HttpServletRequest req, Model model, HttpSession session) {
		
		
		String id = (String)session.getAttribute("Id");
		
		ArrayList<MemberDTO> memberList = sqlSession.getMapper(MemberImpl.class).getMemberInfo(id);
		
		for(MemberDTO dto : memberList) {
			
			String email = dto.getMember_email();
			
			int idx = email.indexOf("@");
			
			String email_1 = email.substring(0, idx);
			String email_2 = email.substring(idx+1);
			
			System.out.println(email_1);
			
			model.addAttribute("email_1", email_1);
			model.addAttribute("email_2", email_2);
		}
		
		model.addAttribute("dto", memberList);
		
		
		return "member/memberInfo";
	}

				
	//회원정보수정 (헬퍼)
	@RequestMapping("/myHelperPageAction.do")
	public String myHelperPageAction(HttpSession session, MultipartHttpServletRequest req, MemberDTO memberDTO, Model model) {
		
		String id = (String)session.getAttribute("Id");
		int status = (Integer)session.getAttribute("UserStatus");
		
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
				
				memberDTO.setMember_ofile(originalName);
				memberDTO.setMember_sfile(saveFileName);
				
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		memberDTO.setMember_id(id);
		memberDTO.setMember_status(status);
		memberDTO.setMember_email(req.getParameter("email_1") + "@" + req.getParameter("email_2"));
		
		sqlSession.getMapper(MemberImpl.class).helperMyPage(memberDTO);
		
		model.addAttribute("msg", "회원정보 변경완료");
		
		return "member/changeAlert";
		
	}
	
	@RequestMapping("/myUserPageAction.do")
	public String myUserPageAction(HttpSession session, HttpServletRequest req, MemberDTO memberDTO, Model model) {
		
		String id = (String)session.getAttribute("Id");
		int status = (Integer)session.getAttribute("UserStatus");
		
		memberDTO.setMember_id(id);
		memberDTO.setMember_status(status);
		memberDTO.setMember_email(req.getParameter("email_1") + "@" + req.getParameter("email_2"));
		
		
		sqlSession.getMapper(MemberImpl.class).userMyPage(memberDTO);
		
		model.addAttribute("msg", "회원정보 변경완료");
		
		
		return "member/changeAlert";
	}
	
	
	//카카오 로그인(작업중)
	@RequestMapping("/kakaoLogin.do")
	public String kakaoLogin(HttpServletRequest req, HttpSession session) {
		
		System.out.println("카카오로그인");
		System.out.println(req.getParameter("kakaoemail"));
		System.out.println(req.getParameter("kakaoname"));
		
		// kakaoemail을 kakaoid에 저장
		//String kakaoid = req.getParameter("kakaoemail");
		//String kakaoname = req.getParameter("kakaoname");
		
		MemberDTO dto = sqlSession.getMapper(MemberImpl.class).kakaoLogin( req.getParameter("kakaoemail"));
		
		if (dto == null) { // 회원이 아닌경우 (카카오 계정으로 처음 방문한 경우) 카카오 회원정보 설정 창으로 이동
			System.out.println("카카오 회원 정보 설정");
			
			req.setAttribute("member_id",req.getParameter("kakaoemail"));
			req.setAttribute("member_name",req.getParameter("kakaoname"));
			
			// 회원가입창으로 이동
			
			return "member/join_Kakao";
			
		} else { // 이미 카카오로 로그인한 적이 있을 때 (최초 1회 로그인때 회원가입된 상태)
			
		    session.setAttribute("siteUserInfo", dto); 
			session.setAttribute("Id", dto.getMember_id());
			session.setAttribute("UserName", dto.getMember_name());
			session.setAttribute("UserStatus", dto.getMember_status());

		    System.out.println("kakaoid : " + dto.getMember_id());
		    System.out.println("name : " + dto.getMember_name());
		    System.out.println("UserStatus: " + dto.getMember_status());

		}
		
		return "redirect:zipcock.do";
	}
	
	
	/*
	 
		else if (req.getParameter("login_ok").equals("1") && !req.getParameter("kakaoemail").equals("")) {
			// ==================== 카카오 로그인 ========================
				
			System.out.println("카카오로그인");
			System.out.println(req.getParameter("kakaoemail"));
			System.out.println(req.getParameter("kakaoname"));
			
			// kakaoemail을 kakaoid에 저장
			String kakaoid = req.getParameter("kakaoemail");

			MemberDTO memberDTO = new MemberDTO();

			// kakaoid를 to의 id로 세팅
			memberDTO.setMember_id(kakaoid);

			// 카카오계정으로 로그인한 적이 있는지 없는지 
			MemberDTO result = sqlSession.getMapper(MemberImpl.class).kakaoLogin(
					req.getParameter("id"));

			if (result == null) { // 회원이 아닌경우 (카카오 계정으로 처음 방문한 경우) 카카오 회원정보 설정 창으로 이동
				System.out.println("카카오 회원 정보 설정");

				req.setAttribute("kakaoid",req.getParameter("kakaoemail"));
				req.setAttribute("kakaoname",req.getParameter("kakaoname"));
				
				mv.setViewName("member/memberInfo");

			} else { // 이미 카카오로 로그인한 적이 있을 때 (최초 1회 로그인때 회원가입된 상태)
				// id, nick, profile을 가져와서
				// id를 세션에 저장
				session.setAttribute("member_id", result.getMember_id());
				// nick을 세션에 저장
				session.setAttribute("member_name", result.getMember_name());
				
				
				System.out.println("kakaoid : " + result.getMember_id());
				System.out.println("nick : " + result.getMember_name());
			}

		}
		
		
	 
	 */
}
