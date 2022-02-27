package mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
 
@Service
public interface IBoardDAO {

	//게시물 갯수 카운트
	public int getTotalCount(QParameterDTO parameterDTO);
	//페이징 적용된 게시물 가져오기
	public ArrayList<QBoardDTO> listPage(QParameterDTO parameterDTO);
	//게시물 내용보기
	public ArrayList<QBoardDTO> view(QParameterDTO parameterDTO);
	//게시물 작성
	public int write(QBoardDTO boardDTO);
	
	//리뷰 내용보기
	public ArrayList<QReviewDTO> review(QParameterDTO parameterDTO);
	//리뷰작성
	public int rewrite(QReviewDTO boardDTO);
	
	
	//수정처리
	public int modify(QBoardDTO boardDTO);
	//삭제처리
	public int delete(String num);
}
