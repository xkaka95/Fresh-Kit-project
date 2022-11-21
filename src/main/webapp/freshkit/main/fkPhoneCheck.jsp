
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%
	
    request.setCharacterEncoding("UTF-8");
    
    String phone = request.getParameter("customerphone");
    
    boolean result = true;

    if(phone!=null){
    FkcustomerDAO dao = new FkcustomerDAO();
    
    result = dao.phoneCheck(phone);
    dao.close();
    }else{
    	result=false;
    }
    
    out.println(result);
	
	%>