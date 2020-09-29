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
	//카테고리 번호 추가
	int categoryIdShow = 0;
	if (request.getParameter("categoryIdShow") != null) {
		categoryIdShow = Integer.parseInt(request.getParameter("categoryIdShow"));
	}
	// 값 불러오기
	int productId= Integer.parseInt(request.getParameter("productId"));
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	String productSoldout = request.getParameter("productSoldout");

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
	<h1 class ="text-dark ">상품 수정</h1>
	<form method="post" action="/mall-admin/product/updateProductAction.jsp?productId=<%=productId%>">
		<table class ="table table-bordered table-striped "  style="text-align: center;">
			<thead class="thead-light">
				<tr>

					<th>category_id</th>
					<th>product_name</th>
					<th>product_price</th>
					<th>Product_content</th>
					<th>product_soldout</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
					<select name="categoryId" >
						<option>카테고리선택</option>
						<%
							for (Category c : categoryList) {
							if(categoryId==c.getCategoryId()){	
						%>	
							<option value=<%=c.getCategoryId()%> selected="selected"><%=c.getCategoryName()%></option>
						<%
							
								
							}else {
								%>
								<option value=<%=c.getCategoryId()%> ><%=c.getCategoryName()%></option>
								<%
							}
							}
						%>

					</select>
					</td>
					<td><input type="text" name="productName" value=<%=productName%>></td>
					<td><input type="text" name="productPrice" value=<%=productPrice%> ></td>
					<td><textarea rows="1" cols="20" name="productContent"><%=productContent%></textarea>
					<td>
						<%
						System.out.println(productSoldout+"<---productSoldout");
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
			</tbody>
		</table>
		<button class="btn btn-outline-secondary" type="submit">제품 수정하기</button>
			<a class="btn btn-outline-secondary" href="<%=request.getContextPath() %>/product/productList.jsp">취소</a>
	</form>
	<div class="navbar">
		<!-- 상품 보여주기 -->
		<a class="btn btn-outline-secondary " href="/mall-admin/product/updateProduct.jsp?productId=<%=productId%>&categoryIdShow=0&categoryId=<%=categoryId %>&productName=<%=productName%>&productPrice=<%=productPrice%>&productContent=<%=productContent %>&productSoldout=<%=productSoldout%>">전체</a>
		<%
			for (Category c : categoryList) {
		%>
		<a
			class="btn btn-outline-secondary " href="/mall-admin/product/updateProduct.jsp?productId=<%=productId%>&categoryIdShow=<%=c.getCategoryId()%>&categoryId=<%=categoryId %>&productName=<%=productName%>&productPrice=<%=productPrice%>&productContent=<%=productContent %>&productSoldout=<%=productSoldout%>"><%=c.getCategoryName()%>
		</a>
		<%
			}
		%>

	</div>
	<!-- 테이블 출력 -->
	<table class ="table table-bordered table-hover table-striped ">
		<thead class="thead-light">
			<tr>
				<th>product_id</th>
				<th>category_id</th>
				<th>product_name</th>
				<th>product_price</th>
				<th>product_soldout</th>
			</tr>
		</thead>
		<tbody>
			<%
				//상품 리스트만큼 출력
			for (Product p : productList) {
				//만약 카테고리가 0이면 전체 출력 , 카테고리번호인 것만 출력

				// 만약 상품이 팔렸으면 출력
				if (p.getProductSoldout().equals("Y")) {
			%>

			<tr>
				<td class="text-danger"><del><%=p.getProductId()%></del></td>
				<td class="text-danger"><del><%=p.getCategoryId()%></del></td>
				<td class="text-danger"><del><%=p.getProductName()%></del></td>
				<td class="text-danger"><del><%=p.getProductPrice()%></del></td>
				<td class="text-danger">품절</td>
			</tr>
			<%
				//출력
			} else {
			%>
			<tr>
				<td class="text-success"><%=p.getProductId()%></td>
				<td class="text-success"><%=p.getCategoryId()%></td>
				<td class="text-success"><%=p.getProductName()%></td>
				<td class="text-success"><%=p.getProductPrice()%></td>
				<td class="text-success"><%=p.getProductSoldout()%></td>
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