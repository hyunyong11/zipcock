package com.kosmo.zipcock;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	//메인으로 가기
	@RequestMapping("/zipcock.do")
	public String zipcockMain() {
		
		return "index";
	}
	
	//사용자로 가입할지 헬퍼로 가입할지
	@RequestMapping("/memberRegist.do")
	public String memberRegist() {
		
		return "member/join_Choice";
	}
	 
	//헬퍼로 가입할 경우
	@RequestMapping("/memberRegist_Helper.do")
	public String memberRegist_Helper() {
		
		return "member/join_Helper";
	}
	
	//사용자로 가입할 경우
	@RequestMapping("/memberRegist_user.do")
	public String memberRegist_user() {
		
		return "member/join_User";
	}
	
	//회원가입시 alert
	@RequestMapping("/welcomAlert.do")
	public String insertMember() {
		
		return "member/welcomAlert";
	}
	
	//회원정보 변경시 알림창
	@RequestMapping("/changeAlert.do")
	public String changeAlter() {
		
		return "member/changeAlert";
	}
	
	//로그인
	@RequestMapping("/memberLogin.do")
	public String memberLogin() {
		
		return "member/login";
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String memberLogout() {
		
		return "member/logout";
	}
	
	//회원 탈퇴
    @RequestMapping("/mdelete.do")
    public String memberdelete() {
        return "member/mdelete";
    }
	
	//아이디/비밀번호 찾기
	@RequestMapping("/findIdpw.do")
	public String findmember() {
		
		return "member/find_Idpw";
	}
	
	//마이페이지
	@RequestMapping("/mypage.do")
	public String mypage() {
	
		return "member/mypage";
	}
	
	//심부름 요청 페이지 이동
	@RequestMapping(value="/mission_select.do", method=RequestMethod.GET)
	public String missionSelect()  {
		
		return "mission/registration";
	}
	
	
	

}
