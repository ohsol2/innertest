<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDao memberDao = new MemberDao();
	boolean loginCheck = memberDao.loginCheck(id, pw);
	
	if(!loginCheck){
%>
<script>
	alert("아이디/비밀번호를 다시 확인하세요");
	location.href="Login.jsp";
</script>
<%
	}else if(id.equals("admin")){
		session.setAttribute("id", id);
%>
<script>
	location.href="Setting.jsp";
</script>
<%
	}else {
	session.setAttribute("id", id);
%>
<script>
	location.href="Main.jsp";
</script>
<%
	}
%>