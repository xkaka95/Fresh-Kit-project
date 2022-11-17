<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
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
			<th>가격</th>
			<th>이미지1</th>
			<th>이미지2</th>
			<th>할인율</th>
			<th>분류번호</th>
		</tr>
		<%
		FkproductDAO dao = new FkproductDAO();
		ArrayList<FkproductVO> list = dao.selectAll();
		for (FkproductVO vo : list) {
		%>
		<tr>
			<td><%= vo.getPno() %></td>
			<td><%= vo.getPname() %></td>
			<td><%= vo.getPrice() %></td>
			<td><img src="<%= vo.getPimg1() %>" alt="" /></td>
			<td><img src="<%= vo.getPimg2() %>" alt="" /></td>
			<td><%= vo.getDcratio() %></td>
			<td><%= vo.getHsno() %></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>