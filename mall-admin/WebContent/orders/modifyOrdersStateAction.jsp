<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import ="vo.*" %>
<% if(session.getAttribute("loginAdminId")==null){
	response.sendRedirect("/mall-admin/login.jsp");
	return;
	}
	%>
<%
	request.setCharacterEncoding("utf-8");
	String ordersState = request.getParameter("ordersState");
	int ordersId = Integer.parseInt(request.getParameter("ordersId"));
	Orders orders = new Orders();
	orders.setOrdersId(ordersId);
	orders.setOrdersState(ordersState);
	
	OrdersDao ordersDao = new OrdersDao();
	ordersDao.updateOrdersStateById(orders);

	response.sendRedirect("/mall-admin/orders/ordersList.jsp");
%>