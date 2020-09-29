<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="vo.*" %>
    <%@page import ="dao.*" %>
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

.tablecolor {
	background-color: #FFFFFF;
}
.bg {
	background-color: #E7E7E7;
}
</style>
</head>
<body>
<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
		//noticeOne에서 값 받아오기
		
		int noticeId =Integer.parseInt(request.getParameter("noticeId"));
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		
	%>
	<div class="color">
		<div class="container "style="text-align: center;">
			<h1 class="text-dark " >공지사항수정</h1>
			
			<form method="post" action="<%=request.getContextPath()%>/notice/updateNoticeOneAction.jsp">
				<table class ="table table-bordered table-striped ">
					<tr>
						<td >공지사항 번호</td>
						<td><input type ="hidden" value ="<%=noticeId %>" name ="noticeId"><%=noticeId %></td>
					</tr>
					<tr>
						<td  >공지사항 제목</td>
						<td  ><input type ="text" name="noticeTitle" value="<%=noticeTitle%>" > </td>
					</tr>
					<tr>
						<td >공지사항 내용</td>
						<td ><textarea rows="5" cols="70" name="noticeContent"><%=noticeContent %></textarea></td>
					</tr>
					
				</table>
				<button class="btn btn-outline-secondary" type="submit">공지사항 수정</button>
				<a class="btn btn-outline-secondary" href="<%=request.getContextPath() %>/notice/noticeOne.jsp?noticeId=<%=noticeId%>">취소</a>
			</form>

	</div>
	</div>
</body>
</html>