<%@page import="java.util.ArrayList"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MemberDao memberDao = new MemberDao();
	ArrayList<MemberDto> memberDto = memberDao.selectAll();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
	<link rel="stylesheet" href="css/Setting.css">
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
		$(function() {
			$(".delete").click(function() {
				let id = $(this).parent().parent(".list").find(".id").text();
				$.ajax({
                    type: "POST",
                    url: "Delete.jsp", 
                    data: { deleteID : id }, 
                    success: function(response) {
                        alert(response); 
                    },
                    error: function() {
                        alert("오류가 발생하였습니다.");
                    }
                });
			});
			$(".update").click(function() {
				let id = $(this).parent().parent(".list").find(".id").text();
				location.href="Update.jsp?id="+id;
			});
		});
	</script>
	<script>
	function startScheduler() {
		 $.ajax({
             type: "GET",
             url: "sceStart.jsp",
             success: function(response) {
             },
             error: function(xhr, status, error) {
                 alert("스케줄러 시작 실패: " + error);
             }
         });
    }

    function stopScheduler() {
    	$.ajax({
            type: "GET",
            url: "sceEnd.jsp",
            success: function(response) {
            },
            error: function(xhr, status, error) {
                alert("스케줄러 종료 실패: " + error);
            }
        });
    }
    function login() {
    	location.href="Login.jsp";
    }
	</script>
	<style>
	body {
		width : 480px;
	}
	</style>
</head>
<body>
	<div class="fl"><h1>회원관리</h1></div>
	<div class="fr"><input onclick="login()"style="margin-top : 30px;;" type=button value="로그인"></div>
	<div style="clear:both;"></div>
		 <table>
	        <tr>
	            <th>ID</th>
	            <th>PW</th>
	            <th>Name</th>
	            <th>Point</th>
	            <th>수정</th>
	            <th>삭제</th>
	        </tr>
	        <%for(MemberDto dto : memberDto) { %>
	        <tr class="list">
	            <td class="id"><%=dto.getId() %></td>
	            <td><%=dto.getPw() %></td>
	            <td><%=dto.getName() %></td>
	            <td><%=dto.getPoint() %></td>
	            <td><input class="update" type="button" value="수정"></td>
	            <td><input class="delete" type="button" value="삭제"></td>
	        </tr>
	        <%} %>
	    </table>
	 <h1>스케줄러관리</h1>
	 <input type="button" onclick="startScheduler()" value="스케줄러(20초마다 포인트1 증가) 실행 시작">
	 <input type="button" onclick="stopScheduler()" value="스케줄러 실행 종료">
</body>
</html>