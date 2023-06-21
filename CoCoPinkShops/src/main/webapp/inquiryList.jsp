<%@page import="inquiry.inquiryDto"%>
<%@page import="inquiry.inquiryDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
inquiryDao dao = new inquiryDao();
ArrayList<inquiryDto> dtos = dao.list();


%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의사항</title>
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
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                </div>
                
                <%
                	for(inquiryDto dto:dtos){
                %>
                
                <div>
                    <div class="num"><%=dto.getBcode()%></div>
                    <div class="title"><a href="inquiryEdit.jsp?bcode=<%=dto.getBcode()%>"><%=dto.getSubject() %></a></div>
                    <div class="writer"><%= dto.getWriter() %></div>
                    <div class="date"><%= dto.getRegdate() %></div>
                </div>
                <%} %>
            </div>
            <div class="board_page">
                <a href="#" class="bt first"><<</a>
                <a href="#" class="bt prev"><</a>
                <a href="#" class="num on">1</a>                
                <a href="#" class="bt next">></a>
                <a href="#" class="bt last">>></a>
            </div>
            <div class="bt_wrap">
                <a href="inquiryWriteForm.jsp" class="on">글 등록</a>
                <!--<a href="#">수정</a>-->
            </div>
        </div>
    </div>
</body>
</html> 