
<%@page import="login.LoginDto"%>
<%@page import="login.LoginDao"%>
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
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String pwdcheck = request.getParameter("pwdcheck");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String birth = request.getParameter("birth");
	String sms = request.getParameter("sms");
	String email = request.getParameter("email");
	
	
	LoginDao dao = new LoginDao();
	LoginDto dto = new LoginDto();
	
	dto.setMid(id);
	dto.setPwd(pwd);  
	dto.setMname(name);
	dto.setMaddr(addr);
	dto.setMphone(phone);
	dto.setMbirth(birth);
	dto.setMsms(sms);
	dto.setMemail(email);
	
	 
	
	
	
	if(id == null || pwd == null || name == null || addr == null || phone == null || birth == null || sms == null || email == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')"); 
		script.println("history.back()");
		script.println("</script>");
	}
	if(!pwd.equals(pwdcheck)){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다.')"); 
		script.println("history.back()");
		script.println("</script>");
	}
	
	
	
	//데이터베이스
	int result = dao.Join(id, pwd, name, addr, phone, birth,sms, email);
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	else
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp'"); //로그인 성공시 보내야 할 위치 적어라
		script.println("</script>");
	}
	
	 
%>
</body>
</html>