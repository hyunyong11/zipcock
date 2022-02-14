package com.kosmo.zipcock;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@RequestMapping("/message.do")
	public String insertMember() {
		
		return "member/message";
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
	
	//아이디/비밀번호 찾기
	@RequestMapping("/findIdpw.do")
	public String findmember() {
		
		return "member/find_Idpw";
	}
	
}
