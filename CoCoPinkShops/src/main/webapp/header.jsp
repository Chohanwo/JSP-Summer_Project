<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//함수호출
//String myId = '"' + (String)session.getAttribute("userID")+ '"';
//LoginDao dao = new LoginDao();
//저장된 값 불러오기
//LoginDto dto = dao.myInfo(myId);
//
//pageContext.setAttribute("dto", dto);
String SessionId = (String)session.getAttribute("userID");

%>
<head>
<link href="css/main-page.css" rel="stylesheet" />
    <script src="js/main-page.js"></script>    
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<header>
<style>
.navbar{
    height: 100px;
    padding-top: 10px;
    padding-left: 30px;
    padding-right: 30px;
    background-color: rgba(255, 255, 255, 0.1);
    position:sticky; top:0;
    
  }
  .navbar:hover{
    background-color: rgba(255, 255, 255, 0.8);
    transition-duration: 0.3s;
    
  #menu {
                display: inline-block;
                float: right;
            }

            #menu > li {
                display: inline-block;
            }
            #menu > li > a {
            	color: #aaa;
            	
            }
  }
</style>
	    <div class="navbar" style="position: sticky; z-index: 2;">
	      <a href="index.jsp" class="logo">    
	        <img src="images/mainpage/Logo.svg" width="149">
	        </a>
	        <ul id="menu">
	        <%	
				if(SessionId != null){		
				%>
				<li><a href="logout.jsp">LOGOUT</a></li>
				<li><a href="mypage.jsp">MYPAGE</a></li>
				 	<li><a href="inquiryList.jsp">INQUIRY</a></li>
	         	<li><a href="cart.jsp">CART</a></li>
				<%
				}
				else{
				%>
				<li><a href="login.jsp">LOGIN</a></li>
	         	<li><a href="join.jsp">JOIN</a></li>	         
	         
				<%
				}
				%>
	          
	        </ul>
	    </div>
 </header>