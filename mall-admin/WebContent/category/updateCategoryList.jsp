<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import="dao.*" %>
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
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>	
	</div>
	<%
		request.setCharacterEncoding("utf-8");
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		Category category = new Category();
		category.setCategoryId(categoryId);
		CategoryDao categoryDao = new CategoryDao();
		categoryDao.selectCategoryOne(category);
		System.out.println(category.getCategoryName());
		System.out.println(category.getCategoryId());
		System.out.println(category.getCategoryPic());
		
	%>
	<div class ="color">
	<div class ="container " >
	<h1 class ="text-dark ">카테고리 수정</h1>
	<form method ="post" action ="<%=request.getContextPath()%>/category/updateCategoryListAction.jsp?categoryId=<%=categoryId%>" enctype="multipart/form-data">
		<table class ="table table-bordered table-hover table-striped " style="text-align: center;">
			<tr> 
				<td> category_name</td>
				<td><input type ="text" name ="categoryName" value=<%=category.getCategoryName() %>></td>
			</tr>
			<tr> 
				<td>category_Pic</td>
				<td>
				<img src ="<%=request.getContextPath()%>/images/<%=category.getCategoryPic()%>"><br>
				<input type ="file" name ="categoryPic" ></td>
				
			</tr>
			<tr>
				<td>category_ck</td>
				<td><select name = "categoryCk">
				<% if(category.getCategoryCk().equals("Y")){
					%>
					<option value="Y" selected="selected">Y</option>
					<option value="N">N</option>
				<%} else {
					%>
					<option value="Y">Y</option>
					<option value="N" selected="selected">N</option> 
					<%
				}
					%>
				
				</select>
			</tr>
		</table>
		
		
		<button  class="btn btn-outline-secondary" type = "submit">카테고리 수정</button>
		<a class="btn btn-outline-secondary" href="<%=request.getContextPath() %>/category/categoryList.jsp">취소</a>
	
	</form>
	</div>
	</div>
</body>
</html>