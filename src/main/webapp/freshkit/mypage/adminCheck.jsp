<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//관리자인지 체크
	//세션 저장
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	
	
	FkcustomerDAO dao = new FkcustomerDAO();
	FkcustomerVO person = dao.isExists(id, pw);
	
	
	System.out.println(person);
	System.out.println("----");
	
	System.out.println(id);
	System.out.println(pw);
	
	if(!person.getGrade().equals("관리자")){
		request.getRequestDispatcher("fkLogin.jsp").forward(request, response);
		
		return ;
	}
	
	%>