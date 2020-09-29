<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="vo.*" %>
    <%@ page import = "dao.*" %>
<% // 비로그인시 로그인페이지 이동 
if (session.getAttribute("loginAdminId") == null) {
	response.sendRedirect("/mall-admin/login.jsp");
	return;
}
	
	//addNoticeList 값 받아오기
	request.setCharacterEncoding("utf-8");
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	//notice 메서드에 값 넣기
	Notice notice = new Notice();
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	
	//noticeDao 메서드 불러오기
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.addNoticeList(notice);

	//noticeList 페이지 이동
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");


%>