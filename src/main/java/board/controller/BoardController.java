package board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.MBoardDAO;
import board.MBoardDTO;
import board.command.BbsCommandImpl;
import board.command.ListCommand;
import board.command.ViewCommand;

@Controller
public class BoardController {
	
	@Autowired
	private MBoardDAO dao;
	
	//모든 Command객체의 부모타입의 참조변수 생성
	BbsCommandImpl command = null;
	
	@Autowired
	ListCommand listCommand;
	@Autowired
	ViewCommand viewCommand;
	
	
	
	@RequestMapping("/Notice.do")
	public String list(Model model, HttpServletRequest req) {
		/*
		사용자로부터 받은 모든 요청은 request객체에 저장되고, 이를
		ListCommand객체로 전달하기 위해 Model객체에 저장한 후 매개변수로
		전달한다.
		*/
		model.addAttribute("req", req); //request객체 자체를 Model에 저장
		//command = new ListCommand();//service역할의 ListCommand객체 생성
		command = listCommand;
		command.execute(model);//해당 객체로 Model객체 자체를 전달
		
		return "board/MboardList";
	}
	
	
	
	@RequestMapping("/NoticeV.do")
	public String view(Model model, HttpServletRequest req, MBoardDTO MBoardDTO)
	{
		
//		model.addAttribute("num", req.getParameter("num"));
		//사용자의 요청을 저장한 request객체를 Model객체에 저장한 후 전달한다.
		model.addAttribute("req", req);
		model.addAttribute("MBoardDTO", MBoardDTO);
		//command = new ViewCommand();
		command = viewCommand;
		command.execute(model);
		
		return "board/MboardView";
	}
	
	
	
	
	
}
	

