package dao;
import java.util.*;
import vo.*;
import commons.*;
import java.sql.*;
public class NoticeDao {
	//공지사항 전체 리스트 출력
	public ArrayList<Notice> selectNoticeList()throws Exception{
		ArrayList<Notice>  list = new ArrayList<Notice>();
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			String sql ="select notice_id,notice_title, notice_content, notice_date, notice_count from notice";
			PreparedStatement stmt = conn.prepareStatement(sql);
		
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeId(rs.getInt("notice_id"));
				notice.setNoticeTitle(rs.getString("notice_title"));
				notice.setNoticeContent(rs.getString("notice_content"));
				notice.setNoticeDate( rs.getString("notice_date"));
				notice.setNoticeCount(rs.getInt("notice_count"));
				list.add(notice);
			}
			conn.close();
		return list;
	}
	
	//공지사항 상세보기
	public Notice selectNoticeOne(Notice notice)throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql ="select notice_id, notice_title, notice_content, notice_date, notice_count from notice where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,notice.getNoticeId());
		ResultSet rs = stmt.executeQuery();
		//값이 있다면 값넣기
		if(rs.next()) {
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setNoticeDate(rs.getString("notice_date"));
			notice.setNoticeCount(rs.getInt("notice_count"));
		}
		conn.close();
		return notice;
	}
	
	//공지사항 삭제
	public void deleteNoticeList(Notice notice) throws Exception{
		DBUtil dbUtil =new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql ="delete from notice where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,notice.getNoticeId());
		stmt.executeUpdate();
		conn.close();
	}
	
	//공지사항 추가
	public void addNoticeList(Notice notice) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into notice(notice_title, notice_content, notice_date) values(?,?,now())"; 
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt+"<----addNotice stmt");
		stmt.setString(1,notice.getNoticeTitle());
		stmt.setString(2,notice.getNoticeContent());
		stmt.executeUpdate();
		conn.close();
	}
	
	//공지사항 업데이트
	public void updateNoticeOne(Notice notice) throws Exception{
		//commons에 있는 db메서드 가져오기
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update notice set notice_title=?,notice_content=? where notice_id =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,notice.getNoticeTitle());
		stmt.setString(2,notice.getNoticeContent());
		stmt.setInt(3, notice.getNoticeId());
		stmt.executeUpdate();
		conn.close();
	}
}
