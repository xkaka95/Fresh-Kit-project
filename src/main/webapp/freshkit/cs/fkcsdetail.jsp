<%@page import="kr.co.freshkit.vo.FkreplyVO"%>
<%@page import="kr.co.freshkit.dao.FkreplyDAO"%>
<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
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

<script type="text/javascript">
	
</script>
<style>
.container {
	min-width: 1050px;
	margin-left: 270px;
	width: 1000px;
	margin-top: 50px;
	margin-bottom: 50px;
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

.admin_write {
	margin: 100px;
	margin-top: 200px;
}

.admin_write1 {
	margin-left: 100px;
	margin-right: 100px;
	margin-bottom: 50px;
	margin-top: 200px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


</head>
<body>

	<jsp:include page="../main/header.jsp" />


	<!-- fkqnadetail 관리자 -->
	<%
	FkcustomerVO person = (FkcustomerVO) session.getAttribute("vo");

	if (person == null) {
		response.sendRedirect("../main/fkLogin.jsp");
	} else {

		//System.out.println(person);
		//System.out.println(id);
		//System.out.println(pw);

		System.out.println(person.getGrade());
		System.out.println(person.getId());
	%>

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
							<label class="julltext1">제목</label>
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

					<%
					String replycontents = request.getParameter("replycontents");

					if (replycontents != null) {

						FkreplyDAO dao7 = new FkreplyDAO();

						dao7.insertOne2(replycontents, vo.getCsno());

						FkreplyVO vo7 = dao7.SelectOne2(vo.getCsno());
					%>

					<div class="admin_write1">
						<div class="jullad2">
							<label class="julltextad" id="recontentsad">관리자 답변</label>
						</div>
						<div class="jullad3">
							<div class="jullad4">
								<div class="jullad5">
									<input type="text" disabled="disabled"
										style="width: 450px; height: 150px;" name="" id=""
										value="<%=vo7.getAdcontents()%>" />

								</div>
							</div>
						</div>
					</div>

					<%
					} else {

					FkreplyDAO dao6 = new FkreplyDAO();

					FkreplyVO vo6 = dao6.SelectOne2(vo.getCsno());

					if (vo6 != null) {
					%>

					<div class="admin_write1">
						<div class="jullad2">
							<label class="julltextad" id="recontentsad">관리자 답변</label>
						</div>
						<div class="jullad3">
							<div class="jullad4">
								<div class="jullad5">
									<input type="text" disabled="disabled"
										style="width: 450px; height: 150px;" name="" id=""
										value="<%=vo6.getAdcontents()%>" />


								</div>
							</div>
						</div>
					</div>



					<%
					}
					}
					%>

					<div class="admin_write">
						<form action="" name="frm">
							<table class="table">
								<thead>
									<tr>
										<th scope="col" colspan="4">관리자 답변</th>

									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row"></th>
										<td colspan="4"><input type="text" autofocus="autofocus"
											style="width: 450px; height: 150px;" name="replycontents"
											id="" value="<%=vo.getCscontents()%>" /></td>
										<th scope="col" colspan="4"><input type="button"
											id="adminWrite" value="저장" class="btn btn-success" /></th>
										<th><input type="hidden" name="csno"
											value="<%=vo.getCsno()%>" /></th>
								</tbody>
							</table>
						</form>


					</div>


					<div class="btn">
						<a href="fkcs.jsp"><input type="button" value="목록"
							class="btn btn-success" /></a> <a
							href="fkcsmodify.jsp?csno=<%=vo.getCsno()%>"> <input
							type="button" value="수정" class="btn btn-primary" /></a>

						<%
						FkreplyDAO dao9 = new FkreplyDAO();

						FkreplyVO vo9 = dao9.SelectOne2(vo.getCsno());

						if (person.getId() != null && person.getGrade().equals("관리자") && vo9 == null) {
						%>


						<input type="button" value="삭제" class="btn btn-danger" /> <input
							type="button" value="답글" class="btn btn-warning"
							onclick="adminwrite();" />


						<%
						} else{
						%>
						<input type="button" value="삭제" class="btn btn-danger" />
						<%
						}
						%>

					</div>
				</div>

			</div>
			<%
			}

			}
			%>

		</div>

	</div>
	<script type="text/javascript">
		
	<%String num = request.getParameter("csno");
if (num != null) {
	int csno = Integer.parseInt(num);
	FkcsDAO dao = new FkcsDAO();
	FkcsVO vo = dao.selectOne(csno);%>
		$(function() {

			$(".admin_write").hide();

			$("#adminWrite").on("click", function() {
				console.log("haha");
				console.log(
	<%=vo.getCsno()%>
		)

				document.frm.action = "../cs/fkcsdetail.jsp";
				document.frm.method = "get";
				document.frm.submit();
			})

		});
	<%}%>
		function adminwrite() {
			$(".admin_write").show();

		}
	
	</script>



	<jsp:include page="../main/footer.jsp" />

</body>
</html>