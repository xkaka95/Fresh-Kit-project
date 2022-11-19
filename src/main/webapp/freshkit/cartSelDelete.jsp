<%@page import="java.util.List"%>
<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
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
	
		int no = 1; // 임시 고객번호
	
		String[] ppno = request.getParameterValues("pno"); // pno값 배열로 받아오기
		
		int pno[] = new int[ppno.length]; // int값 배열 선언
		
		for(int i=0; i<ppno.length; i++){ // 형변환
			pno[i] = Integer.parseInt(ppno[i]);
		}
		
		
		FkcartDAO dao = new FkcartDAO(); // dao 선언
		
		for(int i=0; i<pno.length; i++){ // 반복문으로 dao.deleteOne2 여러번 실행
			
			dao.deleteOne2(pno[i], no);
			
		}
	
	%>
		<script>
				location.href= "fkviewcart.jsp";
		</script>

</body>
</html>