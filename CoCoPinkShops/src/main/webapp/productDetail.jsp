<!-- 상품 -->
<%@page import="Product.productDto"%>
<%@page import="Product.productDao"%>
<%@page import="javax.swing.SpinnerNumberModel"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>



<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%
request.setCharacterEncoding("utf-8");
//함수호출
productDao dao = new productDao();


productDto dto = new productDto(); 

String idx = request.getParameter("Snum");


dto = dao.selectOneProduct(idx);


%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>


<!-- bootstrap 적용 -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css"
	integrity="sha512-Ez0cGzNzHR1tYAv56860NLspgUGuQw16GiOOp/I2LuTmpSK9xDXlgJz3XN4cnpXWDmkNBKXR/VDMTCnAaEooxA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.min.js"
	integrity="sha512-EKWWs1ZcA2ZY9lbLISPz8aGR2+L7JVYqBAYTq5AXgBkSjRSuQEGqWx8R1zAX16KdXPaCjOCaKE8MCpU0wcHlHA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<body>
	<jsp:include page = "header.jsp" flush = "false"/>

	<div class="container">
		<div class="row" style="margin-top: 150px">
			<div class="col">
				<img id="product_img" class="img-thumbnail" id="Spic" name="Spic"
					src='<%=dto.getSpic() %>'></img>
			</div>
			<div class="col">
				<form name = frmSubmit>
					<div style="text-align: center">
						<label for="userId" class="fs-1" style="margin: 20px" id="Sname"><%=dto.getSname()%></label>
					</div>


					<div class="row" style="margin-left: 20px; margin-bottom: 10px;">
						<div class="col-md-4">
							<label for="price_text" class="fs-4">SIZE</label>
						</div>
						<div class="col-md-4 offset-md-4">


							<select class="btn btn-outline-secondary btn-lg dropdown-toggle"
								name="select" id="select">
								<option value="-1" selected disable>선택하세요</option>
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
								<option value="XL">XL</option>
							</select>

							<p hidden id="value">
							   value : <span></span>
							</p>
							<input type ="hidden" id = "dropDownValue" value ="" name = "dropDownValue">
							<input type ="hidden" id = "Snum" value =<%=dto.getSnum()  %> name = "Snum">
							
							
							


						</div>
					</div>
					<div class="row" style="margin-left: 20px; margin-top: 10px;">
						<div class="col-md-4">
							<label for="price_text" class="fs-4">PRICE</label>
						</div>
						<div class="col-md-4 offset-md-4">
							<label for="price_text" class="fs-4" id="Sprice" name="Sprice"><%=dto.getSprice() %></label>
						</div>
					</div>
					<div class="row" style="margin-left: 20px; margin-top: 10px;">
						<div class="col-md-4">
							<label for="price_text" class="fs-4">Total</label>
						</div>
						<div class="col-md-4 offset-md-4">
							<label for="price_text" class="fs-4"><%=dto.getSprice() %></label>
						</div>
					</div>



					<div class="col" style="margin: 50px; height: 80px;">
					
					<%-- 
						<button type="reset" class="btn btn-secondary w-25 btn-lg"
							style="margin: 5px" method="post"
							onclick="btnCart()">장바구니</button>
							<script type="text/javascript">
							function btnCart(){
								let Snum=<%=dto.getSnum()%>;
								let Sname=<%=dto.getSname()%>;
								let Spic=<%=dto.getSpic()%>;
								let Sprice=<%=dto.getSprice()%>;
								let size = document.getElementById("value").value;
								location.href = '1pro.jsp?Snum=${Snum}&amp;Sname=${Sname}+&amp;Spic=${Spic}&amp;Sprice=${Sprice}&amp;size=${size}'
							}
							</script>
							--%>

						<%-- <button type="reset" id = "dropDownValue2" name = "productSize2" value = "" class="btn btn-secondary w-25 btn-lg"
							style="margin: 5px" method="post"
							onclick="location.href='CartInsertPro.jsp?Snum=<%=dto.getSnum()%>%>'">장바구니</button> --%>
						<input type = "button" onclick="getPost('02')" class="btn btn-secondary w-25 btn-lg" value = "장바구니">
							
						
						
							 
						<input type = "button" name ="join" class="btn btn-dark w-25 btn-lg" value = "바로구매" onclick="getPost('01')">  
						
						
						<button type="button" class="btn btn-outline-secondary btn-lg"
							style="margin-left: 20px" 
							onclick="window.open('<%=dto.getSinfo()%>','new','scrollbars=yes,resizable=no width=900 height=500, left=460,top=240');return false">옷정보
							보기</button>
					</div>
			</div>
			</form>

		</div>
	</div>
	</div>
	<script>
								let select = document.getElementById('select');
								let select2 = document.getElementById('dropDownValue');
								

								select.addEventListener(
												'change',
												function() {
													document.getElementById('value').children[0].innerHTML = "";

													let optionList = select.selectedOptions;
													for (let i = 0; i < optionList.length; i++) {
														document.getElementById('value').children[0].append(optionList[i].value);
														document.getElementById('dropDownValue').setAttribute("value", optionList[i].value);
														
														
													}													
												})
												
								function getPost(mode)
							    {
							        var theForm = document.frmSubmit;
							          if(mode == "01")
							        {
							            theForm.method = "post";
							            theForm.target = "_self";
							             theForm.action = "pay.jsp";
							        }
							        else if(mode == "02")
							           {
							              theForm.method = "post";
							             theForm.target = "_self";
							              theForm.action = "CartInsertPro.jsp"
							        }
							        theForm.submit();
							    }

												
							</script>

</body>
</html>