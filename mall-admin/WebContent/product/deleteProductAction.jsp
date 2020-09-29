<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.*"%>
<%@ page import ="dao.*"%>
<% if(session.getAttribute("loginAdminId")==null){
	response.sendRedirect("/mall-admin/login.jsp");
	return;
	}
	%>
	<% 
	request.setCharacterEncoding("utf-8");
	int productId = Integer.parseInt(request.getParameter("productId"));
	Product product = new Product();
	product.setProductId(productId);
	ProductDao productDao = new ProductDao();
	productDao.deleteProductDao(product);
	System.out.println(productId);
	response.sendRedirect("/mall-admin/product/productList.jsp");
	%>