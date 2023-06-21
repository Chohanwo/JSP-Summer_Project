
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CoCoPINK Shop</title>
    <meta charset="utf-8" />
    <link href="css/main-page.css" rel="stylesheet" />
    <script src="js/main-page.js"></script>    
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
   


</head>

<jsp:include page = "header.jsp" flush = "false"/>



<body>




    

    <div class="big-box">
        <div>
        <table class="coupon">
            <tr >
                <td><img id="login-img" src="images/login/첫구매쿠폰.png" class="coupon" alt="첫구매 사진"><h5>첫 구매 <br>15%할인 쿠폰</h5></td>
                <td><img id="login-img" src="images/login/무료배송.png"  class="coupon" alt="무료배송 사진"><h5>전 상품 <br>무료배송</h5></td>
                <td><img id="login-img" src="images/login/리뷰쿠폰.png"  class="coupon" alt="리뷰 사진"><h5>베스트 리뷰<br> 5000원 쿠폰지원</h5></td>
            </tr>
        </table>
        </div>
        <br>
        <br>
    
		
        <div class="loginbox">
            <h3>LOGIN</h3>
            <form method = "post" action="loginpro.jsp">
            <input type  ="text" name = "id" placeholder="ID"><br>
            <input type  ="password" name = "pwd" placeholder="password"><br><br>
            <input type = "submit" class="btnlogin" value = "login">
            </form>
             <button onclick="location.href='join.jsp'" class="btnlogin">join</button>
        </div>
        
    </div>
    
</body>

</html>