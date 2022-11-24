<%@page import="oracle.net.ano.CryptoDataPacket"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
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
<link rel="shortcut icon" href="../images/mainlogo_footer.png">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>FRESHKIT</title>
<style>
 .review_box {
 		margin: 0px auto;
			/* 화면비율유지*/
	width: 960px;
	height: 100%;
 } 
.fkreview_wrap {margin-left:350px; margin-bottom:30px;}
.fkreview_wrap >img {width:300px; height: 400px; margin-right:250px; }
.title {
	margin-bottom: 50px;
	font-weight: bolder;
	width: 1000px;
	border-bottom: 4px solid #82ac64;
	padding: 20px 0px 36px;
	}
</style>

</head>

<body>
<jsp:include page="../main/header.jsp"/>
	
<br><br>
<%
	String cp = request.getParameter("cp");
	int currentPage = 0;
	//현재페이지
	
	if(cp != null) {
		currentPage = Integer.parseInt(cp);
	}else {
		currentPage = 1;
	}
	
	//한페이지당 게시물 수 8개씩 끊기
	int recoredPerPage = 8;
	
	//현재페이지 시작번호, 끝번호 계산
	int startNo = (currentPage -1)*recoredPerPage+1;
	int endNo = currentPage*recoredPerPage;
	
	//총게시물 수 알아오기
	FkreviewDAO dao = new FkreviewDAO();
	int totalCount = dao.getTotal();
	
	//총페이지
	int totalPage=
	(totalCount % recoredPerPage == 0)?totalCount/recoredPerPage : totalCount / recoredPerPage+1;
	
	int startPage = 1;
	int endPage = totalPage;
	
	if(currentPage <= 3) {
		startPage = 1;
	}else if(currentPage >= 4) {
		startPage = currentPage - 4;
	}
	if(totalPage - currentPage <= 3) {
		endPage = totalPage;
	}else if(totalPage - currentPage > 3) {
		if(currentPage <= 3) {
			if(totalPage>5) {
				endPage = 5;
			}else{
				endPage = totalPage;
			}
		}else{
			endPage = currentPage+4;
		}
	}
	
	boolean isPre = false;
	boolean isNext = false;
	
	if(currentPage-3 >= 0) {
		isPre = true;
	}
	if(currentPage +3 <= totalPage) {
		isNext = true;
	}
	
 
%>
	
		<div class="review_box">
			<h2 class="title">FreshKit 다양한 후기를 만나보세요!</h2>
			
		<table class="table table-sm">
	
			<tr>
				<th>리뷰번호</th>
				<th>아이디</th>
				<th>상품명</th>
				<th>작성일</th>
			</tr>
			
			<% 
			ArrayList<FkreviewVO> list = dao.selectAll(startNo,endNo);
			for(FkreviewVO vo : list){
				//날짜형식
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				
				FkcustomerDAO dao2 = new FkcustomerDAO();
				FkcustomerVO vo2 = dao2.selectOne(vo.getNo());
				
			%>
			<tr>
				<td><%=vo.getReno() %></td>
				<td><%=vo2.getId() %></td>
				<td><a href="fkdetail.jsp?reno=<%=vo.getReno()%>"><%=vo.getRetitle()%></a></td>
				<td><%= sdf.format(vo.getRedate()) %></td> 
			
			</tr>
			
		<%
		
			}
		%>

		<tr>
			<td colspan="4">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
			<%
			  		if(isPre) {
			%>
			    <li class="page-item disabled"><a class="page-link">Previous</a></li>
			<%
				}
			%>
			<%
				for(int i=startPage; i<=endPage; i++) {
			%>
			    <li class="page-item"><a class="page-link" href="fkreview.jsp?cp=<%=i%>"><%=i%></a></li>
			<%
				}
			%>
			<%
			  		if(isNext) {
			%>
			    <li class="page-item"><a class="page-link" href="#">Next</a></li>
			<%
				 }
			%>
					</ul>
				</nav>
			</td>
		</tr>
	 
		<tr>
			<td colspan="4">
			<a href="fkwrite.jsp"> 
			<input class="btn btn-primary" type="button" value="리뷰작성하기" /></a></td>
			
		</tr>
	</table>
	
		<div class="row">
			<form method="get" name="search" action="research.jsp">
				<table class="pull-right">
					<tr>
						
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="txt" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
		
	
	
	<div class="fk_sns">
		
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