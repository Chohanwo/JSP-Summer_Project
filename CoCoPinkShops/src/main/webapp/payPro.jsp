<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<%@page import="purchase.purchaseDto"%>
<%@page import="purchase.purchaseDao"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String productId = request.getParameter("ProductId");
String userId = request.getParameter("MyId");
String size = request.getParameter("ProductSize");

purchaseDao dao = new purchaseDao();
purchaseDto dto = new purchaseDto();

int result = dao.InsertPurchaseInfo(productId, userId, size);


if(productId == null || userId == null || size == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('빈 값이 있습니다')");
	script.println("history.back()"); 
	script.println("</script>");
}

if(result == 1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('상품 구매 성공!!')");
	script.println("location.href = 'index.jsp'"); 
	script.println("</script>");
}

%>

</body>
</html>