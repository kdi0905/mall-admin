<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//비로그인 일시 로그인페이지 이동
if (session.getAttribute("loginAdminId") == null) {
	response.sendRedirect("/mall-admin/login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.color {
	background-color: #F6F6F6;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#noticeTitle").val()==""){
				alert("공지사항 제목을 입력하세요");
				return;
			}else if($("#noticeContent").val()==""){
				alert("공지사항 내용을 입력하세요");
				return;
			}
			$("#noticeForm").submit();
		});
	});
</script>
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<div class="color">
		<div class="container ">
			<h1 class="text-dark ">공지사항 추가</h1>

			<!-- 공지사항 추가 넘겨주기 -->
			<form method="post"
				action="<%=request.getContextPath()%>/notice/addNoticeListAction.jsp" id="noticeForm">
				<table class="table table-bordered table-striped "
					style="text-align: center;">
					<tr>
						<td>공지사항 제목</td>
						<td><input type="text" name="noticeTitle" id="noticeTitle"></td>
					</tr>
					<tr>
						<td>공지사항 내용</td>
						<td><textarea rows="10" cols="50" name="noticeContent" id="noticeContent"></textarea>
					</tr>
				</table>
				<button class="btn btn-outline-secondary" type="button" id="btn">추가</button>
				<a class="btn btn-outline-secondary"
					href="<%=request.getContextPath()%>/notice/noticeList.jsp">취소</a>
			</form>

		</div>
	</div>
</body>
</html>