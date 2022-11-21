<%@page import="kr.co.freshkit.dao.FkcsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String no = request.getParameter("csno");
	
	if(no != null){
		
			int csno = Integer.parseInt(no);
			
			FkcsDAO dao = new FkcsDAO();
				
			dao.deleteOne(csno);
			
			
	}
	
		response.sendRedirect("fkcs.jsp");
	

%>