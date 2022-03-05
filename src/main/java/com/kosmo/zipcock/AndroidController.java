package com.kosmo.zipcock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.MBoardDTO;
import board.util.PagingUtil;
import membership.MemberDTO;
import mission.MissionDTO;
import mission.MissionImpl;
import mission.ParameterDTO;
import mybatis.IAndroidDAO;

@Controller
public class AndroidController {

	//Mybatis 사용을 위한 자동주입
	@Autowired
	private SqlSession sqlSession;
	
	
	//매개변수가 필요없이 회원리스트 전체를 JSONObject로 반환
	@RequestMapping("/android/memberObject.do")
	@ResponseBody
	public Map<String, Object> memberObject(HttpServletRequest req) {
		
		Map<String, Object> map = new HashMap<String, Object>();		
		ArrayList<MemberDTO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).memberList();
		map.put("memberList", lists);
		return map;
	}

	//JSONArray로 데이터 반환
	@RequestMapping("/android/memberList.do")
	@ResponseBody
	public ArrayList<MemberDTO> memberList(HttpServletRequest req) {
		System.out.println("요청들어옴");
		ArrayList<MemberDTO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).memberList();
		return lists;
	}
			
	/*
	파라미터로 전달되는 아이디, 패스워드를 request객체가 아닌
	커멘트객체를 통해 한번에 받는다. 회원인증 결과를 JSONObject로
	반환한다. 
	 */
	@RequestMapping("/android/memberLogin.do")
	@ResponseBody
	public Map<String, Object> memberLogin(MemberDTO memberDTO) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();

		MemberDTO memberInfo =
			sqlSession.getMapper(IAndroidDAO.class).memberLogin(memberDTO);
		
		if(memberInfo==null) {
			//회원정보 불일치로 로그인에 실패한 경우..결과만 0으로 내려준다.
			returnMap.put("isLogin", 0);
		}
		else {
			//로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다. 
			returnMap.put("memberInfo", memberInfo);
			returnMap.put("isLogin", 1);
		}
		
		System.out.println("요청들어옴:"+returnMap);
		return returnMap;
	}
	
	@RequestMapping("/android/memberInfo.do")
	@ResponseBody
	public Map<String, Object> memberInfo(MemberDTO memberDTO) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		MemberDTO Info =
				sqlSession.getMapper(IAndroidDAO.class).memberInfo(memberDTO);
		
		returnMap.put("memberInfo", Info);
		returnMap.put("isLogin", 1);

		System.out.println("요청들어옴:"+returnMap);
		return returnMap;
	}
	
	@RequestMapping("/android/delstart.do")
	@ResponseBody
	public Map<String, Object> delstart(MissionDTO missionDTO) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		MissionDTO Info =
				sqlSession.getMapper(IAndroidDAO.class).delstart(missionDTO);
		
		returnMap.put("getMission", Info);
		returnMap.put("success", 1);

		System.out.println("요청들어옴:"+returnMap);
		return returnMap;
	}
	
	
	@RequestMapping("/android/ImemberDelete.do")
	@ResponseBody
	public Map<String, Object> ImemberDelete(MemberDTO memberDTO) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		MemberDTO Delete =
			sqlSession.getMapper(IAndroidDAO.class).ImemberDelete(memberDTO);
		returnMap.put("ImemberDelete", Delete);
		returnMap.put("isLogin", 1);

		System.out.println("요청들어옴:"+returnMap);
		return returnMap;
	}
	
	@RequestMapping("/android/mboardList.do")
	@ResponseBody
	public ArrayList<MBoardDTO> mboardList(HttpServletRequest req) {
		System.out.println("요청들어옴");
		ArrayList<MBoardDTO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).mboardList();
		return lists;
	}
	
	@RequestMapping("/android/mboardView.do")
	@ResponseBody
	public Map<String, Object> mboardView(MBoardDTO mboardDTO) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		MBoardDTO Views = 
			sqlSession.getMapper(IAndroidDAO.class).mboardView(mboardDTO);
		returnMap.put("mboardView", Views);

		System.out.println("요청들어옴:"+returnMap);
		return returnMap;
	}
	
	
	//미션 리스트쪽
	@RequestMapping("/android/missionObject.do")
	@ResponseBody
	public Map<String, Object> missionObject(HttpServletRequest req) {
      
		Map<String, Object> map = new HashMap<String, Object>();      
		ArrayList<MissionDTO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).missionList();
		
		map.put("missionList", lists);
		return map;
	}
	
	@RequestMapping("/android/missionList.do")
	@ResponseBody
	public ArrayList<MissionDTO> missionList(HttpServletRequest req) {
		
		ArrayList<MissionDTO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).missionList();

		return lists;
	}
	
	//미션 뷰쪽
	@RequestMapping("/android/missionViewObject.do")
	@ResponseBody
	public Map<String, Object> missionViewObject(MissionDTO missionDTO) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		ArrayList<MissionDTO> view = 
				sqlSession.getMapper(IAndroidDAO.class).missionView(missionDTO);
		returnMap.put("missionView", view);
		return returnMap;
	}
	
	
	@RequestMapping("/android/missionView.do")
	@ResponseBody
	public ArrayList<MissionDTO> missionView(MissionDTO missionDTO) {
		
		ArrayList<MissionDTO> view = 
				sqlSession.getMapper(IAndroidDAO.class).missionView(missionDTO);
		return view;
	}
	
	@RequestMapping("/android/missionListSearch.do")
	@ResponseBody
	public ArrayList<MissionDTO> missionListSearch(ParameterDTO parameterDTO) {
		
		ArrayList<MissionDTO> search = 
				sqlSession.getMapper(IAndroidDAO.class).missionListSearch(parameterDTO);
		System.out.println("리스트="+search);
		return search;
	}
	

	@RequestMapping("/android/reviewList.do")
	@ResponseBody
	public ArrayList<mybatis.ParameterDTO> reviewList(mybatis.ParameterDTO parameterDTO) {
		
		ArrayList<mybatis.ParameterDTO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).reviewList(parameterDTO);
		System.out.println("리스트="+lists);
		return lists;
	}

}
