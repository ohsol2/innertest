<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	int point = Integer.parseInt(request.getParameter("point"));	
	MemberDao memberDao = new MemberDao();
	memberDao.update(id,pw, name, point);
%>
<script>
	alert("수정되었습니다.");
	location.href="Setting.jsp";
</script>

