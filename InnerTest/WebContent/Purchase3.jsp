<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDao" %>
<%
    int cpp = Integer.parseInt(request.getParameter("cpp"));
    String id = (String)session.getAttribute("id"); 
    MemberDao memberDao = new MemberDao();
    boolean priceCheck1 = memberDao.priceCheck(id, cpp);
    if (priceCheck1) {
        memberDao.pay(id, cpp);
        out.println("컨텐츠(c++)를 구입하였습니다.");
    } else {
        out.println("포인트가 부족합니다. 광고를 클릭하세요.");
    }
%>