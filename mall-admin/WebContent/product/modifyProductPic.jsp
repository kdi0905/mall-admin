<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%
	if (session.getAttribute("loginAdminId") == null) {
	response.sendRedirect("/mall-admin/login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyProductPic</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.color {
	background-color: #F6F6F6;
}

.tablecolor {
	background-color: #FFFFFF;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script >
	$(document).ready(function() {
		$("#btn").click(function(){
			if($("#productPic").val()==""){
				alert("사진을 넣어주세요");
				return;
			}
			$("#productPicForm").submit();
		})
	})
</script>
</head>
<body>
	<%
		int productId = Integer.parseInt(request.getParameter("productId"));
	%>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="color">
		<div class="container ">
			<h1 class="text-dark ">상품 이미지 수정</h1>
			<!-- 이미지 수정 -->

			<!--문자열 만 파일추가  -->
			<!-- <form	action="" method="post" enctype="application/x-www-form-urlencoded"> -->
			<!-- 모든글자를 파일로 넘긴다(이미지수정) 받을때 string으로 받는다  int로 받으면 오류 -->

			<form id="productPicForm"
				action="<%=request.getContextPath()%>/product/modifyProductPicAction.jsp"
				method="post" enctype="multipart/form-data">
				<table class="table table-bordered table-hover table-striped "
					style="text-align: center;">

					<tr>
						<td><input type="hidden" name="productId"
							value="<%=productId%>"></td>

						<td>이미지 선택 :</td>
						<td><input type="file" name="productPic" id="productPic"></td>
				</table>
				<div>
					<button class="btn btn-outline-secondary " type="button" id="btn">이미지 수정</button>
					<a class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=productId%>">취소</a>
				</div>

			</form>
		</div>
	</div>
</body>
</html>