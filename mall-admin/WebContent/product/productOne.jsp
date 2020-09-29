<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
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
table {
	border: 1px solid black;
}

td {
	border: 1px solid black;
}
.bg {
	background-color: #E7E7E7;
}
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
	<%
	int productId = Integer.parseInt(request.getParameter("productId"));
	System.out.println(productId + "<--prodocutId");

	Product product = new ProductDao().selectProductOne(productId);
	%>
	<div class="color">
	<div class="container ">
	<h1 class ="text-dark">상품 상세보기</h1>
	<table class ="table "  style="text-align: center;">
		<tr>
			<td class = "bg">product_pic</td>
			<td class ="tablecolor">
				<img src="/mall-admin/images/<%=product.getProductPic()%>">
				<a href="<%=request.getContextPath()%>/product/modifyProductPic.jsp?productId=<%=product.getProductId()%>">이미지 수정</a>
			</td>
		</tr>
		<tr>
			<td class ="bg margin">product_id</td>
			<td class ="tablecolor"><%=product.getProductId()%></td>
		</tr>
		<tr>
	 	<td class ="bg">category_id</td>
	 	<td class ="tablecolor"><%=product.getCategoryId()%></td> 
	 </tr>
	 <tr>
	 	<td class ="bg">product_name</td>
	 	<td class ="tablecolor"><%=product.getProductName()%></td> 
	 </tr>
	 <tr>
	 	<td class ="bg">product_price</td>
	 	<td class ="tablecolor"><%=product.getProductPrice()%></td> 
	 </tr>
	 <tr>
	 	<td class ="bg">product_content</td>
	 	<td class ="tablecolor"><%=product.getProductContent()%></td> 
	 </tr>
	 <tr>
	 	<td class ="bg">product_Soldout</td>
	 	<td class ="tablecolor">	<%
	 			if(product.getProductSoldout().equals("Y")){
	 		%>		
	 			<a class ="text-danger" href="/mall-admin/product/mdifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">품절</a>	
	 		<%
	 			}else {
	 		%>
	 			<a class ="text-success" href="/mall-admin/product/mdifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">판매중</a>	
	 		<%
	 			}
	 		%></td> 
	 </tr>
	 
	 	
	 
	</table>
		<a class="btn btn-outline-secondary btn-link text-secondary" href="/mall-admin/product/updateProductOne.jsp?productId=<%=product.getProductId()%>&categoryId=<%=product.getCategoryId()%>&productName=<%=product.getProductName()%>&productPrice=<%=product.getProductPrice()%>&productContent=<%=product.getProductContent()%>&productSoldout=<%=product.getProductSoldout()%>&productPic=<%=product.getProductPic()%>">수정</a>
	 	<a class="btn btn-outline-secondary btn-link text-danger" href="/mall-admin/product/deleteProductAction.jsp?productId=<%=product.getProductId()%>">삭제</a>
	 	<a class="btn btn-outline-secondary" href="<%=request.getContextPath() %>/product/productList.jsp">목록</a>
	</div>
	</div>
</body>
</html>