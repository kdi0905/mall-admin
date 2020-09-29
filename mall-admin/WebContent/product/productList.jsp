<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<% if(session.getAttribute("loginAdminId")==null){
	response.sendRedirect("/mall-admin/login.jsp");
	return;
	}
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productLIst</title>
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
	//카테고리 번호 추가
		int categoryIdShow = 0;
		if (request.getParameter("categoryIdShow") != null) {
			categoryIdShow = Integer.parseInt(request.getParameter("categoryIdShow"));
		}
		
		// 번호끼리 보여주기
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = null;
		if (categoryIdShow == 0) {
			productList = productDao.selectProductDao();
		} else {
			productList = productDao.selectProductListByCategoryId(categoryIdShow);
		}
			
	//카테고리추가
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	<div class ="color">
	<div class ="container " >
	<h1 class ="text-dark ">상품 목록</h1>
	<div class="navbar">
	<a class="btn btn-outline-secondary " href ="/mall-admin/product/addProduct.jsp">상품 추가하기</a>
	
	<!-- 상품 보여주기 -->
		<a class="btn btn-outline-secondary " href ="/mall-admin/product/productList.jsp">전체</a>
		<%
			for(Category c : categoryList) {
		%>
				<a class="btn btn-outline-secondary" href= "/mall-admin/product/productList.jsp?categoryIdShow=<%=c.getCategoryId()%>"><%=c.getCategoryName() %></a>
		<%
			}
		%>
	
	</div>
	<!-- 테이블 출력 -->
	<table class ="table table-bordered table-hover table-striped "  style="text-align: center;">
		<thead class="thead-light">
			<tr >
				<th>product_id</th>
				<th>category_id</th>
				<th>product_name</th>
				<th>product_price</th>
				<th>product_soldout</th>
				<th colspan="2"> 수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<%	//상품 리스트만큼 출력
				for (Product p : productList) {
				//만약 카테고리가 0이면 전체 출력 , 카테고리번호인 것만 출력
			
					// 만약 상품이 팔렸으면 출력
					
				 if (p.getProductSoldout().equals("Y")) {	
			%>

				<tr>
					<td class="text-danger"><del>
					<a  class="btn btn-outline-danger text-danger" href="/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId()%>
					</a></del></td>
					<td class="text-danger"><del><%=p.getCategoryId()%></del></td>
					<td class="text-danger" width="200"><del><%=p.getProductName()%></del></td>
					<td class="text-danger"><del><%=p.getProductPrice()%></del></td>
					<td class="text-danger">품절</td>
					<td class="btn btn-Light btn-sm "><a class ="text-muted" href="/mall-admin/product/updateProduct.jsp?productId=<%=p.getProductId()%>&categoryId=<%=p.getCategoryId() %>&productName=<%=p.getProductName() %>&productPrice=<%=p.getProductPrice()%>&productContent=<%=p.getProductContent()%>&productSoldout=Y">수정</a></td>
					<td class="btn btn-Light btn-sm "><a class ="text-muted" href="/mall-admin/product/deleteProductAction.jsp?productId=<%=p.getProductId()%>">삭제</a></td>
				</tr>
			<%		//출력
				} else {
			%>
				<tr>
					<td><a class ="btn btn-outline-secondary text-success" href="/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId()%></a></td>
					<td class="text-success"><%=p.getCategoryId()%></td>
					<td class="text-success"><%=p.getProductName()%></td>
					<td class="text-success"><%=p.getProductPrice()%></td>
					<td class="text-success"><%=p.getProductSoldout()%></td>
					<td class="btn btn-Light btn-sm"><a class ="text-muted" href="/mall-admin/product/updateProduct.jsp?productId=<%=p.getProductId()%>&categoryId=<%=p.getCategoryId() %>&productName=<%=p.getProductName() %>&productPrice=<%=p.getProductPrice()%>&productContent=<%=p.getProductContent()%>&productSoldout=N">수정</a></td>
					<td class="btn btn-Light btn-sm"><a class ="text-muted" href="/mall-admin/product/deleteProductAction.jsp?productId=<%=p.getProductId()%>">삭제</a></td>
				</tr>
			<%
				}
			}
		
			%>

		</tbody>
	</table>
	</div>
	</div>
</body>
</html>