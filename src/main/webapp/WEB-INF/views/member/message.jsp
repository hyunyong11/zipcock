<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="utils.JSFunction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.invalidate();
	JSFunction.alertLocation("가입완료! 집콕에 오신것을 환영합니다^^","zipcock.do" , out);
%>