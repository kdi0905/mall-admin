package dao;
import vo.*;
import commons.*;
import java.util.*;
import java.sql.*;
public class MemberDao {
	// 회원 정보 리스트
	public ArrayList<Member> selectMemberList()throws Exception{
		ArrayList<Member> memberList = new ArrayList<Member>();
			DBUtil dbUtil =new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select member_email, member_pw, member_name, member_date from member";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs =stmt.executeQuery();
		
		while(rs.next()) {
			Member member = new Member();
			member.setMemberEmail(rs.getString("member_email"));
			member.setMemberPw(rs.getString("member_pw"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberDate(rs.getNString("member_date"));
			memberList.add(member);
		}
		conn.close();
		return memberList;
	}
	
	//회원 정보 삭제
	public void deleteMember(Member member)throws Exception{
		//commons패키지의 db명령어 불러오기
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql ="delete from member where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,member.getMemberEmail());
		stmt.executeUpdate();
		conn.close();
	}
}
