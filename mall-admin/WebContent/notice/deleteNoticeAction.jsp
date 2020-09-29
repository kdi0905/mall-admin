<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*"%>
<%@ page import ="vo.*" %>
<%
	
	request.setCharacterEncoding("utf-8");
	//noticeList에서 값 받아오기
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	//notice 객제 생성
	Notice notice = new Notice();
	
	notice.setNoticeId(noticeId);

	NoticeDao noticeDao = new NoticeDao();
	noticeDao.deleteNoticeList(notice);
	
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>