package board.command;

import org.springframework.ui.Model;
//게시판의 모든 Command클래스가 구현할 인터페이스를 정의한다.
public interface BbsCommandImpl {

	//인터페이스에 정의한 모든 메서드는 public abstract로 선언된다.
	void execute(Model model);
}
/*
게시판에서 구현될 모든 Command를 각각의 타입에 의해서가 아니라
해당 인터페이스 형으로 참조할 수 있게 되므로 관리가 훨씬 편해진다.
(부모 타입의 참조변수로 자식 타입의 객체를 참조할 수 있다.(이질화))
*/
