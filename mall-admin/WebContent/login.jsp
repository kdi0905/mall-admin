<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% if(session.getAttribute("loginAdminId")!=null){
    		System.out.println("이미 로그인 되어있는 상태입니다.");
    		response.sendRedirect("/mall-admin/index.jsp");
    
    }
    	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.color {
	background-color: #F6F6F6;
}
.co {
 	backgrount-color: #C8C8C8;
 }
.tablecolor {
	background-color: #FFFFFF;
	}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script>
$(document).ready(function() {
	$("#btn").click(function(){
		if($("#adminId").val()==""){
			alert("ID를 입력해주세요");
			return;
		}else if($("#adminPw").val()==""){
			alert("PW를 입력해주세요");
			return;
		}
		$("#loginForm").submit();
	})
	
})
</script>
</head>
<body>
<% int count = 0;
	if(request.getParameter("count")!=null){
		count = Integer.parseInt(request.getParameter("count"));
	}
	System.out.println(count);
	System.out.println(session.getAttribute("loginAdminId"));%>
<div class ="color">
	<div class ="container ">
	<h1 class ="text-dark ">관리자 로그인</h1>
	<!-- 절대주소사용 -->
	<form method ="post" action = "/mall-admin/loginAction.jsp" id="loginForm">
	<table class ="table table-bordered table-hover table-striped"  style="text-align: center;">
		<tr>
			<td class ="text-dark ">관리자 ID</td>
			<td><input type ="text" id ="adminId" name ="adminId" value="admin@goodee.com"></td>
		</tr>
		<tr>
			<td class ="text-dark ">관리자 PW</td>
			<td><input type ="password" id="adminPw" name ="adminPw" value="1234"></td>
			
		</tr>
	</table>
	<%if(session.getAttribute("loginAdminId")==null&&count==1){
		%>
			<div class ="text-danger">가입중이 아니거나, 로그인 또는 비밀번호가 다릅니다.</div>
		<%
		}else{
			%>
				<div>&nbsp;</div>
			<%
			}
	%>
	
	<button  class="btn btn-outline-secondary" type ="button" id="btn">로그인</button>
	</form>
	</div>
	</div>
</body>
</html>