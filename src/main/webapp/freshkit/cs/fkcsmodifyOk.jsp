<%@page import="kr.co.freshkit.vo.FkcsVO"%>
<%@page import="kr.co.freshkit.dao.FkcsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
		
	
	String num1 = request.getParameter("no");
	String num2 = request.getParameter("csno");
	if(num1 != null && num2 != null){
		int no = Integer.parseInt(num1);
		int csno = Integer.parseInt(num2);
		
		String cstitle = request.getParameter("cstitle");
		String cscontents = request.getParameter("cscontents");
		
		//out.println(no +" : "+cstitle+" : "+cscontents);
		
		//2.dao
		FkcsDAO dao = new FkcsDAO();
		
		FkcsVO vo = new FkcsVO();
		
		vo.setNo(no);
		vo.setCsno(csno);
		vo.setCstitle(cstitle);
		vo.setCscontents(cscontents);
		
		dao.modifyOne(vo);
		
		response.sendRedirect("fkcs.jsp");
	}
	
	%>
