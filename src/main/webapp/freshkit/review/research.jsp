<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.freshkit.vo.FkreviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.freshkit.dao.FkreviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>research</title>
<style>
.review_box {margin-left:300px; width:1000px;}
.fkreview_wrap {margin-left:350px; margin-bottom:30px;}
.fkreview_wrap >img {width:300px; height: 400px; margin-right:250px;}
</style>

</head>

<body>
<jsp:include page="../main/header.jsp"/>
	
<br><br>

	
		<div class="review_box">
	
		<table class="table table-sm">
	
			<tr>
				<th>리뷰번호</th>
				<th>고객번호</th>
				<th>Product</th>
				<th>Date</th>
			</tr>
			
			<% 
			FkreviewDAO dao2 = new FkreviewDAO();
			System.out.println(request.getParameter("searchText"));
			ArrayList<FkreviewVO> list2 = dao2.reSearch(request.getParameter("searchText"));
			System.out.println(list2);
			for (FkreviewVO vo2 : list2) {
				
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			%>
			<tr>
				<td><%=vo2.getReno() %></td>
				<td><%=vo2.getNo() %></td>
				<td><a href="fkdetail.jsp?reno=<%=vo2.getReno()%>"><%=vo2.getRetitle()%></a></td>
				<td><%= sdf.format(vo2.getRedate()) %></td>
		
			</tr>
			
		<%
			}
		%>

	
	 
		<tr>
			<td colspan="4">
			<a href="fkwrite.jsp"> 
			<input class="btn btn-primary" type="button" value="리뷰작성하기" /></a></td>
			
		</tr>
	</table>
	

	
		<div class="row">
			<form method="get" name="search" action="research.jsp">
				<table class="pull-right">
					<tr >
						<td><select class="form-control" name="searchField" >
								<option value="retitle">상품명</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	
	
	
	<br><br><br>
	<div class="fk_sns">
		<div class="h4 pb-2 mb-4 text-success border-bottom border-success"></div>
			<div>
				<div class="fkreview_wrap">
				<img src="../images/re1.jpg" alt="" />
				<img src="../images/re2.jpg" alt="" />
			</div>
		</div>
	</div>
		

	<jsp:include page="../main/footer.jsp"/>

</body>
</html>