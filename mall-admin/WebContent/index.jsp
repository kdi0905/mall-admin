<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container jumbotron jumbotron-fluid">
	<h1 class ="">관리자 메인 페이지</h1>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>	
	</div>
	<p  style="text-align: center;"><%=session.getAttribute("loginAdminId") %>님 반갑습니다.
	
		
	
	<div>
	<img class ="rounded-circle mx-auto d-block" src="/mall-admin/images/s.jpg" width="500" height="400" >
	</div>
	
	<div>메서드를 사용한 게시판</div>
	<div>자바 파일  </div>
	<p>CategoryDao, ProductDao, Category, Product</p>
	
	<div>웹 파일  </div> 
	<p>index, login, loginAction, CategoryList, addCategory, addCategoryAction, 
	productList, addProduct, addProductAction, deleteProductAction.updateProduct, updateProductAction
	</p>
	<div> 이미지 </div>
	<p> s.jsp</p>
	   
	<div>
	{*** 09-16일에 만들기 시작한 쇼핑몰 게시판 ***}
	</div>
	
	<div>	!! 09-16일에 한 일 !! </div>
	<div>	1. 관리자로그인 페이지 <br>
		2. 상품 카테고리 게시판 생성<br>
		3. 상품 카테고리 리스트 추가<br>
	</div>
		<br>
		<div>!! 09-17일에 한 일 !!</div>
	<div>	
		1. 제품 게시판 생성<br>
		2. 제품 리스트 추가<br>
		3. 제품 리스트 삭제<br>
		4. 제품 리스트 수정<br>
	</div>
		<br>
		<div>!! 09-18일에 한 일 !!</div>
	<div>	
		1.css<br>
	</div>
		<br>
		<div>!! 09-21일에 한 일 !!</div>
	<div>	
		1.주문게시판 생성<br>
		2.주문게시판 상태수정<br>
	</div>
</div>
</body>
</html>