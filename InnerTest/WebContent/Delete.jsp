<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDao" %>
<%
    String id = request.getParameter("deleteID");
    MemberDao memberDao = new MemberDao();
    memberDao.delete(id);
    out.println("삭제되었습니다.");
%>