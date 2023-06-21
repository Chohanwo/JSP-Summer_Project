<%@page import="inquiry.inquiryDao"%>
<%@page import="inquiry.inquiryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <% 

	int bcode = Integer.parseInt(request.getParameter("bcode"));

	inquiryDto dto = new inquiryDto(); 
	inquiryDao dao = new inquiryDao();
	
	dto = dao.getOne(bcode);
	
	

		
%>	
    
<!DOCTYPE html>
<html lang="en">
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
            <strong>게시글 수정</strong>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
            <form action="inquiryEditPro.jsp">
                <div class="title">
                    <dl>
                    	<dt for="bcode">글번호</dt>
                        <dd><input type="text" style="border:none" name="bcode" value="<%=dto.getBcode() %>"></dd>                        
                        <dt for="subject">제목</dt>
                        <dd><input type="text" name="subject" value="<%=dto.getSubject() %>"></dd>
                        
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt for="writer">글쓴이</dt>
                        <dd><input type="text" style="border:none" name= "bcode" value="<%= dto.getWriter()%>" readonly></dd>                 
                     
                     </dl>
                    
                </div>
                <div class="cont">
                    <input type = "text" style=" width: 100%; height:200px; border:none;" name= "content" value="<%=dto.getContent() %>">
                </div>
            </div>
            <div class="bt_wrap">
            	<input type="submit" class="on" value="수정하기"  style="display: inline-block;min-width: 100px;margin-left: 10px;padding: 10px;border: 1px solid #000;border-radius: 2px;
    			font-size: 1.4rem;background: #000; color: #fff; ">
                <a href="inquiryList.jsp">취소</a>
            </div>
            </form>
        </div>
    </div>
</body>
</html>