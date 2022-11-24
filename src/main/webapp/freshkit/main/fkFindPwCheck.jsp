
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
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
	
    request.setCharacterEncoding("UTF-8");
    
    String name = request.getParameter("customername");
    String id = request.getParameter("customerid");
    String phone = request.getParameter("customerphone");
    
    FkcustomerDAO dao = new FkcustomerDAO();
    
    String fkpw = dao.findByPw(name, id, phone);
    
    if(fkpw!=null){
 %>
 	<script>
	alert("본인인증에 성공하셨습니다.!");
<%
	session.setAttribute("id", id);
%>
	location.href="fkpwrevise.jsp";
</script>
 
 <%   
    }else{
%>
<script>
	alert("다시한번 확인해주세요!");
	location.href="fkFindPw.jsp";
</script>    	
<%
    }
%>
</body>
</html>