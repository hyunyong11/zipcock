<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="utils.JSFunction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.invalidate();
	JSFunction.alertLocation("심부름이 정상적으로 등록되었습니다.","/zipcock" , out);
%>