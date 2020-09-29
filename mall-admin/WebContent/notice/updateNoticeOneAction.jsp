<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import ="vo.*" %>
   <%@ page import ="dao.*" %>
<%
	//비로그인 일시 로그인페이지 이동
if (session.getAttribute("loginAdminId") == null) {
	response.sendRedirect("/mall-admin/login.jsp");
	return;
}
//updateNoticeOne값 받아와서 notice메서드에 넣기
	Notice notice = new Notice();
		request.setCharacterEncoding("utf-8");
		notice.setNoticeId(Integer.parseInt(request.getParameter("noticeId")));
		notice.setNoticeTitle(request.getParameter("noticeTitle"));
		notice.setNoticeContent(request.getParameter("noticeContent"));
		System.out.println(notice.getNoticeId() +"<----updateNoticeOneAction");
		//noticeDao에 있는 uptateNoticeOne 메서드 실행
		NoticeDao noticeDao = new NoticeDao();
		noticeDao.updateNoticeOne(notice);
		
		//noticeOne으로 이동
		response.sendRedirect(request.getContextPath()+"/notice/noticeOne.jsp?noticeId="+notice.getNoticeId());
%>
