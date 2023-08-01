<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int addPoint = Integer.parseInt(request.getParameter("addPoint"));
	String id = (String)session.getAttribute("id");
	MemberDao memberDao = new MemberDao();
	memberDao.addPoint(id, addPoint);
%>
<script>
	alert("<%=addPoint%>점이 적립되었습니다.");
	window.open('https://www.koreaisacademy.com');
	location.href="Main.jsp";
</script>

