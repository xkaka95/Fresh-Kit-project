<%@page import="kr.co.freshkit.vo.FkorderVO"%>
<%@page import="kr.co.freshkit.dao.FkorderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img {
		width: 200px;
		height: 200px;
	}
</style>
</head>
<body>
<table>

		<tr>
			<th>상품번호</th>
			<th>상품명</th>
		</tr>
		<%
		FkorderDAO dao = new FkorderDAO();
		ArrayList<FkorderVO> list = dao.selectAll();
		for (FkorderVO vo : list) {
		%>
		<tr>
			<td><%= vo.getOno() %></td>
			<td><%= vo.getOdate() %></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>