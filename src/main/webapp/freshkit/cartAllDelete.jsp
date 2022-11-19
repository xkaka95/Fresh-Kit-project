<%@page import="kr.co.freshkit.dao.FkcartDAO"%>
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
		int no = 1; // 임시고객번호
		
		FkcartDAO dao = new FkcartDAO();
		
		dao.deleteAll(no);
		
		
	
	%>
		<script>
			alert("장바구니가 삭제되었습니다.");
			location.href= "fkviewcart.jsp";
		</script>
</body>
</html>