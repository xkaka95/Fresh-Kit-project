<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%
	
    request.setCharacterEncoding("UTF-8");
    
    String email = request.getParameter("customeremail");
    
    boolean result = true;

    if(email!=null){
    FkcustomerDAO dao = new FkcustomerDAO();
    
    result = dao.emailCheck(email);
    dao.close();
    }else{
    	result=false;
    }
    
    out.println(result);
	
	%>