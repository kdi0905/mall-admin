<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "dao.*" %>
<%@ page import= "vo.*" %>
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
<style >
	table {border : 1px solid black; }
	td {border : 1px solid black;}
</style>
</head>
<body>
	<!-- 메뉴보기 -->
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
	request.setCharacterEncoding("utf-8");
	int productId= Integer.parseInt(request.getParameter("productId"));
	int categoryId= Integer.parseInt(request.getParameter("categoryId"));
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	String productSoldout = request.getParameter("productSoldout");
	String productPic = request.getParameter("productPic");
	
	Product product = new Product();
	product.setProductId(productId);
	product.setCategoryId(categoryId);
	product.setProductName(productName);
	product.setProductPrice(productPrice);
	product.setProductContent(productContent);
	product.setProductSoldout(productSoldout);
	product.setProductPic(productPic);
	ProductDao productDao = new ProductDao();
	productDao.updateProductDao(product);
	%>
	<div class ="color">
	<div class ="container " >
	<h1 class ="text-dark ">상품 수정</h1>
	
	<form method="post" action="/mall-admin/product/updateProductOneAction.jsp?productId=<%=product.getProductId()%>">
	<table  class ="table table-bordered table-striped " style="text-align: center;">
		<tr>
			<td>product_pic</td>
			<td><input type="text" name="productPic" value=<%=product.getProductPic()%>></td>
		</tr>
		<tr>
			<td class ="text-dark ">product_id</td>
			<td><input type ="text" name="productId" value="<%=product.getProductId() %>" disabled="disabled"></td>
			
		</tr>
		<tr>
			<td class ="text-dark ">category_id</td>
			<td><input type ="text" name="categoryId" value="<%=product.getCategoryId() %>"> </td>
		</tr> 
		<tr>
			<td class ="text-dark ">product_name</td>
			<td><input type= "text" name="productName" value="<%=product.getProductName()%>"></td>
		</tr>
		<tr>
			<td class ="text-dark ">product_price</td>
			<td><input type = "text" name="productPrice" value="<%=product.getProductPrice()%>"></td>
		</tr>
		<tr>
			<td class ="text-dark ">product_content</td>
			<td><textarea rows="7" cols="50" name="productContent"><%=product.getProductContent() %></textarea></td>
		</tr>
		<tr>
			<td class ="text-dark ">product_soldout</td>
			<td>
			<%
					if(productSoldout.equals("Y")){	 		
						%> 		<input type="radio" name="productSoldout" value=N>품절x 
								<input type="radio" name="productSoldout" value=Y checked="checked">품절
						<%
							} else {
						%>		
								<input type="radio" name="productSoldout" value=N checked="checked">품절x 
								<input type="radio" name="productSoldout" value=Y >품절
						<%
							}
						%>
			</td>
		</tr>
	</table>
	<button class="btn btn-outline-secondary " type="submit">수정</button>
	<a class="btn btn-outline-secondary" href="<%=request.getContextPath() %>/product/productOne.jsp?productId=<%=productId%>">취소</a>
	</form>
	</div>
	</div>
</body>
</html>