<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	session.removeAttribute("id");
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href="Login.jsp";
</script>
