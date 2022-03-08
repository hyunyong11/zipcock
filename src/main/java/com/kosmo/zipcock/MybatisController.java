package com.kosmo.zipcock;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import board.util.EnvFileReader;
import board.util.PagingUtil;
import membership.MemberDTO;
import mission.MissionDTO;
import mybatis.MyBoardDTO;
import mybatis.MybatisDAOImpl;
import mybatis.MybatisMemberImpl;
import mybatis.ParameterDTO;

@Controller
public class MybatisController {

	/*
	Mybatis를 사용하기 위해 빈을 자동주입 받는다. 
	servlet-context.xml에서 생성함.
	 */
	private SqlSession sqlSession;
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("Mybatis 사용준비 끝");
	}

	/*
	방명록 리스트 Ver01
	: 검색처리 없이 페이징 기능만 구현	 
	 */
	
	@RequestMapping("/review.do")
    public String list(Model model, HttpServletRequest req, HttpSession session) {
        
        //방명록 테이블의 게시물의 갯수 카운트
        /*
        컨트롤러에서 Service객체 역할을 하는 interface에 정의된 추상메서드를 
        호출한다. 그러면 mapper에 정의된 쿼리문이 실행되는 형식으로 동작한다. 
        동작방식] 컨트롤러에서 메서드 호출 -> interface의 추상메서드 호출
            -> namespace에 해당 interface를 namespace로 지정된 매퍼 선택
            -> 추상메서드와 동일한 이름의 id속성을 가진 엘리먼트 선택
            -> 쿼리문 실행 및 결과 반환
         */
        if(session.getAttribute("siteUserInfo")==null)
        {
            /*
            현재상태는 글쓰기를 위해 버튼을 클릭했으므로, 만약 로그인 완료된다면
            글쓰기 페이지로 이동하는것이 좋다. 따라서 backUrl이라는 파라미터에 
            쓰기페이지의 View경로를 붙여서 리다이렉트 시킨다. 
             */
            model.addAttribute("backUrl", "review_list");
            return "redirect:login.do";
        }
        //Map<String, Object> paramMap = model.asMap();
        MyBoardDTO parameterDTO = new MyBoardDTO();
        String review_id = ((MemberDTO)session.getAttribute("siteUserInfo")).getMember_id();
        int totalRecordCount =
            sqlSession.getMapper(MybatisDAOImpl.class).getTotalCount(review_id);
        
        
        //페이지 처리를 위한 설정값
        int pageSize = Integer.parseInt(
                EnvFileReader.getValue("MboardInit.properties",
                        "mboard.pageSize"));
        int blockPage = Integer.parseInt(
                EnvFileReader.getValue("MboardInit.properties",
                        "mboard.blockPage"));
        int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
        //현제페이지 번호 설정
        /*
        방명록URL?nowPage=     -> 이경우 페이지번호는 빈값
        방명록URL?nowPage=10   -> 10으로 설정
        방명록URL              -> null로 판단
        */
        //페이지번호가 null이거나 빈값인 경우 1페이지로 설정한다. 
        int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals("")) 
            ? 1 : Integer.parseInt(req.getParameter("nowPage"));
        
        //해당 페이지에 출력할 게시물의 구간을 계산한다. 
        int start = (nowPage-1) * pageSize + 1;
        int end = nowPage * pageSize;
        //paramMap.put("start", start);
        //paramMap.put("end", end);
        parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
        /*
        서비스 역할의 인터페이스의 추상메서드를 호출하면 mapper가 동작됨
        전달된 파라미터는 #{param1}과 같이 순서대로 사용한다. 
         */
        ArrayList<MyBoardDTO> lists =
            sqlSession.getMapper(MybatisDAOImpl.class).listPage(review_id, start, end);
        //가상번호 계산후 부여하기 
        int virtualNum = 0;
        int countNum = 0;
        for(MyBoardDTO row : lists) {
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
                req.getContextPath()+"/review.do?");
    
        model.addAttribute("lists", lists);
        //내용에 대한 줄바꿈 처리
        for(MyBoardDTO dto : lists){
            String temp = dto.getReview_content().replace("\r\n","<br/>");
            dto.setReview_content(temp);
        }
        model.addAttribute("pagingImg", pagingImg);
        model.addAttribute("totalPage", totalPage);//전체페이지 수
        model.addAttribute("nowPage", nowPage);//현제페이지 번호
        model.addAttribute("lists", lists);       
        
        return "review/review_list";
    }   
	
	//글쓰기 페이지 매핑
	@RequestMapping("/write.do")
	public String write(Model model, HttpSession session, HttpServletRequest req)
	{		
		/*
		매핑된 메서드 내에서 session내장객체를 사용하기 위해 매개변수로
		선언해준다. 
		 */
		//session영역에 해당 속성이 없다면 로그아웃 상태이므로 로그인 페이지로 이동한다.
		if(session.getAttribute("siteUserInfo")==null)
		{
			/*
			현재상태는 글쓰기를 위해 버튼을 클릭했으므로, 만약 로그인 완료된다면
			글쓰기 페이지로 이동하는것이 좋다. 따라서 backUrl이라는 파라미터에 
			쓰기페이지의 View경로를 붙여서 리다이렉트 시킨다. 
			 */
			model.addAttribute("backUrl", "/write");
			return "redirect:login.do";
		}
		//로그인이 완료된 상태라면 쓰기 페이지로 진입한다. 
		return "review/review_write";
	}
	
	//로그인 페이지 매핑
	@RequestMapping("/login.do")
	public String login(Model model)
	{
		return "member/login";
	}
	//로그인 처리(session객체 사용)
	@RequestMapping("/loginAction.do")
	public ModelAndView loginAction(HttpServletRequest req, HttpSession session){
		
		//폼값으로 전송된 id, pass를 매개변수로 전달하여 Mapper 호출
		MemberDTO dto = sqlSession.getMapper(MybatisMemberImpl.class)
				.login(req.getParameter("member_id"), req.getParameter("member_pass"));
				
		
		ModelAndView mv = new ModelAndView();		
		if(mv==null) {
			//로그인에 실패한 경우(정보 불일치 등)
			mv.addObject("LoginNG", "아이디/패스워드가 틀렸습니다.");
			//로그인 페이지로 다시 돌아간다. 
			mv.setViewName("member/login");
			return mv;
		}
		else {	
			//로그인에 성공한 경우 세션영역에 MemberVO객체를 저장한다. 
			session.setAttribute("siteUserInfo", dto);
		}
		
		//글쓰기 페이지로의 진입에 실패한 경우라면 backUrl을 통해 글쓰기 페이지로 이동시킨다.
		String backUrl = req.getParameter("backUrl");
		if(backUrl==null || backUrl.equals("")) {
			//디폴트로 이동할 페이지는 로그인이다. 
			mv.setViewName("member/login");
		}
		else {
			mv.setViewName(backUrl);
		}
		return mv;
	}
	
	//글쓰기 처리
	@RequestMapping(value="/writeAction.do", method=RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req,
			HttpSession session) {
		/*
		글쓰기 페이지에 오랫동안 머물리 세션이 끊어지는 경우가 있으므로
		글쓰기 처리에서도 반드시 세션을 확인한 후 처리해야 한다. 
		 */
		if(session.getAttribute("siteUserInfo")==null){
			//만약 세션이 끊어졌다면 로그인페이지로 이동한다. 
			return "redirect:login.do";
		}
		
		//insert문을 실행시 입력에 성공한 행의 갯수가 정수형으로 반환된다. 
		int result = sqlSession.getMapper(MybatisDAOImpl.class).write(
                req.getParameter("review_id"),
                req.getParameter("mission_num"),
                req.getParameter("review_point"),
                req.getParameter("review_content"));
            System.out.println("입력결과:"+ result);
		//쓰기 처리를 완료한 후 리스트로 이동
		return "redirect:review.do";
	}
	
	//수정페이지 진입하기
	@RequestMapping("/modify.do")
	public String modify(Model model, HttpServletRequest req, HttpSession session) {
		
		//수정페이지 진입시에도 로그인 확인해야함.
		if(session.getAttribute("siteUserInfo")==null)		{
			return "redirect:login.do";
		}
		
		/*
		파라미터를 전달하는 4번째 방법으로 DTO(혹은 VO)객체에 파라미터를
		저장한 후 Mapper로 전달한다. 
		 */
		ParameterDTO parameterDTO = new ParameterDTO();
		//일련번호 저장
		parameterDTO.setReview_num(req.getParameter("review_num"));
		//사용자 아이디 저장
		parameterDTO.setReview_id(((MemberDTO)session.getAttribute("siteUserInfo")).getMember_id()); 
		
		
		
		//view() 메서드로 앞에서 저장된 DTO객체를 매개변수로 전달한다. 
		MyBoardDTO dto = sqlSession.getMapper(MybatisDAOImpl.class).view(parameterDTO);

		model.addAttribute("dto", dto);
		return "review/review_modify";
	}
	
	//수정처리
	@RequestMapping("/modifyAction.do")
	public String modifyAction(HttpSession session,	MyBoardDTO myBoardDTO)
	{	
		//수정페이지에서 전송된 폼값은 커맨드객체를 통해 한꺼번에 받는다. 
		
		//수정처리전 로그인 체크
		if(session.getAttribute("siteUserInfo")==null){
			return "redirect:login.do";
		}
		//수정처리를 위해 modify 메서드 호출
		int applyRow = sqlSession.getMapper(MybatisDAOImpl.class).modify(myBoardDTO);
		//System.out.println("수정처리된 레코드수:"+ applyRow);
		
		//방명록 게시판은 상세보기 페이지가 별도로 없으므로 리스트로 이동하면 된다. 
		return "redirect:review.do";
	}
	
	//삭제처리	
	@RequestMapping("/delete.do")
	public String delete(HttpServletRequest req, HttpSession session)
	{
		//로그인 확인
		if(session.getAttribute("siteUserInfo")==null){
			return "redirect:login.do";
		}
		//삭제처리를 위해 delete() 호출
		sqlSession.getMapper(MybatisDAOImpl.class).delete(
			req.getParameter("review_num"),
			((MemberDTO)session.getAttribute("siteUserInfo")).getMember_id()
		);

		return "redirect:review.do";
	}		
	
}
