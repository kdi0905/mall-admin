<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% if(session.getAttribute("loginAdminId")==null){
	response.sendRedirect("/mall-admin/login.jsp");
	return;
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#categoryName").val()==""){
				$("#categoryNameHelper").text("카테고리이름을 확인하세요");
				return;
			}
			$("#categoryForm").submit();
		});
	});
	</script>
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>	
	</div>
	<div class ="color">
	<div class ="container " >
	<h1 class ="text-dark ">카테고리 입력</h1>
	<form method ="post" action ="/mall-admin/category/addCategoryAction.jsp" id="categoryForm">
		<table class ="table table-bordered table-hover table-striped " style="text-align: center;">
			<tr> 
				<td> category_name</td>
				<td><input type ="text" name ="categoryName"id="categoryName"></td>
			
			</tr>
				
		</table>
		<div class="text-danger" id="categoryNameHelper"></div>
		
		<button  class="btn btn-outline-secondary" type = "button"id="btn">카테고리 추가</button>
	<a class="btn btn-outline-secondary" href="<%=request.getContextPath() %>/category/categoryList.jsp">취소</a>
	
	</form>
	</div>
	</div>
</body>
</html>