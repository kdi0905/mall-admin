package dao;
import vo.*;
import java.util.*;
import commons.*;
import java.sql.*;


public class CategoryDao {
	//Category 추가
	public void insertCategory(Category category) throws Exception{
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql ="insert into category(category_name) values(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.executeUpdate();
		conn.close();
	}
	
	// Category 목록
	public ArrayList<Category> selectCategoryList() throws Exception{
		ArrayList<Category> list = new ArrayList<Category>();
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql ="select category_id, category_name, category_pic,category_ck from category ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			category.setCategoryPic(rs.getString("category_pic"));
			category.setCategoryCk(rs.getString("category_ck"));
			list.add(category);
		}
		conn.close();
		return list;
	}
	//Category 하나의 목록 상세보기
	public Category selectCategoryOne(Category category) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select category_id, category_name, category_pic, category_ck from category where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, category.getCategoryId());
		ResultSet rs =stmt.executeQuery();
		if(rs.next()) {
		category.setCategoryId(rs.getInt("category_id"));
		category.setCategoryName(rs.getString("category_name"));
		category.setCategoryPic(rs.getString("category_pic"));
		category.setCategoryCk(rs.getNString("category_ck"));
		}
		conn.close();
		return category;
	}
	//삭제
	public void deleteCategory(int categoryId)throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql ="delete from category where category_id=?";
		PreparedStatement stmt= conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		stmt.executeUpdate();
		conn.close();
	}
	//업데이트
	public void updateCategory(Category category)throws Exception{
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "update category set category_name=?, category_pic=?, category_ck=? where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.setString(2, category.getCategoryPic());
		stmt.setString(3, category.getCategoryCk());
		stmt.setInt(4, category.getCategoryId());
		
		stmt.executeUpdate();
		conn.close();
	}
}
