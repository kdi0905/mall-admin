<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<% if(session.getAttribute("loginAdminId")==null){
	response.sendRedirect("/mall-admin/login.jsp");
	return;
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>categoryList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.color {
	background-color: #F6F6F6;
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
	<div class ="color">
	<div class ="container " >
	<h1 class ="text-dark ">카테고리리스트</h1>
	<div class="navbar">
		<a class="btn btn-outline-dark" href="/mall-admin/category/addCategory.jsp">상품카테고리 추가</a>

	</div>
	<%
		CategoryDao categoryDao= new CategoryDao();
		ArrayList<Category> list = categoryDao.selectCategoryList();
	%>
	<table class ="table table-bordered table-hover table-striped " style="text-align: center;">
		<thead class="thead-light">
			<tr>
				<th>category_Id</th>
				<th>category_name</th>
				<th>category_pic</th>
				<th>category_ck
				<th colspan="2">수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Category c :list){
					%>
			<tr>
				<td><%=c.getCategoryId() %></td>
				<td><%=c.getCategoryName() %></td>
				<td><%=c.getCategoryPic() %></td>
				<td><%=c.getCategoryCk() %></td>
				<td class="btn btn-Light btn-sm"><a class ="text-muted" href="/mall-admin/category/updateCategoryList.jsp?categoryId=<%=c.getCategoryId()%>">수정</a></td>
				<td class="btn btn-Light btn-sm"><a class ="text-muted" href="/mall-admin/category/deleteCategoryAction.jsp?categoryId=<%=c.getCategoryId()%>">삭제</a></td>
			</tr>
			<%	
					}
			
			%>

		</tbody>
	</table>
	</div>
	</div>
</body>
</html>