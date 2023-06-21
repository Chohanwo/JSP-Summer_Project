<%@page import="Product.productDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Product.productDto"%>
<%@page import="login.LoginDto"%>
<%@page import="login.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
//함수호출
//String myId = '"' + (String)session.getAttribute("userID")+ '"';
//LoginDao dao = new LoginDao();
//저장된 값 불러오기
//LoginDto dto = dao.myInfo(myId);
//
//pageContext.setAttribute("dto", dto);


%>
<!DOCTYPE html>
<html>
  <head>
  
    <title>CoCoPINK Shop</title>
    <meta charset="utf-8" />
    <link href="css/main-page.css" rel="stylesheet" />
    <script src="js/main-page.js"></script>    
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  </head>
  
  
  
  <!-- 이미지 슬라이더 스타일시트-->
  <style>
    .slider-1 {
    height:830px;
    position:relative;
}

/* 슬라이더 1 - 페이지 버튼 */
.slider-1 > .page-btns {
    text-align:center;
    position:absolute;
    bottom:20px;
    left:0;
    width:100%;
}

.slider-1 > .page-btns > div {
    width:20px;
    height:20px;
    background-color:rgba(255,255,255,.5);
    border-radius:4px;
    display:inline-block;
    cursor:pointer;
}

.slider-1 > .page-btns > div.active {
    background-color:rgba(255,255,255,1);
}

/* 슬라이더 1 - 슬라이드 */

.slider-1 > .slides > div {
    position:absolute;
    top:0;
    left:0;
    right:0;
    bottom:0;
    opacity:0;
    transition: opacity 0.3s;
    background-position:center;
    background-size:cover;
    background-repeat:no-repeat;
}

.slider-1 > .slides > div.active {
    opacity:1;
}

/* 슬라이더 좌우 버튼 */
.slider-1 > .side-btns > div {
    position:absolute;
    top:0;
    left:0;
    width:25%;
    height:100%;
    cursor:pointer;
}
.slider-1 > .side-btns > div:last-child {
    left:auto;
    right:0;
}
.slider-1 >.side-btns > div > span {
    position:absolute;
    top:50%;
    left:20px;
    transform:translatey(-50%);
    background-color:white;
    opacity:0.5;
    padding:1px 13px;
    border-radius:50px;
    font-size:25px;
}
.slider-1 >.side-btns > div:last-child > span {
    left:auto;
    right:20px;
}

/* 슬라이더 1 끝 */
  </style>
  <!-- //이미지 슬라이더 스타일시트-->

  <!-----------------------------------body------------------------------->
  <body>
    <!-- 헤더 영역 -->
    <jsp:include page = "header.jsp" flush = "false"/>

    <!-- 이미지 슬라이더 -->
    <div class="slider-1">
        <div class="slides">
            <div class="active" style="background-image:url(images/mainpage/banner1.png);"></div>
            <div style="background-image:url(images/mainpage/banner2.png);"></div>
            <div style="background-image:url(images/mainpage/banner3.png);"></div>
            <div style="background-image:url(images/mainpage/banner4.png);"></div>
        </div>
        <div class="page-btns">
            <div class="active"></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
        <div class="side-btns">
            <div>
                <span><i class="fas fa-angle-left"></i></span>
            </div>
            <div>
                <span><i class="fas fa-angle-right"></i></span>
            </div>
        </div>
    </div>
    <!-- //이미지 슬라이더 -->

    <!-- 이미지 슬라이더 js-->
    <script>
        // JS 영역
        console.clear();

// 기존 버튼형 슬라이더
$('.slider-1 > .page-btns > div').click(function(){
    var $this = $(this);
    var index = $this.index();
    
    $this.addClass('active');
    $this.siblings('.active').removeClass('active');
    
    var $slider = $this.parent().parent();
    
    var $current = $slider.find(' > .slides > div.active');
    
    var $post = $slider.find(' > .slides > div').eq(index);
    
    $current.removeClass('active');
    $post.addClass('active');
});

// 좌/우 버튼 추가 슬라이더
$('.slider-1 > .side-btns > div').click(function(){
    var $this = $(this);
    var $slider = $this.closest('.slider-1');
    
    var index = $this.index();
    var isLeft = index == 0;
    
    var $current = $slider.find(' > .page-btns > div.active');
    var $post;
    
    if ( isLeft ){
        $post = $current.prev();
    }
    else {
        $post = $current.next();
    };
    
    if ( $post.length == 0 ){
        if ( isLeft ){
            $post = $slider.find(' > .page-btns > div:last-child');
        }
        else {
            $post = $slider.find(' > .page-btns > div:first-child');
        }
    };
    
    $post.click();
});

setInterval(function(){
    $('.slider-1 > .side-btns > div').eq(1).click();
}, 5000);


        </script>
    <!-- //이미지 슬라이더 js-->
    
       
    
    <!-- 상품 리스트 -->
    <div class="item_list_area">
        
        <div class="list_tit">
            <h3>PRODUCT</h3>
        </div>
        <div class="product_list_area">
            <ul>
	            <%
	    
			    ArrayList<productDto> productList = new ArrayList<productDto>();
			    productList = productDao.SelectProduct();
			    
			    for(int i = 0; i<productList.size(); i++){
			    	
			    %>
                <li style="width:25%;">       
                    <div class="product_cont">
                        <div class="item_photo_box">
                            <a onclick="location.href='productDetail.jsp?Snum=<%=productList.get(i).getSnum()%>'">
                                <img src=<%= productList.get(i).getSpic()%>>
                            </a>
                        </div>
                        <div class="item_info_cont">
                            <div class="item_title-box">
                                <a onclick="location.href='productDetail.jsp?Snum=<%=productList.get(i).getSnum()%>'">
                                     <strong class="item_name">
                                        <%= productList.get(i).getSname() %>
                                    </strong>
                                   
                                    <div class="item_money-box">
                                        <strong class="item_price">
                                            <span><%= productList.get(i).getSprice() %></span>
                                        </strong>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
                <%
                }
                %>
            </ul>
            
        </div>
        
    </div>
    <!-- 상품 리스트 -->
    

   
  </body>
</html>