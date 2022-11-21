<%@page import="kr.co.freshkit.vo.FkcsVO"%>
<%@page import="kr.co.freshkit.dao.FkcsDAO"%>
<%@page import="kr.co.freshkit.vo.FkreviewVO"%>
<%@page import="kr.co.freshkit.dao.FkreviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fkqnadetail.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
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

.container {
	min-width: 1050px;
	margin-left: 270px;
	width: 1000px;
	margin-top: 50px;
	margin-bottom: 100px;
}

.cs_wrap {
	margin-bottom: 100px;
}

.title {
	margin-left: 300px;
	font-weight: bolder;
	width: 1000px;
	border-bottom: 4px solid #82ac64;
	padding: 20px 0px 36px;
}

.jull {
	display: inline-flex;
	width: 100%;
	padding: 10px 20px;
}

.jull1 {
	width: 139px;
	padding-top: 12px;
}

.julltext1 {
	font-weight: 500;
	color: rgb(51, 51, 51);
	line-height: 20px;
}

.jull2 {
	flex: 1 1 0%;
}

.jull2_1 {
	padding-bottom: 0px;
}

.jull2_2 {
	position: relative;
	height: 48px;
}

.btn {
	margin-top: 100px;
}
</style>

</head>
<body>

	<jsp:include page="../main/header.jsp" />


	<!-- fkqnadetail -->

	<div class="cs_wrap">
		<h2 class="title">MY QnA</h2>


		<%
		String num = request.getParameter("csno");
		if (num != null) {
			int csno = Integer.parseInt(num);
			FkcsDAO dao = new FkcsDAO();
			FkcsVO vo = dao.selectOne(csno);
		%>

		<div class="container">

			<div style="padding: 0px; width: 820px;">
				<form action="fkcswriteOk.jsp" method="post">

					<div id="rating">
						<div class="jull">
							<div class="jull1">
								<label class="julltext1">고객번호</label>
							</div>
							<div class="jull2">
								<div class="jull2_1">
									<div class="jull2_2">
										<input type="text" disabled="disabled"
											style="width: 450px; height: 50px;" name="no" id=""
											value="<%=vo.getNo()%>" />

									</div>
								</div>
							</div>

						</div>


						<div class="jull">
							<div class="jull1">
								<label class="julltext1">제목(상품명)</label>
							</div>
							<div class="jull2">
								<div class="jull2_1">
									<div class="jull2_2">
										<input type="text" disabled="disabled"
											style="width: 450px; height: 50px;" name="retitle" id=""
											value="<%=vo.getCstitle()%>" />

									</div>
								</div>
							</div>
						</div>


						<div class="jull">
							<div class="jull1">
								<label class="julltext1" id="recontents">내용</label>
							</div>
							<div class="jull2">
								<div class="jull2_1">
									<div class="jull2_2">
										<input type="text" disabled="disabled"
											style="width: 450px; height: 200px;" name="recontents" id=""
											value="<%=vo.getCscontents()%>" />

									</div>
								</div>
							</div>
						</div>



						<div class="btn">
							<a href="fkcs.jsp"><input type="button" value="목록"
								class="btn btn-success" /></a> <a
								href="fkcsmodify.jsp?csno=<%=vo.getCsno()%>"><input
								type="button" value="수정" class="btn btn-primary" /></a> <a
								href="fkcsdeleteOk.jsp?csno=<%=vo.getCsno()%>"><input
								type="button" value="삭제" class="btn btn-danger" /></a>
						</div>
					</div>
				</form>
			</div>
			<%
			}
			%>
		</div>

	</div>

	<jsp:include page="../main/footer.jsp" />

</body>
</html>