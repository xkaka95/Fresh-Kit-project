<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="adminCheck.jsp"%>
<%

	String[] removeCustomer = request.getParameterValues("checkId");
	
	for(String x : removeCustomer){
		dao.removeCustomer(x,null);
	}
	
	response.sendRedirect("admin.jsp");
	
	
	%>