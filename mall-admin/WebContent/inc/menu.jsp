<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark ">
	<!-- request.getContextPacth()//파일 위치를 자동으로 설정한다 -->
		<ul class="navbar-nav">
			<li class="nav-item ">
				<a class="nav-link btn btn-link btn-sm text-light" href="/mall-admin/index.jsp">홈으로</a>
			</li>
			
			<li>
				<a class="nav-link btn btn-link btn-sm text-light" href="/mall-admin/category/categoryList.jsp">상품카테고리관리</a>
			</li>
			
			<li>
				<a class="nav-link btn btn-link btn-sm text-light" href="/mall-admin/product/productList.jsp">상품관리</a>
			</li>
			
			<li>
				<a class="nav-link btn btn-link btn-sm text-light" href="/mall-admin/orders/ordersList.jsp">주문관리</a>
			</li>
			
			<li>
				<a class="nav-link btn btn-link btn-sm text-light" href="<%=request.getContextPath()%>/notice/noticeList.jsp">공지관리</a>
			</li>
				<li>
				<a class="nav-link btn btn-link btn-sm text-light" href="<%=request.getContextPath()%>/member/memberList.jsp">회원관리</a>
			</li>
			<li>
				<a class="nav-link btn btn-link btn-sm text-light" href="/mall-admin/logoutAction.jsp">로그아웃</a>
			</li>
			
		</ul>
</nav>