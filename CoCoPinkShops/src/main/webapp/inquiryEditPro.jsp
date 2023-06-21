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
 	 int bcode = Integer.parseInt(request.getParameter("bcode"));
   
	
 	inquiryDao dao = new inquiryDao();
 	inquiryDto dto = new inquiryDto();
	
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setBcode(bcode);
	
	dao.inquiryFunction(dto, "U");
   
   response.sendRedirect("inquiryList.jsp");
%>