
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
    request.setCharacterEncoding("UTF-8");
    
    String name = request.getParameter("customername");
    String phone = request.getParameter("customerphone");
    
    FkcustomerDAO dao = new FkcustomerDAO();
    
    String fkid = dao.findById(name, phone);
    
    if(fkid!=null){
 %>
 <script>
 	alert("회원님의 아이디는 <%= fkid %> 입니다");
 	location.href="fkLogin.jsp";
 </script>
 <%   
    }else{
%>
<script>
	alert("가입된 아이디가 없습니다!");
	location.href="fkFindId.jsp";
</script>    	
<%
    }
%>
