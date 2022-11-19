<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
<%@page import="kr.co.freshkit.dao.FkcartDAO"%>
<%@page import="kr.co.freshkit.vo.FkcartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String nono = request.getParameter("pno");
		int pno = Integer.parseInt(nono);
		
		out.println(pno);
		
		int no = 1; // 임시고객번호
		
		FkcartDAO dao = new FkcartDAO();
		
		
    //리다이렉트
			dao.insertOne(pno, no);
    response.sendRedirect("fkviewcart.jsp");
    
    %>    
    
    
    