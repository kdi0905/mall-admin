<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>

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
	<%
		NoticeDao noticeDao = new NoticeDao();
	ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
	%>
	<!-- 메뉴 -->
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="color">
		<div class="container ">
			<h1 class="text-dark ">공지사항목록</h1>
			<!-- 공지사항 추가하기 -->
			<div><a class="btn btn-outline-secondary " href="<%=request.getContextPath()%>/notice/addNoticeList.jsp">공지사항 추가</a></div>
			<!-- 공지사항 리스트 테이블 -->
			<table class ="table table-bordered table-hover table-striped"  style="text-align: center;">
				<thead class="thead-light">
					<tr>
						<th class ="text-dark ">공지사항 번호</th>
						<th class ="text-dark ">공지사항 제목</th>
						<th class ="text-dark ">공지사항 올린시간</th>
						<th class ="text-dark ">조회수</th>
						<th >삭제</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Notice notice : noticeList) {
					%>
					<tr>
						<td class ="text-dark "><a class ="btn btn-outline-secondary" href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=notice.getNoticeId()%>"><%=notice.getNoticeId()%></a></td>
						<td class ="text-dark " ><%=notice.getNoticeTitle()%></td>
						<td class ="text-dark "><%=notice.getNoticeDate()%></td>
						<td class ="text-dark "><%=notice.getNoticeCount()%></td>
						<td class="btn btn-Light btn-sm"><a class ="text-muted" href="<%=request.getContextPath()%>/notice/deleteNoticeAction.jsp?noticeId=<%=notice.getNoticeId()%>">삭제</a></td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>

		</div>
	</div>
</body>
</html>