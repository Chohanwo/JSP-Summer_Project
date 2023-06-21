
<%@page import="java.io.PrintWriter"%>
<%@page import="cart.cartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"  %>
    
<%
	request.setCharacterEncoding("utf-8");

	String[] idxes = {};
	idxes = request.getParameterValues("Snum");
	
	cartDao cartDAO = new cartDao();
	
	String SessionId = (String)session.getAttribute("userID");
	
	int result = cartDAO.deleteCartElements(idxes, SessionId);


	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제 성공')");
		script.println("location.href = 'cart.jsp'"); 
		script.println("</script>");
	}
	else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('디비 오류')");
		script.println("history.back()"); 
		script.println("</script>");
	}
  
	
%>



