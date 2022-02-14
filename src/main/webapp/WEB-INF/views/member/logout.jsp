<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	JSFunction.alertLocation("로그아웃되었습니다.","zipcock.do" , out);
%>