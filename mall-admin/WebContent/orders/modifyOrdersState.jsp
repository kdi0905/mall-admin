<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import ="dao.*" %>

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	 $(document).ready(function(){
		 $("#btn").click(function(){
			if( $("#ordersState").val()=="선택"){
				alert("배송상태를 입력해주세요");
				return;
			}
			$("#ordersForm").submit();
		 });
	 });
	</script>
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
	
		//주문번호 받아오기
		Orders orders = new Orders();
		orders.setOrdersId(Integer.parseInt(request.getParameter("ordersId")));
		orders.setOrdersState(request.getParameter("ordersState"));
		OrdersAndProduct oap = null;
		OrdersDao ordersDao = new OrdersDao();
		oap= ordersDao.selectOrdersOne(orders);
		
	
		
	%>
	<div class ="color">
	<div class ="container ">
	<!-- 제목 -->
	<h1 class ="text-dark ">배송 상태 수정 </h1>
	<!-- 상태 수정 값 액션 페이지에 넘기기 -->
	<form method="post" id="ordersForm" action="modifyOrdersStateAction.jsp?ordersId=<%=orders.getOrdersId()%>">
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
					<select name = "ordersState" id="ordersState"> 
						<option>선택</option>
						 	<%if(oap.orders.getOrdersState().equals("결제완료")){
						 		%>
						 		<option selected="selected">결제완료</option>
						 		<%
						 	}else {
						 		%>
						 		<option >결제완료</option>
						 	<%
						 	}
						 	 %>
						 	<%if(oap.orders.getOrdersState().equals("배송준비중")){
						 		%>
						 		<option selected="selected">배송준비중</option>
						 		<%
						 	}else {
						 		%>
						 		<option>배송준비중</option>
						 	<%
						 	}
						 	 %>
						 	<%if(oap.orders.getOrdersState().equals("배송완료")){
						 		%>
						 		<option selected="selected">배송완료</option>
						 		<%
						 	}else {
						 		%>
						 		<option >배송완료</option>
						 	<%
						 	}
						 	 %>
						 <%if(oap.orders.getOrdersState().equals("주문취소")){
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
				</td>
				<td><%=oap.orders.getOrdersDate() %></td>
		
		</tbody>
	</table>
	<button class="btn btn-outline-secondary" type="button" id="btn">배송상태 수정</button>
	</form>
	</div><!-- 넖이 -->
	</div><!--배경 -->
</body>
</html>