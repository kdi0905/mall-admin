package dao;
import java.sql.*;


import commons.DBUtil;
import vo.*;
public class AdminDao {
	public Admin login(Admin admin) throws Exception{
		//null이면 로그인 실패, null이 아니면 로그인 성공
		Admin returnadmin = null;
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql= "select admin_id from admin where admin_id =? and admin_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, admin.getAdminId());
		stmt.setString(2, admin.getAdminPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next())
		{
			returnadmin = new Admin();
			returnadmin.setAdminId(rs.getString("admin_id"));
		}
		conn.close();
		return returnadmin;
	}
}
