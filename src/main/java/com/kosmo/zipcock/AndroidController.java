package com.kosmo.zipcock;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.MBoardDTO;
import membership.MemberDTO;
import mission.MissionDTO;
import mybatis.IAndroidDAO;
import mybatis.ParameterDTO;

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
	
	@RequestMapping("/android/simList.do")//추가
	@ResponseBody
	public ArrayList<MissionDTO> simList(MissionDTO missionDTO) {
		
		//System.out.println("심부름 리스트 요청받음");

		ArrayList<MissionDTO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).simList(missionDTO);
		System.out.println("리스트="+lists);
		return lists;
	}
	
	@RequestMapping("/android/HsimList.do")//추가
	@ResponseBody
	public ArrayList<MissionDTO> HsimList(MissionDTO missionDTO) {
		
		//System.out.println("심부름 리스트 요청받음");

		ArrayList<MissionDTO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).HsimList(missionDTO);
		//System.out.println("리스트="+lists);
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
	public ArrayList<MissionDTO> missionListSearch(mission.ParameterDTO parameterDTO) {
		
		ArrayList<MissionDTO> search = 
				sqlSession.getMapper(IAndroidDAO.class).missionListSearch(parameterDTO);
		System.out.println("검색리스트="+search);
		return search;
	}
	

	@RequestMapping("/android/reviewList.do")
	@ResponseBody
	public ArrayList<ParameterDTO> reviewList(ParameterDTO parameterDTO) {
		
		ArrayList<ParameterDTO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).reviewList(parameterDTO);
		return lists;
	}
	
	
	@RequestMapping("/android/Reviewmodify.do")
    @ResponseBody
    public int Reviewmodify(ParameterDTO parameterDTO) {
        //Map<String, Object> returnMap = new HashMap<String, Object>();
		int Reviewmodify =
            sqlSession.getMapper(IAndroidDAO.class).Reviewmodify(parameterDTO);
        
        return Reviewmodify;
    }
    
    @RequestMapping("/android/Reviewdelete.do")
    @ResponseBody
    public Map<String, Object> Reviewdelete(ParameterDTO parameterDTO) {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        ParameterDTO Reviewdelete =
            sqlSession.getMapper(IAndroidDAO.class).Reviewdelete(parameterDTO);
        returnMap.put("Reviewdelete", Reviewdelete); 
        //System.out.println("요청들어옴:"+returnMap);
        return returnMap;
    }

    
    @RequestMapping("/android/memberInfoEdit.do")
    @ResponseBody
    public int memberInfoEdit(MemberDTO memberDTO) {
      
       int memberInfoEdit = 
             sqlSession.getMapper(IAndroidDAO.class).memberInfoEdit(memberDTO);
       
       
       return memberInfoEdit;
    }
    
    @RequestMapping("/android/hmemberInfoEdit.do")
    @ResponseBody
    public int hmemberInfoEdit(MemberDTO memberDTO) {
      
       int hmemberInfoEdit = 
             sqlSession.getMapper(IAndroidDAO.class).hmemberInfoEdit(memberDTO);
       
       
       return hmemberInfoEdit;
    }
    
    
    /*
    회원가입 전 id중복확인
    */
    @RequestMapping("/android/memberCheck.do")
    @ResponseBody
    public Map<String, Object> memberCheck(MemberDTO memberDTO) {
        
        Map<String, Object> idCheck = new HashMap<String, Object>();
        
        MemberDTO idList = sqlSession.getMapper(IAndroidDAO.class).idCheck(memberDTO);
        
        if(idList == null) {
            idCheck.put("isCheck", 0);
        }
        else {
            idCheck.put("isCheck", 1);
            idCheck.put("idList", idList);
        }
        
        System.out.println("중복체크요청 : " + idList);
        return idCheck;
        
    }
    
    /*
    헬퍼 회원가입 (파일업로드) 
    */
    @RequestMapping(method=RequestMethod.POST, value="/android/memberJoin.do")
    @ResponseBody
    public List<Object> uploadAndroid(MultipartHttpServletRequest req, MemberDTO memberDTO) {
        
    
     
     //물리적경로 얻어오기
     String path = req.getSession().getServletContext().getRealPath("/resources/upload");
     MultipartFile mfile = null;
     //파일정보를 저장한 Map컬렉션을 2개이상 저장하기 위한 용도의 List컬렉션
     List<Object> resultList = new ArrayList<Object>();          
     
     try {
         String title = req.getParameter("title");
         
         //업로드폼의 file속성의 필드를 가져온다.(여기서는 2개임)
         Iterator itr = req.getFileNames();
         //갯수만큼 반복
         while(itr.hasNext()) {
             //전송된 파일명을 읽어온다.
             mfile = req.getFile(itr.next().toString());
             
             //한글깨짐방지 처리 후 전송된 파일명을 가져온다.
             String originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
             
             //서버로 전송된 파일이 없다면 while문의 처음으로 돌아간다.
             if("".equals(originalName)) continue;
             
             //파일명에서 확장자를 따낸다.
             String ext = originalName.substring(originalName.lastIndexOf('.'));
             
             //UUID를 통해 생성된 문자열과 확장자를 결합해서 파일명을 완성한다.
             String saveFileName = getUuid() + ext;
             
             //물리적경로에 새롭게 생성된 파일명으로 파일 저장
             mfile.transferTo(new File(path + File.separator + saveFileName));
             //폼값과 파일명을 저장할 Map컬렉션 생성
             Map<String, String> fileMap = new HashMap<String, String>();
             
             fileMap.put("originalName", originalName);
             fileMap.put("saveFileName", saveFileName);
             memberDTO.setMember_ofile(originalName);
             memberDTO.setMember_sfile(saveFileName);
             
             resultList.add(fileMap);
             
         }
     }       
     catch(Exception e) {
         e.printStackTrace();
     }
     
     memberDTO.setMember_status(2);
     sqlSession.getMapper(IAndroidDAO.class).memberJoin(memberDTO);
     
     
     //model.addAttribute("resultList", resultList);    
     return resultList;
    }
        
    
    //서버 업로드를 위한 메소드
    public static String getUuid() {
        String uuid = UUID.randomUUID().toString();
        System.out.println("생성된UUID-1:"+uuid);
        
        return uuid;
    }
    
    /*
    사용자 회원가입 
    */
    @RequestMapping(value = "/android/cMemberJoin.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> cMemberJoin(MemberDTO memberDTO, HttpServletRequest req) {
        
        Map<String, Object> result = new HashMap<String, Object>();
        
        memberDTO.setMember_status(1);
        
        sqlSession.getMapper(IAndroidDAO.class).cMemberJoin(memberDTO);
        
        
        result.put("result", 1);
        
        
        return result;
        
    }
    
    /* 
    아이디 비밀번호 찾기
     */
    @RequestMapping("/android/findId.do")
    @ResponseBody
    public Map<String, Object> findId(HttpServletRequest req, MemberDTO memberDTO){
        Map<String, Object> findMap = new HashMap<String, Object>();
        MemberDTO memberfindId =
                sqlSession.getMapper(IAndroidDAO.class).findId(memberDTO);
        if(memberfindId==null) {
            //회원정보 불일치로 로그인에 실패한 경우..결과만 0으로 내려준다.
            findMap.put("findid", 0);
        }
        else {
            //로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다. 
            findMap.put("memberfindId", memberfindId);
            findMap.put("findid", 1);
        }
        return findMap;
    }
    @RequestMapping("/android/findPass.do")
    @ResponseBody
    public Map<String, Object> findPass(HttpServletRequest req, MemberDTO memberDTO){
        Map<String, Object> findPMap = new HashMap<String, Object>();
        String id=req.getParameter("member_id");
        System.out.println(id);
        MemberDTO memberfindPass =
                sqlSession.getMapper(IAndroidDAO.class).findPass(memberDTO);
        if(memberfindPass==null) {
            //회원정보 불일치로 로그인에 실패한 경우..결과만 0으로 내려준다.
            findPMap.put("findPass", 0);
        }
        else {
            //로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다. 
            findPMap.put("memberfindPass", memberfindPass);
            findPMap.put("findPass", 1);
        }
        return findPMap;
    }
    
    
    /*
    심부름 등록 (파일업로드)
    */
    @RequestMapping(method=RequestMethod.POST, value="/android/request.do")
    @ResponseBody
    public List<Object> MissionUpload(MultipartHttpServletRequest req, MissionDTO missionDTO) {
        
     //물리적경로 얻어오기
     String path = req.getSession().getServletContext().getRealPath("/resources/upload");
     MultipartFile mfile = null;
     //파일정보를 저장한 Map컬렉션을 2개이상 저장하기 위한 용도의 List컬렉션
     List<Object> resultList = new ArrayList<Object>();          
     
     try {
         
         //업로드폼의 file속성의 필드를 가져온다.(여기서는 2개임)
         Iterator itr = req.getFileNames();
         //갯수만큼 반복
         while(itr.hasNext()) {
             //전송된 파일명을 읽어온다.
             mfile = req.getFile(itr.next().toString());
             
             //한글깨짐방지 처리 후 전송된 파일명을 가져온다.
             String originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
             
             //서버로 전송된 파일이 없다면 while문의 처음으로 돌아간다.
             if("".equals(originalName)) continue;
             
             //파일명에서 확장자를 따낸다.
             String ext = originalName.substring(originalName.lastIndexOf('.'));
             
             //UUID를 통해 생성된 문자열과 확장자를 결합해서 파일명을 완성한다.
             String saveFileName = getUuid() + ext;
             
             //물리적경로에 새롭게 생성된 파일명으로 파일 저장
             mfile.transferTo(new File(path + File.separator + saveFileName));
             //폼값과 파일명을 저장할 Map컬렉션 생성
             Map<String, String> fileMap = new HashMap<String, String>();
             
             fileMap.put("originalName", originalName);
             fileMap.put("saveFileName", saveFileName);
             missionDTO.setMission_ofile(originalName);
             missionDTO.setMission_sfile(saveFileName);
             
             resultList.add(fileMap);
             
         }
     }       
     catch(Exception e) {
         e.printStackTrace();
     }
    
     sqlSession.getMapper(IAndroidDAO.class).missionRegist(missionDTO);
     System.out.println("들어오기");
     
     //model.addAttribute("resultList", resultList);    
     return resultList;
    }
    @RequestMapping("/android/helperLocation.do")
	@ResponseBody
	public Map<String, Object> helperLocation(MissionDTO missionDTO) {
      
		Map<String, Object> returnMap = new HashMap<String, Object>();      
		MissionDTO lists = 
				sqlSession.getMapper(IAndroidDAO.class).helperLocation(missionDTO);
		

		returnMap.put("missionList", lists);
		returnMap.put("isLogin", 1);
		
		System.out.println("오브젝트:"+lists);
		return returnMap;
	}
	
	@RequestMapping("/android/insertLocation.do")
	@ResponseBody
	public int insertLocation(MissionDTO missionDTO) {
		int rst = 0;
		rst = sqlSession.getMapper(IAndroidDAO.class).insertLocation(missionDTO);
		return rst;
	}
	
	@RequestMapping("/android/complete.do")
	@ResponseBody
	public int complete(MissionDTO missionDTO) {  
		int rst = 0;
		rst = sqlSession.getMapper(IAndroidDAO.class).complete(missionDTO);
		return rst;
	}
	
	@RequestMapping("/android/Hcomplete.do")
	@ResponseBody
	public int Hcomplete(MissionDTO missionDTO) {  
		int rst = 0;
		rst = sqlSession.getMapper(IAndroidDAO.class).Hcomplete(missionDTO);
		return rst;
	}
	
	@RequestMapping("/android/matching.do")
	@ResponseBody
	public int matching(MissionDTO missionDTO) {  
		int rst = 0;
		rst = sqlSession.getMapper(IAndroidDAO.class).matching(missionDTO);
		return rst;
	}
	

    
    
}

