<%@page import="inquiry.inquiryDto"%>
<%@page import="inquiry.inquiryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="css/css.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    

</head>
<body>

 <jsp:include page = "header.jsp" flush = "false"/>
    <div class="board_wrap">
        <div class="board_title">
            <strong>문의하기</strong>
        </div>
        <form action="inquiryWritePro.jsp" method="post">
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt for="subject">제목</dt>
                        <dd><input type="text" name="subject" placeholder="제목 입력"></dd>
                        
                        <dt for="writer">작성자</dt>
                        <dd><input type="text" name="writer" placeholder="작성자입력"></dd>
                        
                    </dl>
                </div>
                <div class="cont">
                    <textarea  name="content" placeholder="내용 입력"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
               <input type="submit" class="onsubmit"  value="등록"  
                style="display: inline-block;min-width: 100px;margin-left: 10px;padding: 10px;border: 1px solid #000;border-radius: 2px;
    			font-size: 1.4rem;background: #000; color: #fff; ">               	
                <a href="inquiryList.jsp">취소</a>               
            </div>
            </form>
        </div>
    </div>
</body>
</html>