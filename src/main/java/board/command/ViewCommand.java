package board.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import board.MBoardDAO;
import board.MBoardDTO;

@Service
public class ViewCommand implements BbsCommandImpl {
	
	@Autowired
	MBoardDAO dao;
	
	@Override
	public void execute(Model model ) {
		 
		//요청 일괄 받기
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		//폼값받기
		String num = req.getParameter("num");
		String nowPage = req.getParameter("nowPage");
		
		//DAO, DTO객체 생성 및 상세보기 처리를 위한 메서드 호출
		MBoardDTO dto = new MBoardDTO();
		dto = dao.view(num);
		 
		//줄바꿈 처리를 위해 <br/>로 변경
		dto.setMboard_content(dto.getMboard_content().replace("\r\n", "<br/>"));
		 
		model.addAttribute("viewRow", dto);
		model.addAttribute("nowPage", dto.getNowPage());
	}
}