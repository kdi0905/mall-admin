package dao;
import java.util.*;

import commons.DBUtil;

import java.sql.*;
import vo.Product;
public class ProductDao {
	//전체 출력
	public ArrayList<Product> selectProductDao() throws Exception {
		
		ArrayList<Product> list = new ArrayList<Product>();
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql="select product_id, category_id, product_name, product_price,product_content, product_soldout from product ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
			Product p =new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductContent( rs.getString("product_content"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	//카테고리 리스트 끼리 출력
public ArrayList<Product> selectProductListByCategoryId(int categoryId) throws Exception {
		
		ArrayList<Product> list = new ArrayList<Product>();
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql="select product_id, category_id, product_name, product_price, product_soldout from product where category_id =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
			Product p =new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	//추가
	public void addProductDao(Product product) throws Exception{
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql="insert into product(category_id,product_name,product_price,product_content,product_soldout) values(?,?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);	
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2,product.getProductName() );
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		stmt.executeUpdate();
		conn.close();
	}
	//삭제
	public void deleteProductDao(Product product) throws Exception{
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql="Delete from Product where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);	
		stmt.setInt(1, product.getProductId());		
		stmt.executeUpdate();
		conn.close();
	}
	//업데이트
	public void updateProductDao(Product product) throws Exception {
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update product set category_id=?,product_name=?,product_price=?,product_content=?,product_soldout=? where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2,product.getProductName() );
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		stmt.setInt(6, product.getProductId());
		stmt.executeUpdate();
		conn.close();
	}
	//자세히보기 업데이트
	public void updateProductOneDao(Product product) throws Exception {
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update product set category_id=?,product_name=?,product_price=?,product_content=?,product_soldout=?,product_pic=? where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2,product.getProductName() );
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());	
		stmt.setString(6, product.getProductPic());
		stmt.setInt(7, product.getProductId());
		System.out.println(product.getProductPrice()+"<---------productPrice2");
		stmt.executeUpdate();
		conn.close();
	}
	//판매 업데이트
	public void updateProductSoldout(int productId , String productSoldout) throws Exception {
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update product set product_soldout =? where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		if(productSoldout.equals("Y")) {
			stmt.setString(1, "N");	
		}else {
			stmt.setString(1, "Y");
		}
			stmt.setInt(2, productId);
			int row = stmt.executeUpdate();
			System.out.println(row+"행 수정");
		
	}
	//리스트 자세히보기
	public Product selectProductOne(int productId ) throws Exception{
		Product product =null;
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, category_id, product_name, product_price,product_content, product_soldout, product_pic from product where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,productId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next())
		{
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setCategoryId(rs.getInt("category_id"));
			product.setProductName(rs.getString("product_Name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductContent(rs.getString("product_content"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setProductPic( rs.getString("product_pic")); //default.jpg
		}
		return product;
	}
	//사진 수정하기
	public void updateProductPic(Product product)throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update product set product_pic=? where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, product.getProductPic());
		stmt.setInt(2, product.getProductId());
		stmt.executeUpdate();
		conn.close();
	}
}
