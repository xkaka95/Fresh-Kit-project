<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
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
	/* 로그인정보 가져오기 ------------------------------------- */
	Object obj = session.getAttribute("vo");
	
	int no = 0;
	
	if(obj == null){
		response.sendRedirect("../fklogin.jsp");
	}else{
	
	FkcustomerVO vo5 = (FkcustomerVO)obj;
	no = vo5.getNo();
	}
	/* ------------------------------------ */
		
		FkcartDAO dao = new FkcartDAO();
		
		dao.deleteAll(no);
		
		
	
	%>
		<script>
			alert("장바구니가 삭제되었습니다.");
			location.href= "fkviewcart.jsp";
		</script>
</body>
</html>