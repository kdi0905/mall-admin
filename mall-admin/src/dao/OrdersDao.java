package dao;
import java.util.*;

import commons.DBUtil;
import vo.*;
import java.sql.*;

public class OrdersDao {
	//전체 출력
	public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception{
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		/*
		 * select o.orders_id, o.product_id,p.product_name, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date
		 * from orders o inner join product p on o.product_id=p.product_id
		 */
		// String sql ="select orders_id, product.product_id,product.product_name,orders_amount, orders_price,
		//member_email, orders_addr, orders_state, orders_date from orders , product where orders.product_id=product.product_id;
		String sql ="select o.orders_id,o.product_id,p.product_name,o.orders_amount,o.orders_price,o.member_email,"
				+ "o.orders_addr,o.orders_state,o.orders_date from orders o inner join product p on o.product_id=p.product_id ";
		PreparedStatement stmt = conn.prepareStatement(sql);
	
		ResultSet rs = stmt.executeQuery();
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		
		while (rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.orders = new Orders();
			oap.product= new Product();
			oap.orders.setOrdersId(rs.getInt("orders_id"));
			oap.orders.setProductId(rs.getInt("product_id"));		
			oap.orders.setOrdersAmount(rs.getInt("orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("orders_price"));
			oap.orders.setMemberEmail(rs.getString("member_email"));
			oap.orders.setOrdersAddr(rs.getNString("orders_addr"));
			oap.orders.setOrdersState(rs.getString("orders_state"));
			oap.orders.setOrdersDate(rs.getNString("orders_date"));
			oap.product.setProductName(rs.getString("product_name"));
			list.add(oap);
		}	
		conn.close();
		return list;
	}
	
	//주문상태 끼리 본다
	public ArrayList<OrdersAndProduct> selectOrderListBystate(String ordersState) throws Exception{
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql ="select o.orders_id,o.product_id,p.product_name,o.orders_amount,o.orders_price,o.member_email,o.orders_addr,o.orders_state,o.orders_date from orders o inner join product p on o.product_id=p.product_id where o.orders_state=? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ordersState);
	
		ResultSet rs = stmt.executeQuery();
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		
		while (rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.orders = new Orders();
			oap.product = new Product();
			oap.orders.setOrdersId(rs.getInt("o.orders_id"));
			oap.orders.setProductId( rs.getInt("o.product_id"));
			oap.orders.setOrdersAmount( rs.getInt("o.orders_amount"));
			oap.orders.setOrdersPrice( rs.getInt("o.orders_price"));
			oap.orders.setMemberEmail( rs.getString("o.member_email"));
			oap.orders.setOrdersAddr( rs.getNString("o.orders_addr"));
			oap.orders.setOrdersState( rs.getString("o.orders_state"));
			oap.orders.setOrdersDate( rs.getNString("o.orders_date"));
			oap.product.setProductName(rs.getString("p.product_name"));
			list.add(oap);
		}	
		conn.close();
		return list;
	}

	

	//주문의 상태 업데이트
	public void updateOrdersStateById(Orders orders) throws Exception {
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//쿼리문
		String sql= "update orders set orders_state=? where orders_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orders.getOrdersState());
		stmt.setInt(2, orders.getOrdersId());
		stmt.executeUpdate();
		conn.close();
	}
	
	//주문 한개의 리스트보기
	public OrdersAndProduct selectOrdersOne(Orders orders) throws Exception{
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select o.orders_id,o.product_id,o.orders_amount,o.orders_price,o.member_email,o.orders_addr,o.orders_state,o.orders_date,p.product_name from orders o inner join product p on o.product_id=p.product_id where orders_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orders.getOrdersId());
		ResultSet rs = stmt.executeQuery();
		OrdersAndProduct oap = new OrdersAndProduct();
		oap.product = new Product();
		oap.orders = new Orders();
		//rs에 값이 들어가면
		if(rs.next()) {
		oap.orders.setOrdersId(rs.getInt("o.orders_id"));
		oap.orders.setProductId(rs.getInt("o.product_id"));
		oap.orders.setOrdersAmount(rs.getInt("o.orders_amount"));
		oap.orders.setOrdersPrice(rs.getInt("o.orders_price"));
		oap.orders.setMemberEmail(rs.getString("o.member_email"));
		oap.orders.setOrdersAddr(rs.getString("o.orders_addr"));
		oap.orders.setOrdersState(rs.getString("o.orders_state"));
		oap.orders.setOrdersDate(rs.getString("o.orders_date"));
		oap.product.setProductName(rs.getString("p.product_name"));
		}
		conn.close();
		return oap;
	}
}
