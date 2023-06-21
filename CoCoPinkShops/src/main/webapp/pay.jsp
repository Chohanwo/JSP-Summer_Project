

<%@page import="java.util.ArrayList"%>
<%@page import="javax.websocket.Session"%>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginDto"%>
<%@page import="Product.productDto"%>
<%@page import="Product.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>



<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%
request.setCharacterEncoding("utf-8");
//함수호출
productDao dao = new productDao();
ArrayList<productDto> productList = new ArrayList<productDto>();

LoginDao loginDao = new LoginDao();
LoginDto user = new LoginDto();

String[] idxes = {};
String[] sizes = {}; 

idxes = request.getParameterValues("Snum");
sizes = request.getParameterValues("dropDownValue");

int price = 0;


productList = dao.SelectProductListSelected(idxes);

String SessionId = (String)session.getAttribute("userID");

//out.print(SessionId);
user = loginDao.GetMyInfo(SessionId);




%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap 적용 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css"
	integrity="sha512-Ez0cGzNzHR1tYAv56860NLspgUGuQw16GiOOp/I2LuTmpSK9xDXlgJz3XN4cnpXWDmkNBKXR/VDMTCnAaEooxA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.min.js"
	integrity="sha512-EKWWs1ZcA2ZY9lbLISPz8aGR2+L7JVYqBAYTq5AXgBkSjRSuQEGqWx8R1zAX16KdXPaCjOCaKE8MCpU0wcHlHA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>order</title>
</head>
<body>
<jsp:include page = "header.jsp" flush = "false"/>

	<div class="container">
		<main>
			<div class="py-5 text-center">

				<h2>결제 페이지</h2>
						<form action="payPro.jsp" method ="post">
			</div>

			<div class="row justify-content-center">

				<ul class="list-group w-25"
					style="text-align: center; margin-bottom: 30px;">
					<h5>구매항목</h5>
					
					<%
					for(int i = 0; i<productList.size(); i++){
						price += Integer.parseInt(productList.get(i).getSprice());
					%>
					<div class="card-deck">
						<div class="card" *ngFor="let item of cards">
							<div class="embed-responsive embed-responsive-4by3">
								<img src="<%= productList.get(i).getSpic() %>"
									class="card-img-top embed-responsive-item" alt="tree">
							</div>
							<div class="card-body">
								<h5 class="card-name">상품명 : <%= productList.get(i).getSname() %></h5>
								<h5 class="card-size">사이즈 : <%= sizes[i] %></h5>
								<p class="card-num">금액 : <%= productList.get(i).getSprice() %></p>
								<input type ="hidden"  value =<%=productList.get(i).getSnum()  %> name = "ProductId">
								<input type ="hidden"  value =<%=sizes[i]  %> name = "ProductSize">
							</div>
						</div>
					</div>
					<%
					}
					if(productList.size() > 1)
					{
					%>
					<li class="list-group-item">상품 갯수 : <%= productList.size() %></li>
					<li class="list-group-item">총 금액 : <%= price %></li>
					<%
					}
					%>
				</ul>
			</div>
			<div class="row g-5" style="margin-left: 100px; margin-right: 100px;">
				<form class="needs-validation" novalidate>
					<div class="row g-3">
						<div class="col-sm-6">
							<label for="firstName" class="form-label">이름 </label> <input
								type="text" class="form-control" id="firstName" placeholder=""
								value=<%= user.getMname() %> name = "MyId" required>
						</div>

						<!-- <div class="col-12">
							<label for="username" class="form-label">배송지 이름 </label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="username"
									placeholder="Username" required>
							</div>
						</div> -->

						<div class="col-12">
							<label for="email" class="form-label">Email <span
								class="text-muted">(선택사항)</span></label> <input type="email"
								class="form-control" id="email" placeholder="you@example.com">
						</div>

						<div class="col-12">
							<label for="address2" class="form-label">전화번호</label> <input
								type="text" class="form-control" value=<%= user.getMphone() %> id="phone">
						</div>


						<div class="col-12">
							<label for="address" class="form-label">배송지 주소 </label> <input
								type="text" class="form-control" value=<%= user.getMaddr() %> id="address"
								placeholder=Address " required>
						</div>


						<hr class="my-4">

						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="same-address">
							<label class="form-check-label" for="same-address">배송 주소는
								내 배송지와 동일합니다.</label>
						</div>

						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="save-info">
							<label class="form-check-label" for="save-info">다음에도 이
								정보를 기억하기 </label>
						</div>

						<hr class="my-4">

						<h4 class="mb-3">결제방법</h4>

						<div class="my-3">
							<div class="form-check">
								<input id="credit" name="paymentMethod" type="radio"
									class="form-check-input" checked required> <label
									class="form-check-label" for="credit">신용 카드</label>
							</div>
							<div class="form-check">
								<input id="debit" name="paymentMethod" type="radio"
									class="form-check-input" required> <label
									class="form-check-label" for="debit">직불 카드</label>
							</div>
							<div class="form-check">
								<input id="paypal" name="paymentMethod" type="radio"
									class="form-check-input" required> <label
									class="form-check-label" for="paypal">계좌이체</label>
							</div>
						</div>

						<div class="row gy-3">
							<div class="col-md-6">
								<label for="cc-name" class="form-label">카드 이름 </label> <input
									type="text" class="form-control" id="cc-name" placeholder=""
									required> <small class="text-muted">신용 카드 번호</small>
							</div>

							<div class="col-md-6">
								<label for="cc-number" class="form-label">신용 카드 번호</label> <input
									type="text" class="form-control" id="cc-number" placeholder=""
									required>
							</div>

							<div class="col-md-3">
								<label for="cc-expiration" class="form-label">만료</label> <input
									type="text" class="form-control" id="cc-expiration"
									placeholder="" required>
							</div>

							<div class="col-md-3">
								<label for="cc-cvv" class="form-label">CVV</label> <input
									type="text" class="form-control" id="cc-cvv" placeholder=""
									required>
							</div>
						</div>
						<div style="text-align: center; margin-top: 50px">
						
						<!-- 상품정보와 유저정보 보내기  -->
						<!-- <input type ="hidden" value ="" name = "ProductId">
						<input type ="hidden" value ="" name = "MyId">
						<input type ="hidden" value ="" name = "ProductSize"> -->
						<input type="submit" class="btn btn-primary btn-lg w-25" value="결제하기">
						
						</form>
						</div>
				
			</div>
		</main>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; customer center</p>
			<ul class="list-inline">
				<p class="mb-1">000-0000-0000</p>
				<p class="mb-1">평일 09:30 - 18:00</p>
				<p class="mb-1">점심 12:00 - 13:00</p>
				<p class="mb-1">휴무 토,일,공휴일</p>
			</ul>
		</footer>
	</div>

</body>
</html>