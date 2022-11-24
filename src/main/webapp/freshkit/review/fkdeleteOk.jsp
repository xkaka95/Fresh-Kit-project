
<%@page import="kr.co.freshkit.dao.FkreviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터값
		String no = request.getParameter("reno");

	if(no != null) {
		int reno = Integer.parseInt(no);
	
	//DAO, VO
		FkreviewDAO dao = new FkreviewDAO();
			
			dao.deleteOne(reno);
}
	response.sendRedirect("fkreview.jsp");
	
%>