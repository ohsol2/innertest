<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MemberDao memberDao = new MemberDao();
	String id = request.getParameter("id");
	MemberDto memberDto = memberDao.select1(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리-수정관리자</title>
</head>
<body>
	<h1>회원관리-수정관리자</h1>
	<form action="UpdateAction.jsp" method="post">
		 <table>
	        <tr>
	            <td>ID</td>
	            <td><input type="text" id="id" name="id" readonly value="<%=memberDto.getId()%>"></td>
	        </tr>
	        <tr>
	            <td>PW</td>
	            <td><input type="text" id="pw" name="pw" value="<%=memberDto.getPw()%>"></td>
	        </tr>
	        <tr>
	            <td>Name</td>
	            <td><input type="text" id="name" name="name" value="<%=memberDto.getName()%>"></td>
	        </tr>
	        <tr>
	            <td>point</td>
	            <td><input type="text" id="point" name="point" value="<%=memberDto.getPoint()%>"></td>
	        </tr>
	        <tr>
	            <td colspan="2" align="center">
	                <input type="submit" style="width:100%;" id="submit" value="제출">
	            </td>
	        </tr>
	    </table>
	</form>
</body>
</html>