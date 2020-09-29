<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import ="com.oreilly.servlet.MultipartRequest" %>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 파일이름을 대신 만들어준다 -->

<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
	}
	request.setCharacterEncoding("utf-8");

	int size =1024*1024*100 ;//100M ,  1kbyte == 1024byte , 1024byte*1024byte ==1M
	//위치 구하기
	String path = application.getRealPath("images"); // D:\javawork\mall-admin\WebContent\images
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());

	int categoryId = Integer.parseInt(multi.getParameter("categoryId"));
	System.out.println(categoryId+"<----categoryId");
	
	String categoryName = multi.getParameter("categoryName");
	System.out.println(categoryName+"<----categoryName");
	
	String categoryCk = multi.getParameter("categoryCk");
	System.out.println(categoryCk+"<----categoryCk");
	

	String original =multi.getOriginalFileName("categoryPic");
	System.out.println(original+"<-- 파일원본 이름");
	String categoryPic =original;
	
	  categoryPic = multi.getFilesystemName("categoryPic");
	System.out.println(multi.getFilesystemName("categoryPic")+"<-- 새로생성된파일이름");
	
	//카테고리 메서드에 값 넣기
	Category category = new Category();
	category.setCategoryId(categoryId);
	category.setCategoryName(categoryName);
	category.setCategoryPic(categoryPic);
	category.setCategoryCk(categoryCk);
	
	//업데이트 명령어 실행
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategory(category);
	System.out.println(category.getCategoryId()+"<----categoryId2");
	System.out.println(category.getCategoryName()+"<----categoryName2");
	System.out.println(category.getCategoryCk()+"<----categoryCk2");
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>