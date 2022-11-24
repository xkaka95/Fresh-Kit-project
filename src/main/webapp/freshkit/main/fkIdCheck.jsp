

<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%
	
    request.setCharacterEncoding("UTF-8");
    
    String id = request.getParameter("customerid");
    
    int result = 0;

    if(id!=null){
    FkcustomerDAO dao = new FkcustomerDAO();
    
    result = dao.idCheck(id);
    dao.close();
    }else{
    	result=1;
    }
    
    out.println(result);
	
	%>
