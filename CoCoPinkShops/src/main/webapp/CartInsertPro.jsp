
<%@page import="cart.cartDao"%>


<%@page import="java.io.PrintWriter"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	out.println("1");
	request.setCharacterEncoding("utf-8");
	
	String size = request.getParameter("dropDownValue");
	out.println(size);
	String productIdx = request.getParameter("Snum");
	out.println(productIdx);
	String SessionId = (String)session.getAttribute("userID");
	out.println(SessionId);
	
	cartDao cartDAO = new cartDao();
	int result = cartDAO.InsertPurchaseInfo(productIdx, SessionId, size);
	
	
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('장바구니 데이터 입력 성공')");
		script.println("location.href = 'index.jsp'"); //로그인 성공시 보내야 할 위치 적어라,
		script.println("</script>");
	}else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터 베이스 오류')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	
	
	
	
	 
%>
</body>
</html>