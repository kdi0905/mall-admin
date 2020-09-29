<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "dao.*"%>
<%@ page import= "vo.*"%>
<%	//로그인 안되있을시 로그인 페이지로 이동
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect(request.getContextPath() +"/login.jsp");
	}

	//한글 번역	
	request.setCharacterEncoding("utf-8");
	
	//memberList에서 이메일 받아오기
	String memberEmail = request.getParameter("memberEmail");
	//이메일을 vo패키지의 member클래스 이메일에 넣기
	Member member = new Member();
	member.setMemberEmail(memberEmail);
	
	//dao패키지의 삭제 메서드 실행
	MemberDao memberDao = new MemberDao();
	memberDao.deleteMember(member);
	
	//삭제한뒤 회원목록 페이지로 이동
	response.sendRedirect(request.getContextPath() +"/member/memberList.jsp");

%>