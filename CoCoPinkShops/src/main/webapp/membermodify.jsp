<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/membermodify.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <header>
        <h1>회원정보</h1>    
    </header>
    <hr>

    <div class = "big-box">
        <div class ="left-box">
            <nav id = "sideMenu">
                <ul>
                    <li><a href="mypage.jsp">마이페이지</a></li>
                    <li><a href="membermodify.jsp">회원정보수정</a></li>
                    <li><a href="cart.jsp">장바구니</a></li>
                    <li><a href="inqury.jsp">1:1 문의</a></li>
                    
                </ul>
            </nav>
        </div>
    

        <div class ="middle-box">
         <form action ="membermodifyPro.jsp" method ="post">
            <h4>아이디: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <input type ="text" name ="Mid"></h4>          
                <h4>새 비밀번호:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"  name ="pwd"></h4>
                <h4>이름:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"  name ="Mname"></h4>
                <h4>주소:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" name="Maddr"></h4>
                <h4>휴대전화:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"  name ="Mphone"></h4>
                <h4>생년월일:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"  name ="Mbirth"></h4>
                <h4>sms 수신여부:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"> 예 <input type="radio" name="Msms">아니오</h4>
                <h4>e-mail 수신여부:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="radio">예 <input type="radio"  name ="Memail"> 아니오</h4><br><br>
            
        
        </div>

        <div class="right-box">

        </div>
    
    </div>

    <footer class="btn">
        
        <button class="btn-detail">수정하기</a></button><br>
        </form>
        <button class="btn-detail"><a href="cancel.jsp">취소 </a></button><br>
     
    </footer>

       
</body>
</html>