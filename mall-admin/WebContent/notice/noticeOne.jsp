<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	//비로그인 일시 로그인페이지 이동
if (session.getAttribute("loginAdminId") == null) {
	response.sendRedirect("/mall-admin/login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.color {
	background-color: #F6F6F6;
}

</style>
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		//noticeList값 받아오기
	request.setCharacterEncoding("utf-8");
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));

	//notice메서드에 값 넣기
	Notice notice = new Notice();
	notice.setNoticeId(noticeId);

	//noticeDao메서드실행
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.selectNoticeOne(notice);
	%>
	<div class="color">
		<div class="container ">
			<h1 class="text-dark ">공지사항 상세보기</h1>
			<table class ="table table-bordered table-striped " style="text-align: center;">
				<tr>
					<td >공지사항 번호</td>
					<td ><%=notice.getNoticeId()%></td>
				</tr>

				<tr>
					<td >공지사항 제목</td>
					<td><%=notice.getNoticeTitle()%></td>
				</tr>

				<tr>
					<td >공지사항 내용</td>
					<td ><%=notice.getNoticeContent()%></td>
				</tr>
				<tr>
					<td>공지사항 올린 시간</td>
					<td ><%=notice.getNoticeDate()%></td>
				</tr>
				<tr>
					<td >공지사항 조회수</td>
					<td ><%=notice.getNoticeCount()%></td>
				</tr>

			</table>
			<div style="text-align: center;">
				<a class="btn btn-outline-secondary" href="<%=request.getContextPath() %>/notice/updateNoticeOne.jsp?noticeId=<%=notice.getNoticeId()%>&noticeTitle=<%=notice.getNoticeTitle()%>&noticeContent=<%=notice.getNoticeContent()%>">수정</a>
				<a class="btn btn-outline-secondary" href="<%=request.getContextPath() %>/notice/noticeList.jsp">목록</a>
			</div>

		</div>
	</div>

</body>
</html>