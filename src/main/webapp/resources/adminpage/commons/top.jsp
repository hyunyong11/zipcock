<%@ page language="java" contentType="text/html; charset=UTF-8"
   	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">	
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

         <ul class="navbar-nav ml-auto">

             <li class="nav-item dropdown no-arrow">
                 <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     <span class="mr-2 d-none d-lg-inline text-gray-600 small">${UserName}</span>
                     <img class="img-profile rounded-circle"
                         src="img/undraw_profile.svg">
                 </a>
                 <!-- Dropdown - User Information -->
                 <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                     aria-labelledby="userDropdown">
                     <div class="dropdown-divider"></div>
                     <%if (session.getAttribute("UserName") == null){ %>
               	<a class="dropdown-item" href="login.jsp" >
                         <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                         Login
               <%}
               else{%>		                        
                     	<a class="dropdown-item" href="logout.jsp" data-toggle="modal" data-target="#logoutModal">
                         <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                         Logout
               <%
               }%>
                     </a>
                 </div>
             </li>

         </ul>

     </nav>