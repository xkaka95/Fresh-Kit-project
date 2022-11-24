<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.co.freshkit.dao.FkcsDAO"%>
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@page import="kr.co.freshkit.vo.FkcsVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FRESHKIT</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	<link rel="shortcut icon" href="../images/mainlogo_footer.png">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap')
	;


.title {
	margin-left: 300px;
	font-weight: bolder;
	width: 1000px;
	border-bottom: 4px solid #82ac64;
	padding: 20px 0px 36px;
}

.container {
	margin-left: 300px;
	width: 1000px;
	margin-top: 50px;
	margin-bottom: 100px;
}

#btn1 {
	margin-left: 1190px;
}

a {
	text-decoration: none;
	color: black;
}
</style>
</head>


<body>

	<jsp:include page="../main/header.jsp" />

	<!-- fkqna -->
	
	<div class="cs_wrap">
		<h2 class="title">고객센터 QnA</h2>

		<div calss="write_btn">
			<a href="fkcswrite.jsp"> <input type="submit" value="1:1문의작성"
				class="btn btn-success" id="btn1" /></a>
		</div>

		<%
		String cp = request.getParameter("cp");
		int currentPage = 0;
		//현재페이지

		if (cp != null) {
			currentPage = Integer.parseInt(cp);
		} else {
			currentPage = 1;
		}

		//한페이지당 게시물 수
		int recoredPerPage = 5;

		//현재페이지 시작번호, 끝번호 계산
		int startNo = (currentPage - 1) * recoredPerPage + 1;
		int endNo = currentPage * recoredPerPage;

		//총게시물 수 알아오기
		FkcsDAO dao = new FkcsDAO();
		int totalCount = dao.getTotal();

		//총페이지
		int totalPage = (totalCount % recoredPerPage == 0) ? totalCount / recoredPerPage : totalCount / recoredPerPage + 1;

		int startPage = 1;
		int endPage = totalPage;

		if (currentPage <= 3) {
			startPage = 1;
		} else if (currentPage >= 4) {
			startPage = currentPage - 4;
		}
		if (totalPage - currentPage <= 3) {
			endPage = totalPage;
		} else if (totalPage - currentPage > 3) {
			if (currentPage <= 3) {
				if (totalPage > 5) {
			endPage = 5;
				} else {
			endPage = totalPage;
				}
			} else {
				endPage = currentPage + 4;
			}
		}

		boolean isPre = false;
		boolean isNext = false;

		if (currentPage - 3 >= 0) {
			isPre = true;
		}
		if (currentPage + 3 <= totalPage) {
			isNext = true;
		}
		%>

		<div class="container">
			<table class="table table-striped">
				<tr>
					<th>문의번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>작성자</th>
				</tr>

				<%
				ArrayList<FkcsVO> list = dao.selectAll(startNo, endNo);
				for (FkcsVO vo : list) {
					//날짜형식
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
					
					FkcustomerDAO dao2 = new FkcustomerDAO();
					FkcustomerVO vo2 = dao2.selectOne(vo.getNo());
				%>
				<tr>
					<td><%=vo.getCsno()%></td>
					<td><a href="fkcsdetail.jsp?csno=<%=vo.getCsno()%>"><%=vo.getCstitle()%></a></td>
					<td><%=sdf.format(vo.getCsdate())%></td>
					<td><%=vo2.getId()%></td>
				</tr>
				<%
				}
				%>
				<tr>
					<td colspan="4">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<%
								if (isPre) {
								%>
								<li class="page-item disabled"><a class="page-link">Previous</a></li>
								<%
								}
								%>
								<%
								for (int i = startPage; i <= endPage; i++) {
								%>
								<li class="page-item"><a class="page-link"
									href="fkcs.jsp?cp=<%=i%>"><%=i%></a></li>
								<%
								}
								%>
								<%
								if (isNext) {
								%>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
								<%
								}
								%>
							</ul>
						</nav>
					</td>
				</tr>

			</table>

		</div>


		<jsp:include page="../main/footer.jsp" />
		
</body>
</html>


