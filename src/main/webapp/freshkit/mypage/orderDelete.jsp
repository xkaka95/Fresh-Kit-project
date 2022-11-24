<%@page import="kr.co.freshkit.dao.FkorderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String ono = request.getParameter("ono");
		
		FkorderDAO dao = new FkorderDAO();
		
		dao.deleteOne(ono);
		
		
		response.sendRedirect("orderList.jsp");
	%>

		
</body>
</html>