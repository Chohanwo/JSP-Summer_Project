<%@page import="Product.productDto"%>
<%@page import="Product.productDao"%>
<%@page import="cart.cartDto"%>
<%@page import="cart.cartDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/cart.css">
    <title>주문내역</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">                                                                                                                                                                                           
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   

 



</head>
<body>
    <jsp:include page = "header.jsp" flush = "false"/>
    <hr>

    <div class = "big-box">
        <div class ="left-box">
            <nav id = "sideMenu">
                
            </nav>
         
    </div>
    

        <div class ="right-box">	
            <table id="cart" >
                <form name = frmSubmit>
                    <thead id="textcenter">
                        <tr class="tr-bottom">
                            <td >선택</td>
                            <td colspan="2" style="text-align: center;" >상품명</td>
                            <td>판매가</td>
                            <td>수량</td>
                            <td>배송비</td>
                            <td>합계</td>
                        </tr>
                        
                    </thead>
                 
                    
                    <tbody>
                    <%!
                    public String arrGetI(String[] stringArray, int idx){
                    	String result ="";
                    	result = stringArray[idx];
                    	return result;
                    }
                    
                    %>
                    
                    <%
                    
                   	cartDao cartDAO = new cartDao();
                    ArrayList<cartDto> cartList = new ArrayList<cartDto>();
                    String SessionId = (String)session.getAttribute("userID");
                    cartList = cartDAO.SelectCart(SessionId);
                    
                    //cartList의 사이즈 크기의 productIdexes 배열을 생성한다.
                    String[] productIndexes = new String[cartList.size()];
                    String[] SizeArray = new String[cartList.size()];
                    
                    for(int i = 0; i < cartList.size(); i++){
                    	productIndexes[i] = cartList.get(i).getProductNum();
                    	SizeArray[i] = cartList.get(i).getProductSize(); //s,m,l,xl
                    }
                    
                    
                    productDao productDAO = new productDao();
                    ArrayList<productDto> productList = new ArrayList<productDto>();
                    
                    productList = productDAO.SelectProductListSelected(productIndexes);
                    
                    
                    for(int i = 0; i<productList.size(); i++){
                 
                    %>
                  
                        <tr class="cart-detail">
                        <!-- id값은 중복해서 사용할수 없어서 id에 i추가, 몇번째 물품의 가격을 들고온다 ,onchange:값이 변했을때() 자바스크립트 함수를 호출 -->                          
                        <td><input type="checkbox" id = "checked<%=i%>" value = <%= productList.get(i).getSnum() %>  onchange="getCheckState(this.id, this.value, <%=i %>)"> </td>
                            <!-- 해당 상품에 맞는 사진을 들고오기위해 아래 스크립틀릿 사용 -->
                            <td><img src=<%= '"'+ productList.get(i).getSpic()+'"'%> class="photo" alt="원피스사진"></td>
                            <td><a href="#"><%= productList.get(i).getSname() %></a>
                                <p>사이즈:<%= cartList.get(i).getProductSize() %></p>
                               
                            </td> 
                            <input type ="hidden" id = "price<%=i %>" value =<%= productList.get(i).getSprice() %>>
                            <td ><%= productList.get(i).getSprice() %>원</td>
                            <td>1</td>
                            <td>무료</td>
                            <td><%= productList.get(i).getSprice() %>원</td>
                        </tr>
                        <input type ="hidden" id = "valueForSizeTemp<%=i %>" value =<%=SizeArray[i] %> name = "dropDownValueTemp">
                        <input type ="hidden" id = "valueForSize<%=i %>" value ="" name = "dropDownValue">
						<input type ="hidden" id = "valueForIdx<%=i %>" value ="" name = "Snum">
						
  
                    <%
                    }
                    %>
                    <input type = "hidden" id = "TotalSize" value = <%=productList.size() %>>

                    </tbody>
					        
                    <tfoot>
                     <c:forEach var="dto" items="${productList}">
                        <tr>
                            <td class="borderNone"><input type="checkbox"></td>
                            <td colspan="4"></td>
                        </tr>
                         </c:forEach>
                          
                    </tfoot>
                
            </table>     
            
            <div class="buy">
                <table>
                    <tr>
                        <td>총 상품금액</td>
                        <td ><span id = "totalPrice"></span> 원</td>
                    </tr>
                    <tr>
                        <td>배송비</td>
                        <td >무료</td>
                    </tr>
                    <tr>
                        <td >결제예정금액</td>
                        <td ><span id = "totalPrice2"></span> 원</td>
                    </tr>
                    <tr>
                    <td colspan="2">
                        <input type="button" class="buy-button" value="구매하기" onclick="getPost('01')">
                        <input type= "button" class="buy-button" value="선택 품목 삭제" onclick="getPost('02')">
                        </td>
                    </form>
                    </tr>
                </table>
            </div>
        </div>
    </div>
   
	<script>
  					//var는 모든변수를 다 담을 수있다.
  					//모든 체크박스를 var형의 checkboxes변수에 넣음
  					
					var checkboxes = document.querySelectorAll("input[type=checkbox]");
  					
  					
  					var totalSize = document.getElementById("TotalSize").value;
  					
  					//초기화 
					totalPriceNum = 0;
					
					
					function getCheckState(id, val, idx) {
						//check박스가 checked이면 true 아니면 false
					    var vals = document.getElementById(id).checked;						
				        var price =  parseInt(document.getElementById("price"+idx).value);
				        
				        console.log(document.getElementById("valueForSizeTemp"+idx).value);
				     	
				        
					    //true일때 값을 반환
					    if(vals == true) {
					        //리턴 값과 아이디를 출력한다
					        totalPriceNum += price;
					        
					        document.getElementById("valueForIdx"+idx).value = val;
					        document.getElementById("valueForSize"+idx).value = document.getElementById("valueForSizeTemp"+idx).value;
						    document.getElementById("totalPrice").innerText = totalPriceNum;
						    document.getElementById("totalPrice2").innerText = totalPriceNum;
						    
					        return true;
					    }
					    //false일때 값을 반환
					    else {
					    	totalPriceNum -= price;
					        
					        console.log(totalPriceNum);
					        document.getElementById("valueForIdx"+idx).value = null;
					        document.getElementById("valueForSize"+idx).value = null;
						    document.getElementById("totalPrice").innerText = totalPriceNum;
						    document.getElementById("totalPrice2").innerText = totalPriceNum;
						    
					        return false;
					    }
					    
					}
					
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
				              theForm.action = "deleteCart.jsp"
				        }
				        theForm.submit();
				    }
	</script> 
</body>
</html>