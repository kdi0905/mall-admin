<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%
	request.setCharacterEncoding("utf-8");
	//값 받아오기
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	
	//Admin에 값 넣어주기
	Admin admin = new Admin();
	admin.setAdminId(adminId);
	admin.setAdminPw(adminPw);
	//AdminDao에서 메소드 불러오기
	AdminDao adminDao = new AdminDao();
	Admin loginAdmin = adminDao.login(admin);
	if(loginAdmin==null){
		System.out.println("로그인 실패");
		response.sendRedirect("/mall-admin/login.jsp?count=1");
	}else{
		System.out.println("로그인 성공");
		//로그인 정보를 sesseion에 저장(page < request < session < application)
		session.setAttribute("loginAdminId",loginAdmin.getAdminId()); // 세션에 변수 만드는 방법 ("변수",넣을 값)
		//이동
		response.sendRedirect("/mall-admin/index.jsp");
	}
%>