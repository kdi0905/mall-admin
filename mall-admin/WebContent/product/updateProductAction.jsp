<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import ="dao.*" %>

<% 
	if(session.getAttribute("loginAdminId")==null){
	response.sendRedirect("/mall-admin/login.jsp");
	return;
	}
	request.setCharacterEncoding("utf-8");
//값 받아오기
	int productId = Integer.parseInt(request.getParameter("productId"));
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	String productSoldout = request.getParameter("productSoldout");
	
	Product product = new Product();
	product.setProductId(productId);
	product.setCategoryId(categoryId);
	product.setProductName(productName);
	product.setProductPrice(productPrice);
	product.setProductContent(productContent);
	product.setProductSoldout(productSoldout);
	
	ProductDao productDao = new ProductDao();
	productDao.updateProductDao(product);

	response.sendRedirect("/mall-admin/product/productList.jsp");
%>