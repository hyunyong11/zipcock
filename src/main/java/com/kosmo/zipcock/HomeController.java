package com.kosmo.zipcock;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.MBoardDAO;
import board.command.BbsCommandImpl;
import board.command.ListCommand;
import board.command.ViewCommand;

/**
 * Handles requests for the application home page.
 */
@Controller 
public class HomeController {
	
	@Autowired
	private MBoardDAO dao;
	
	//모든 Command객체의 부모타입의 참조변수 생성
	BbsCommandImpl command = null;
	
	@Autowired
	ListCommand listCommand;
	@Autowired
	ViewCommand viewCommand;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest req) {
		
		/*
		사용자로부터 받은 모든 요청은 request객체에 저장되고, 이를
		ListCommand객체로 전달하기 위해 Model객체에 저장한 후 매개변수로
		전달한다.
		*/
		model.addAttribute("req", req); //request객체 자체를 Model에 저장
		//command = new ListCommand();//service역할의 ListCommand객체 생성
		command = listCommand;
		command.execute(model);//해당 객체로 Model객체 자체를 전달
		
		return "index";
	}
	
	@RequestMapping(value = "/zipcock.do", method = RequestMethod.GET)
	public String home2(Locale locale, Model model, HttpServletRequest req) {
		
		/*
		사용자로부터 받은 모든 요청은 request객체에 저장되고, 이를
		ListCommand객체로 전달하기 위해 Model객체에 저장한 후 매개변수로
		전달한다.
		*/
		model.addAttribute("req", req); //request객체 자체를 Model에 저장
		//command = new ListCommand();//service역할의 ListCommand객체 생성
		command = listCommand;
		command.execute(model);//해당 객체로 Model객체 자체를 전달
		
		return "index";
	}
	
	//웹소켓 연결
	@RequestMapping(value="/webSocket.do", method=RequestMethod.GET)
	public String webSocket() {
		return "mission/webSocket";
	}
	
	//1:1챗연결
	@RequestMapping(value="/webChat.do", method=RequestMethod.GET)
	public String webChat() {
		return "mission/webChat";
	}
	
}