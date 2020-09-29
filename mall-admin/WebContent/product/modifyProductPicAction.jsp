<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.oreilly.servlet.MultipartRequest" %>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 파일이름을 대신 만들어준다 -->
<%@ page import ="vo.*" %>
<%@ page import ="dao.*" %>
<%
	//1. 상품 아이디와 이미지 파일을 받는다.
	//2. 이미지 파일을 서버 /image폴더에 새로운이름으로 저장한다.
	//3. 저장된 이미지의 이름을 상품 테이블에서 수정한다. ex)default.jpg -> 새로생성된 이름으로 변경

	/* <form enctype ="multipart/form-date">방식은 기존 방식 사용불가
	request.setCharacterEncoding("utf-8");
	String productId = request.getParameter("productId");
	String productPic = request.getParameter("productPic");
	System.out.println(productId+"<----productId"); // null
	System.out.println(productPic+"<----productPic"); // 파일값은 들어감
	*/
	
	//cos.jar 외부라이브러리 사용(내부 라이브러리 사용도 가능하지만 사용방법이 복잡)
	//MultipartRequest multi = new MultipartRequest(request,경로,크기,"utf-8",파일이름);
	int size =1024*1024*100 ;//100M ,  1kbyte == 1024byte , 1024byte*1024byte ==1M
	//위치 구하기
	String path = application.getRealPath("images"); // D:\javawork\mall-admin\WebContent\images
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());

	int productId = Integer.parseInt(multi.getParameter("productId"));
	System.out.println(productId+"<----productId");

	System.out.println(multi.getOriginalFileName("productPic"+"<-- 파일원본 이름"));
	String productPic = multi.getFilesystemName("productPic");
	System.out.println(multi.getFilesystemName("productPic")+"<-- 새로생성된파일이름");

	Product product= new Product();
	product.setProductId(productId);
	product.setProductPic(productPic);
	
	//update product set product_pic=? where product_id=?
			ProductDao productDao = new ProductDao();
	productDao.updateProductPic(product);
	response.sendRedirect(request.getContextPath()+"/product/productOne.jsp?productId="+product.getProductId());
%>