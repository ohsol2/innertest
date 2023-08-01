<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<% 
	MemberDao memberDao = new MemberDao();
	String id = (String)session.getAttribute("id");
	MemberDto memberDto = memberDao.select1(id);
	int pointRandom = (int) (Math.random() * 1000) + 1;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인페이지</title>
	<link rel="stylesheet" href="css/Main.css">
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
		$(function() {
			$("#logout").click(function() {
				location.href="LogoutAction.jsp";
			});
			$("#intro").click(function() {
				 $.ajax({
                    type: "POST",
                    url: "Purchase.jsp", 
                    data: { intro: 100000 }, 
                    success: function(response) {
                    	alert(response);
                    	},
                    error: function() {
                        alert("오류가 발생하였습니다.");
                    }
                });
			});
			$("#java").click(function() {
				$.ajax({
                    type: "POST",
                    url: "Purchase2.jsp", 
                    data: { java: 500000 }, 
                    success: function(response) {
                        alert(response); 
                    },
                    error: function() {
                        alert("오류가 발생하였습니다.");
                    }
                });
			});
			$("#cpp").click(function() {
				$.ajax({
                    type: "POST",
                    url: "Purchase3.jsp", 
                    data: { cpp: 300000 }, 
                    success: function(response) {
                        alert(response); 
                    },
                    error: function() {
                        alert("오류가 발생하였습니다.");
                    }
                });
			});
			$("#adkorea").click(function() {
				location.href="AddPointAction.jsp?addPoint=<%=pointRandom%>";
			});
		});
	</script>
</head>
<body>
	<h1>메인페이지</h1>
	<div class="fr">
		<%=memberDto.getName()%>(<%=memberDto.getId() %>)님 안녕하세요.
		<input type="button" id="logout" value="로그아웃">
		<br>
		포인트 : <%=memberDto.getPoint() %>점
	</div>
	<h3>구입할 컨텐츠를 선택하세요.</h3>
	 <table>
        <tr>
            <td>
				<img id="intro" src = "img/Intro_350_408.png">
				<br>
				100,000포인트
			</td>
            <td>
				<img id="java" src = "img/Java_350_408.png">
				<br>
				500,000포인트
			</td>
            <td>
				<img id="cpp" src = "img/Cpp_350_408.png">
				<br>
				300,000포인트
			</td>
        </tr>
    </table>
	<div class="fr" style="border: 1px solid #bfbfbf; margin-top:10px;">
	&lt;광고&gt;<br>
		<img id="adkorea" src ="img/korea_it.png">
	</div>
</body>
</html>