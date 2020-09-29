<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import ="dao.*" %>
<%@ page import ="java.util.*" %>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-amdin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOrdersState</title>
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
	<!-- 메뉴보기 -->
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<!-- 주문 리스트에서 주문번호를 받아와 주문상태 수정하기 -->
	<%
		//한글 변환
		request.setCharacterEncoding("utf-8");
	
		//페이징
		int currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;
		int limit = (currentPage-1)*rowPerPage;
		int limit2 = rowPerPage;
		
		//주문번호 받아오기
		Orders orders = new Orders();
		orders.setOrdersId(Integer.parseInt(request.getParameter("ordersId")));
		orders.setOrdersState(request.getParameter("ordersState"));
		OrdersAndProduct oap = null;
		OrdersDao ordersDao = new OrdersDao();
		oap= ordersDao.selectOrdersOne(orders);
		
		ArrayList<String> stateList = null;
		stateList = ordersDao.selectOrdersStateList();
		
	%>
	<div class ="color">
	<div class ="container ">
	<!-- 제목 -->
	<h1 class ="text-dark ">배송 상태 수정 </h1>
	<!-- 상태 수정 값 액션 페이지에 넘기기 -->
	<form method="post" action="modifyOrdersStateAction.jsp?ordersId=<%=orders.getOrdersId()%>">
	<table class ="table table-bordered table-hover table-striped "  style="text-align: center;">
		<thead class="thead-light">
			<tr>
				<th>주문 번호</th>
				<th>제품 번호</th>
				<th>제품 이름</th>
				<th>주문 개수</th>
				<th>주문 가격</th>
				<th>이메일</th>
				<th>주소</th>
				<th>배송상태</th>
				<th>주문 날자</th>
			
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class ="text-dark "><%=oap.orders.getOrdersId() %></td>
				<td class ="text-dark "><%=oap.orders.getProductId()%></td>
				<td class ="text-dark "><%=oap.product.getProductName() %></td>
				<td class ="text-dark "><%=oap.orders.getOrdersAmount() %></td>
				<td class ="text-dark "><%=oap.orders.getOrdersPrice() %></td>
				<td class ="text-dark "><%=oap.orders.getMemberEmail() %></td>
				<td class ="text-dark "><%=oap.orders.getOrdersAddr() %></td>
				<td class ="text-dark ">
					<select name = "ordersState"> 
						<option>선택</option>
						 	<%
						 		for(String s : stateList){
						 			if(s.equals(orders.getOrdersState())){
						 			%>
						 				<option selected="selected"><%=s%></option>
						 			<%
						 			}else{
						 				%>
						 					<option><%=s %></option>
						 				<%
						 			}
						 		}
						 	%>
					</select>
				</td>
				<td><%=oap.orders.getOrdersDate() %></td>
		
		</tbody>
	</table>
	<button class="btn btn-outline-secondary" type="submit">배송상태 수정</button>
	</form>
	</div><!-- 넖이 -->
	</div><!--배경 -->
</body>
</html>