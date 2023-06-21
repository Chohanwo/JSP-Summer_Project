<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
    
<%@ page import="inquiry.inquiryDao, inquiry.inquiryDto" %>

<% 
   request.setCharacterEncoding("utf-8");

	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	
	
	inquiryDao dao = new inquiryDao(); //빈 dao
	inquiryDto dto = new inquiryDto();
	
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setWriter(writer);
	
	dao.inquiryFunction(dto, "I");
	
	
   
   response.sendRedirect("inquiryList.jsp");
%>