<%@page import="login.LoginDao"%>
<%@page import="login.LoginDto"%>
<%@page import="java.io.Console"%>
<%@page import="java.io.PrintWriter"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.util.Enumeration"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//값 받아오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	
	//각 객체(DAO,DTO) 초기화
	LoginDao loginDAO = new LoginDao();
	LoginDto loginDTO = new LoginDto();
	
	
	//LoginDTO 에  ID, Password 넣기
	loginDTO.setMid(id);
	loginDTO.setPwd(pwd);
	
	int result = loginDAO.login(loginDTO.getMid(), loginDTO.getPwd());
	
	//로그인한 정보를 세션에 저장
	
	if(session.getAttribute("userID") != null){
		session.setAttribute("userID", id);
	}
	if(result == 1){ 
		//성공시 세션에 아디값을 저장함으로써 세션관리한다
		session.setAttribute("userID", loginDTO.getMid());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 성공')");
		script.println("location.href = 'index.jsp'"); //로그인 성공시 보내야 할 위치 적어라,
		script.println("</script>");
	}
	else if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	

%>



</body>
</html>