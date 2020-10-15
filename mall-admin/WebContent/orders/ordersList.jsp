<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
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
	
	//주문 상태 확인
		String ordersState="선택";
		if(request.getParameter("ordersState")!=null){
			ordersState = request.getParameter("ordersState");
		}
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<OrdersAndProduct> list = null;
		//상태가 공백이면, 공백이 아니면
		if(ordersState.equals("선택")){
			list= ordersDao.selectOrdersList();
		}else{
			list = ordersDao.selectOrderListBystate(ordersState);
		}		
	

	%>
	
	<div class ="color">
	<div class ="container ">
	<h1 class ="text-dark ">주문 목록</h1>
	<!-- 주문상태 검색하기 -->
	<form method ="post" action="/mall-admin/orders/ordersList.jsp">
		 <select name ="ordersState">
		 	<option>선택</option>
		 		 	<%if(ordersState.equals("결제완료")){
						 		%>
						 		<option selected="selected">결제완료</option>
						 		<%
						 	}else {
						 		%>
						 		<option >결제완료</option>
						 	<%
						 	}
						 	 %>
						 	<%if(ordersState.equals("배송준비중")){
						 		%>
						 		<option selected="selected">배송준비중</option>
						 		<%
						 	}else {
						 		%>
						 		<option>배송준비중</option>
						 	<%
						 	}
						 	 %>
						 	<%if(ordersState.equals("배송완료")){
						 		%>
						 		<option selected="selected">배송완료</option>
						 		<%
						 	}else {
						 		%>
						 		<option >배송완료</option>
						 	<%
						 	}
						 	 %>
						 <%if(ordersState.equals("주문취소")){
						 		%>
						 		<option selected="selected">주문취소</option>
						 		<%
						 	}else {
						 		%>
						 		<option>주문취소</option>
						 	<%
						 	}
						 	 %>
						 	
		 </select>
		<button class="btn btn-outline-secondary" type ="submit">주문 상태별로 보기</button>
	</form>
	<!-- 테이블 리스트 출력하기 -->
	<table class ="table table-bordered table-hover table-striped"  style="text-align: center;">
		<thead class="thead-light">
			<tr>
				<th class ="text-dark ">주문 번호</th>
				<th class ="text-dark ">제품 번호</th>
				<th class ="text-dark ">제품 이름</th>
				<th class ="text-dark ">주문 개수</th>
				<th class ="text-dark ">주문 가격</th>
				<th class ="text-dark ">이메일</th>
				<th class ="text-dark ">주소</th>
				<th class ="text-dark ">배송상태</th>
				<th class ="text-dark ">주문 날자</th>
				<th class ="text-dark ">주문 수정</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(OrdersAndProduct oap: list){
		%>	
			<tr>
				<td class ="text-dark "><%=oap.orders.getOrdersId() %></td>
				<td class ="text-dark "><%=oap.orders.getProductId()%></td>
				<td class ="text-dark "><%=oap.product.getProductName() %></td>
				<td class ="text-dark "><%=oap.orders.getOrdersAmount() %></td>
				<td class ="text-dark "><%=oap.orders.getOrdersPrice() %></td>
				<td class ="text-dark "><%=oap.orders.getMemberEmail() %></td>
				<td class ="text-dark "><%=oap.orders.getOrdersAddr() %></td>
				<td class ="text-dark "><%=oap.orders.getOrdersState() %></td>
				<td class ="text-dark "><%=oap.orders.getOrdersDate() %></td>
				<td class ="text-dark "><a class="btn btn-outline-secondary" href ="/mall-admin/orders/modifyOrdersState.jsp?ordersId=<%=oap.orders.getOrdersId()%>&ordersState=<%=oap.orders.getOrdersState()%>">주문 수정</a></td>
			</tr>
		<%
			}
		%>
		</tbody>	
	</table>

	
	</div><!-- 넓이 -->
	</div><!-- 배경 -->
	</body>
</html>