<%@page import="java.io.PrintWriter"%>
<%@page import="login.LoginDto"%>
<%@page import="login.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

	String Mid = request.getParameter("Mid");
	String pwd = request.getParameter("pwd");
	String Mname = request.getParameter("Mname");
	String Maddr = request.getParameter("Maddr");
	String Mphone = request.getParameter("Mphone");
	String Mbirth = request.getParameter("Mbirth");
	String Msms = request.getParameter("Msms");
	String Memail = request.getParameter("Memail");
	String SessionId = (String)session.getAttribute("userID");

	
	LoginDao loginDAO = new LoginDao();
	
	
	
	
	int result = loginDAO.updateLogin(Mid, pwd, Mname, Maddr, Mphone, Mbirth, Msms, Memail, SessionId);
	if(result == 1){ 
		//성공시 세션에 아디값을 저장함으로써 세션관리한다
		session.setAttribute("userID", Mid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원정보 수정 성공')");
		script.println("location.href = 'mypage.jsp'"); //로그인 성공시 보내야 할 위치 적어라,
		script.println("</script>");
	}
	else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	
	

	
%>

</body>
</html>