
<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = (String)session.getAttribute("id"); 
	//out.println(id);
    
	request.setCharacterEncoding("UTF-8");
    
    String pw = request.getParameter("customerpw");
    
    FkcustomerDAO dao = new FkcustomerDAO();
    
    FkcustomerVO vo = new FkcustomerVO(); 
    
    dao.pwRevise(pw,id);
    
    if(dao!=null){
 %>
 	<script>
	alert("비밀번호 수정이 완료되었습니다!");
	location.href="fkLogin.jsp";
	</script>
 <%   
    }else{
%>
	<script>
	alert("수정에 실패하셨습니다!");
	location.href="fkFindPw.jsp";
	</script>    	
<%
    }
%>