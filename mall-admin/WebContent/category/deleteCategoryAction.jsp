<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<% 
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
	}
%>
<%
	request.setCharacterEncoding("utf-8");
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	CategoryDao categoryDao =new CategoryDao();
	categoryDao.deleteCategory(categoryId);

	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>