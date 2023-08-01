<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDao" %>
<%
    int intro = Integer.parseInt(request.getParameter("intro"));
    String id = (String)session.getAttribute("id"); 
    MemberDao memberDao = new MemberDao();
    boolean priceCheck1 = memberDao.priceCheck(id, intro);
    String responseMsg = "";
    if (priceCheck1) {
        memberDao.pay(id, intro);
        responseMsg="컨텐츠(intro)를 구입하였습니다.";
    } else {
    	responseMsg="포인트가 부족합니다. 광고를 클릭하세요.";
    }
    out.println(responseMsg);
%>