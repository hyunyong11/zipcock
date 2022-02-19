package board.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import board.MBoardDAO;
import board.MBoardDTO;
import board.util.EnvFileReader;
import board.util.PagingUtil;

/*
BbsCommandImpl 인터페이스를 구현했으므로 execute()는 반드시
오버라이딩 해야한다. 또한 해당 객체는 부모타입인 BbsCommandImpl로
참조 할 수 있다.
*/
@Service
public class ListCommand implements BbsCommandImpl {

	@Autowired
	MBoardDAO dao;
	
	
	public ListCommand() {
		System.out.println("ListCommand 빈 자동생성 됨");
	}
	
	@Override
	public void execute(Model model) {
		
		System.out.println("ListCommand > execute() 호출");
		
		/*
		컨트롤러에서 인자로 전달한 Model객체에는 request객체가 저장되어
		있다. asMap()을 통해 Map컬렉션으로 변환한 후 모든 요청을 얻어온다.
		*/
		Map<String, Object> paramMap = model.asMap();
		//현재 Object형으로 저장된 request객체를 원래의 형으로 형변환 해준다.
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		
		//검색어 처리
		String addQueryString = "";
		//request내장객체를 통해 폼값을 받아온다.
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		if(searchWord!=null)
		{
			//검색어가 있는 경우 쿼리스트링 추가
			addQueryString = String.format("searchColumn=%s"+"&searchWord=%s&", searchColumn, searchWord);
			
			//DAO로 전달할 데이터를 Map컬렉션에 저장
			paramMap.put("Column", searchColumn);
			paramMap.put("Word", searchWord);
		}
		
		//전체 게시물 수 카운트 하기
		int totalRecordCount = dao.getTotalCount(paramMap);
		
		/***********페이징 추가 코드 Start******************/
		
		//Environment객체를 통한 properties파일을 읽어온다.
		int pageSize = Integer.parseInt(
				EnvFileReader.getValue("MboardInit.properties",
						"mboard.pageSize"));
		int blockPage = Integer.parseInt(
				EnvFileReader.getValue("MboardInit.properties",
						"mboard.blockPage"));
		//전체페이지수를 계산
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		//현제페이지번호. 첫 진입일때는 무조건 1페이지로 지정
		int nowPage = 
				(req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
					? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		//리스트에 출력할 게시물의 구간을 계산(select절의 between에 사용)
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		paramMap.put("start", start);
		paramMap.put("end", end);
		
		/***********페이징 추가 코드 end******************/
		
		//출력할 게시물을 select한 후 반환받음(페이징X)
		//ArrayList<SpringBbsDTO> listRows = dao.list(paramMap);
		
		//페이징 적용된 쿼리문을 통한 select(페이징O)
		ArrayList<MBoardDTO> listRows = dao.listPage(paramMap);
		
		//목록에 출력할 게시물의 가상번호 계산후 부여하기
		int virtualNum = 0;
		int countNum = 0;
		for(MBoardDTO row : listRows) {
			//전체게시물의 갯수에서 하나씩 차감하면서 가상번호를 부여한다.(페이징X)
			//virtualNum = totalRecordCount --;
			
			/*********가상번호계산 추가코드 Start****************/
			
			virtualNum = totalRecordCount - 
					(((nowPage-1)*pageSize) + countNum++);
			
			/*********가상번호계산 추가코드 End****************/
			
			//가상번호를 setter를 통해 저장
			row.setVirtualNum(virtualNum);
		}
		//위에서 처리한 목록의 모든 처리결과를 Model객체에 저장한다.
		model.addAttribute("listRows", listRows);
		 
		/*********페이징 처리 코드 Start************/
		String pagingImg = PagingUtil.pagingImg(totalRecordCount,
				pageSize, blockPage, nowPage,
				req.getContextPath()+"/Notice.do?"+addQueryString);
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("totalPage", totalPage);//전체페이지 수
		model.addAttribute("nowPage", nowPage);//현제페이지 번호
		/*********페이징 처리 코드 End************/
		model.addAttribute("listRows", listRows);
		
		
		//JDBCTemplate을 사용할때는 자원반납은 하지않는다.
		//dao.close();
	}
}
