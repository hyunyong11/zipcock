package com.kosmo.zipcock;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

/*
@ServerEndpoint
	: 웹소켓 서버의 요청명을 지정한다.
	주소는 ws://localhost:8081/websocket/EchoServer.do 이와 같이 설정한다.
	http 대신 웹소켓이라는 의미로 ws를 사용한다.
 */
@Controller
@ServerEndpoint("/EchoServer.do")
public class WebSocketChat {
	   
   /*
   해당 List컬렉션은 클라이언트가 접속할때마다 Session아이드를 저장하는
   용도로 사용된다.
   접속한 웹브라우저가 웹소켓을 지원해야 하며, 웹브라우저를 닫으면 OnClose가
   호출된다. 
   */
   private static final List<Session> sessionList = new ArrayList<Session>();
   private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
   
   public WebSocketChat() {
      System.out.println("웹소켓(서버) 객체생성");
   }
   
   //클라이언트가 접속했을때 호출됨
   @OnOpen
   public void onOpen(Session session) {
      //로그출력 : 접속한 클라이언트의 세션 아이디
      logger.info("새로운 session id="+ session.getId());
      try {
         final Basic basic = session.getBasicRemote();
         logger.info("새로운 session getBasicRemote="+basic);
         
         //클라이언트에게 메세지 보냄
         basic.sendText("대화방에 연결 되었습니다");
      }
      catch (Exception e) {
         System.out.println(e.getMessage());
      }
      //클라이언트가 접속하면 List컬렉션에 추가한다.
      sessionList.add(session);
   }
   
   /*
   자동으로 호출되진 않고, 서버로 메세지가 왔을때 해당 메서드를 호출한다.
   현재 접속한 모든 클라이언트에게 메세지를 전송한다.
   */
   private void sendAllSessionToMessage(Session self, String message) {
      try {
         //List컬렉션에 저장된 클라이언트 만큼 반복한다.
         for(Session session : WebSocketChat.sessionList) {
            //메세지를 보낸 자신을 제외한 나머지에게 메세지를 전송한다.
            if(!self.getId().equals(session.getId())) {
               //sendText() 메서드를 통해 클라이언트에게 메세지를 전송한다.
               session.getBasicRemote().sendText(message);
            }
         }
      }
      catch (Exception e) {
         System.out.println(e.getMessage());
      }
   }
   //클라이언트가 서버측으로 메세지를 보냈을때 호출된다.
   @OnMessage
   public void onMessage(String message, Session session) {
      try {
         final Basic basic = session.getBasicRemote();
         logger.info("메세지 도착:"+ basic + "="+ message);
      }
      catch (Exception e) {
         System.out.println(e.getMessage());
      }
      //클라이언트 전체에게 메세지 전송
      sendAllSessionToMessage(session, message);
   }

   //채팅중 오류가 발생했을때 호출
   @OnError
   public void onError(Throwable e, Session session) {
      System.out.println(e.getMessage());
   }
   
   //클라이언트가 접속을 종료했을때 호출
   @OnClose
   public void onClose(Session session) {
      //접속을 종료하면 List컬렉션에서 삭제한다.
      sessionList.remove(session);
      logger.info("접속종료:"+session.getId());
   }
}

