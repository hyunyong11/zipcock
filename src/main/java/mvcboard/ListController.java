package mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPageT;
import utils.BoardPageT;

public class ListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//커넥션풀을 이용한 DB연결
		MVCBoardDAO dao = new MVCBoardDAO();
		
		//파라미터 및 View로 전달할 데이터 저장용 Map컬렉션 생성
		Map<String, Object> map = new HashMap<String,Object>();
		
		//게시판 리스트 비즈니스 로직 작성 
		String flag = (req.getParameter("flag")==null || req.getParameter("flag").equals(""))
				? "emp" : req.getParameter("flag");
		map.put("flag", flag);
		
		//문자열 검색을 위한 변수선언 
		String addQueryString="";
		
		//검색어 관련 파라미터 
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		map.put("flag", flag);
		if(searchField != null) {
			
			addQueryString = String.format("searchField=%s&searchWord=%s&",searchField,searchWord );
			
			//맵에 저장 
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		//게시물 갯수 카운트
		int totalConut = dao.selectCount(map);
		
		/* 페이지 처리 start */
		//web.xml에 접근하기 위해 서블릿에서 application 내장객체를 얻어옴.
		ServletContext application = getServletContext();
		//컨텍스트 초기화 파라미터를 얻어옴.
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		//전체 페이지수 계산하기
		int totalPage = (int)Math.ceil((double)totalConut/pageSize);
		
		
		/*
		목록에 첫 진입시에는 무조건 1페이지로 가정한 후 게시물을 얻어옴.
		특정 페이지로 진입한 경우에는 파라미터를 받아서 구간을 계산해서 얻어옴.
		 */
		int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals(""))
			?
			1
			:
			Integer.parseInt(req.getParameter("pageNum"));
		
		//게시물의 구간을 계산
		int start = (pageNum -1) * pageSize + 1; 
		int end = pageNum * pageSize; 
		
		//map에 구간을 추가 
		map.put("start",start); 
		map.put("end",end);
		/* 페이지 처리 end */
		//현재 페이지에 출력할 게시물을 얻어옴.
		List<MVCBoardDTO> boardLists = dao.selectListPage(map);
		//커넥션풀에 자원 반납
		dao.close();
		 
		//페이지 번호를 생성하기 위해 메서드 호출
		String pagingImg = BoardPageT.pagingStr(totalConut, pageSize, 
				blockPage, pageNum, "../community/sub01_List.do", flag);
		
		//View로 전달할 데이터를 Map컬렉션에 저장 
		map.put("pagingImg", pagingImg); //페이지 번호
		map.put("totalCount", totalConut); //전체 게시물의 갯수
		map.put("pageSize", pageSize); //한페이지에 출력할 게시물의 갯수
		map.put("pageNum", pageNum); //페이지 번호
		map.put("flag", flag);
		
		//View로 전달할 객체들을 request영역에 저장 
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		//View로 포워드를 걸어준다.
		req.getRequestDispatcher("/community/sub01_List.jsp?flag="+flag).forward(req, resp);
	}
}


