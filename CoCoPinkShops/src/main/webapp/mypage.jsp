<%@page import="javax.websocket.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
request.setCharacterEncoding("utf-8");
//함수호출
String myId = (String)session.getAttribute("userID");
;
LoginDao dao = new LoginDao();
LoginDto dto = dao.GetMyInfo(myId);
//저장된 값 불러오기
//
pageContext.setAttribute("dto", dto);


%>

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="css/mypage.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
   
<title>마이페이지</title>
</head>


<body>
	
	 <jsp:include page = "header.jsp" flush = "false"/>
	

<div class = "big-box-mp">
	<div class ="left-box_mypage">
		<nav id = "sideMenu-mp">
			<ul>
				<li><a href="index.jsp">메인</a></li>
				
				<strong><li><a href="mypage.jsp">MY PAGE</a></li></strong>
				<li><a href="membermodify.jsp">회원정보수정</a></li>
				<li><a href="cart.jsp">장바구니</a></li>
				<li><a href="inquiryList.jsp">1:1 문의</a></li>
				
			</ul>	
		</nav>
	</div>


	<div class ="right-box">
	
			
		<h5>내 계정 정보</h5>
			
		<h5 id="h5color">&nbsp;&nbsp;&nbsp; 이름</h5>
		<h5> ${dto.getMname() }</h5>
		
		<h5 id="h5color">&nbsp;&nbsp;&nbsp; 주소</h5>
			${dto.getMaddr() }
			<br><br>
		<h5 id="h5color">&nbsp;&nbsp;&nbsp; 휴대전화</h5>
			${dto.getMphone() }
			<br><br>


	</div>
	
</div>

<footer class="footer_mypage">
	<h4>customer center<br></h4>
	
	<h4>000-0000-0000<br></h4>
	<h4>평일 09:30 - 18:00</h4>
	<h4>점심 12:00 - 13:00</h4>
	<h4>휴무 토,일,공휴일 </h4>
	

</footer>


</body>
</html>