<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <div class="sidebar-brand-icon">
                    <img alt="" src="img/icon.png">
                </div>
                <div class="sidebar-brand-text mx-3">${UserName}</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <li class="nav-item active">
            
            <%if (session.getAttribute("UserName") == null){ %>
            	<a class="nav-link" href="login.jsp">
            		<i class="bi bi-box-arrow-in-right"></i>
            		<span>Login</span></a>
            <%}
            else{%>
            	<a class="nav-link" href="logout.jsp">
            		<i class="bi bi-box-arrow-right"></i>
            		<span>Logout</span></a>
            <%
            }%>
            </li>
            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>설정</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">관리</h6>
                        <a class="collapse-item" href="membertables.jsp">회원 권한수정</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#mission"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="bi bi-bag-fill"></i>
                    <span>심부름 관리</span>
                </a>
                <div id="mission" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">심부름 관리:</h6>
                        <a class="collapse-item" href="missiontables.jsp?flag=1">심부름 매칭중</a>
                        <a class="collapse-item" href="missiontables.jsp?flag=2">심부름 매칭완료</a>
                        <a class="collapse-item" href="missiontables.jsp?flag=3">심부름 완료</a>
                    </div>
                </div>
            </li>

            <!-- 게시판관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>게시판 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">게시판 관리:</h6>
                        <a class="collapse-item" href="member_list.jsp?flag=notice">공지사항</a>
                        <a class="collapse-item" href="member_list.jsp?flag=qna">Q&A게시판</a>
                    </div>
                </div>
            </li>
        </ul>