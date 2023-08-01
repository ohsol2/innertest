<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="SignupAction.jsp" method="post">
		 <table>
	        <tr>
	            <td>ID :</td>
	            <td><input type="text" id="id" name="id"></td>
	        </tr>
	        <tr>
	            <td>PW :</td>
	            <td><input type="password" id="pw" name="pw"></td>
	        </tr>
	        <tr>
	            <td>Name :</td>
	            <td><input type="text" id="name" name="name"></td>
	        </tr>
	        <tr>
	            <td colspan="2" align="center">
	                <input type="submit" style="width:100%;" id="signup" value="작성완료">
	            </td>
	        </tr>
	    </table>
	</form>
</body>
</html>