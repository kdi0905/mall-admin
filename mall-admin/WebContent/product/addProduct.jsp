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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
	<script>
	 $(document).ready(function() {
		$("#btn").click(function(){
			if($("#categoryId").val()=="카테고리선택"){
				alert("카테고리를 선택해주세요");
				return;
			}else if($("#productName").val()==""){
				alert("카테고리 이름을 입력해주세요");
				return;
			}else if($("#productPrice").val()==""){
				alert("상품 가격을 입력해주세요 ");
				return;
			}else if($("#productContent").val()==""){
				alert("상품내용을 입력해주세요");
				return;
			}else if($(".productSoldout:checked").val()==undefined){
				alert("품절상태를 입력해주세요");
				return;
			}
			$("#addProductForm").submit();
			
		});
	});
	</script>
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<%
		request.setCharacterEncoding("utf-8");
	//카테고리 번호 추가
	int categoryIdShow = 0;
	if (request.getParameter("categoryId") != null) {
		categoryIdShow = Integer.parseInt(request.getParameter("categoryId"));
	}

	ProductDao productDao = new ProductDao();
	ArrayList<Product> productList = null;
	//제품 클릭시 출력페이지 화면
	if (categoryIdShow == 0) {
		productList = productDao.selectProductDao();
	} else {
		productList = productDao.selectProductListByCategoryId(categoryIdShow);
	}
	productDao.selectProductDao();

	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	<div class="color">
	<div class="container ">
	<h1 class ="text-dark">상품 추가</h1>

	<form method="post" action="/mall-admin/product/addProductAction.jsp" id="addProductForm">
		<table class ="table table-bordered table-striped " style="text-align: center;">
			<thead class="thead-light">
				<tr>
					<th >category_id</th>
					<th>product_name</th>
					<th>product_price</th>
					<th>product_content</th>
					<th>product_soldout</th>
				</tr>
			</thead>
			<tbody>
				<tr>

					<td><select name="categoryId" id="categoryId">
						<option>카테고리선택</option>
							<%
								for (Category c : categoryList) {
							%>
							<option value=<%=c.getCategoryId()%>>
								<%=c.getCategoryName()%></option>
							<% 
							}
							%>
							
					</select></td>
					<td><input type="text" name="productName" id="productName"></td>
					<td><input type="text" name="productPrice" id="productPrice"></td>
					<td><textarea rows="1" cols="20" name="productContent" id="productContent"></textarea>
					<td>
						<input type ="radio" name="productSoldout" value="N" class="productSoldout">품절x
						<input type ="radio" name="productSoldout" value="Y" class="productSoldout">품절
						
					</td>
				</tr>

			</tbody>

		</table>
		<button class="btn btn-outline-secondary " type="button" id="btn">추가</button>
		<a class="btn btn-outline-secondary" href="<%=request.getContextPath() %>/product/productList.jsp">취소</a>
	</form>
	<div class="navbar">
	
	<a class="btn btn-outline-secondary " href="/mall-admin/product/addProduct.jsp">전체</a>
	<%
		for (Category c : categoryList) {
	%>
	<a class="btn btn-outline-secondary "
		href="/mall-admin/product/addProduct.jsp?categoryId=<%=c.getCategoryId()%>"><%=c.getCategoryName()%>
	</a>
	<%
		}
	%>
	</div>
	<table class ="table table-bordered table-striped " style="text-align: center;">
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
				for (Product p : productList) {
				if (p.getProductSoldout().equals("Y")) {
			%>

			<tr>
				<td class="text-danger" ><del><%=p.getProductId()%></del></td>
				<td class="text-danger" ><del><%=p.getCategoryId()%></del></td>
				<td class="text-danger"><del><%=p.getProductName()%></del></td>
				<td class="text-danger"><del><%=p.getProductPrice()%></del></td>
				<td class="text-danger">품절</td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td class="text-success" ><%=p.getProductId()%></td>
				<td class="text-success" ><%=p.getCategoryId()%></td>
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