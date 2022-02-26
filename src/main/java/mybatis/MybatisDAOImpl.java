package mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

/*
해당 인터페이스는 컨트롤러와 DAO사이에서 매개역할을 하는 서비스
객체로 사용된다.
@Service 어노테이션은 빈을 자동으로 생성하기 위한 용도이지만 
여기서는 단순히 역할을 명시적으로 표현하기 위해 사용되었다. 
따라서 필수 사항은 아니다.   
 */
@Service
public interface MybatisDAOImpl {
	
	/*
	방명록 1차 버전에서 사용하는 메서드
	게시물수 카운트와 목록에 출력할 게시물 가져오기
	 */
	public int getTotalCount();//파라미터 없음
	public ArrayList<MyBoardDTO> listPage(String review_id, int s, int e);//파라미터 2개 있음
	
	/*
	@Param 어노테이션을 통해 파라미터를 전달하면 Mapper에서는 별칭을 통해
	인파라미터 처리를 할 수 있다. 
	 */
	public int write(@Param("_review_id") String review_id, 
            @Param("_mission_num") String mission_num,
            @Param("_review_point") String review_point,
            @Param("_review_content") String review_content);
	
	//기존 게시물의 내용을 읽어오기 위한 메서드
	public MyBoardDTO view(ParameterDTO parameterDTO);
	//수정처리
	public int modify(MyBoardDTO myBoardDTO);
	//삭제처리
	public int delete(String review_num, String review_id);
		
	public int getTotalCount(String member_id);
	
	
	
	
}