<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<% if(session.getAttribute("loginAdminId")==null){
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
</style>
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>


	<%
		//dao메서드에서 member 전체 리스트를 불러온다
			Member member = new Member();
		//dao에 사용할 vo패키지에서 member변수를 불러온다
			MemberDao memberDao = new MemberDao();
			
		//arrayList를 써서 member리스트를 배열에 넣는다
		ArrayList<Member> memberList = memberDao.selectMemberList();
	%>
	<div class="color">
		<div class="container ">
			<h1 class="text-dark ">회원목록</h1>
			<table class ="table table-bordered table-hover table-striped " style="text-align: center;">
				<thead class="thead-light">
					<tr>
						<th>회원 이메일</th>
						
						<th>회원 이름</th>
						<th>가입 날짜</th>
						<th>강제 탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<%	
						//member리스트에 배열 값이 있을때까지 반복하여 출력한다.
						for (Member m : memberList) {
					%>
					<tr>
						<td><%=m.getMemberEmail() %></td>
						<td><%=m.getMemberName() %></td>
						<td><%=m.getMemberDate() %></td>
						<td class="btn btn-Light btn-sm"><a class ="text-muted" href="<%=request.getContextPath()%>/member/deleteMember.jsp?memberEmail=<%=m.getMemberEmail()%>">탈퇴</a></td>
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