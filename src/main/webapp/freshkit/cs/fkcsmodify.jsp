<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@page import="kr.co.freshkit.dao.FkcsDAO"%>
<%@page import="kr.co.freshkit.vo.FkcsVO"%>
<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("csno");
	if (num != null) {
		int csno = Integer.parseInt(num);
		FkcsDAO dao = new FkcsDAO();
		FkcsVO vo = dao.selectOne(csno);
	
		FkcustomerDAO dao2 = new FkcustomerDAO(); // fkcustomer 테이블에 fkreview테이블에서 가져온 vo값 넣기
		FkcustomerVO vo2 = dao2.selectOne(vo.getNo());
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fkqnamodify.jsp</title>
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
	
.cs_wrap{
	margin-bottom: 100px;
}
.title {
	margin-left: 300px;
	font-weight: bolder;
	width: 1000px;
	border-bottom: 4px solid #82ac64;
	padding: 20px 0px 36px;
}
.table{
	margin-left: 190px;
	width: 1000px;
}
.container{
	margin-left: 100px;
	width: 1000px;
	margin-top: 50px;
	margin-bottom: 100px;
}

</style>
<script src="../lang/summernote-ko-KR.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){

		$('#summernote').summernote({
			lang : "ko-KR"
		});

	});
	
window.onload=function(){
	
	var userid = '<%=vo2.getId()%>'
	var id = '<%=(String)session.getAttribute("id")%>'
	console.log(userid);
	console.log(id);
	if(userid!=id){
		alert("본인이 쓴 글만 접근하실 수 있습니다.");
		location.href="fkcs.jsp";
	}
}
</script>


</head>


<body>

	<jsp:include page="../main/header.jsp" />
 	
 	
	
		
		
		
		
	<div class="cs_wrap">
		<h2 class="title">MY QnA 수정</h2>
		
		
			<div class="container">
				<form action="fkcsmodifyOk.jsp" method="get">
					<table class="table table-striped">
						<tr>
							<th>문의번호</th>
							<td>
							<input type="hidden" name="csno" value="<%=vo.getCsno() %>" />
							<input type="text" disabled="disabled" name="csno" id="" value="<%=vo.getCsno()%>" />
							</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>
							<input type="hidden" name="no" value="<%=vo.getNo() %>" />
							<input type="hidden" name="csno" value="<%=vo.getCsno() %>" />
							<input type="text" disabled="disabled" name="no" id="" value="<%=vo2.getId() %>" />
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="cstitle" id="" value="<%=vo.getCstitle()%>"/></td>
						</tr>
						<tr>
							<th>문의내용</th>
							<td><textarea id="summernote" rows="20" cols="80" name="cscontents"><%=vo.getCscontents()%></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="fkcs.jsp"><input type="button" value="목록" class="btn btn-success"/></a>
								
								<input type="submit" value="수정완료" class="btn btn-primary"/>		
							</td>
						</tr>
					</table>
				</form>
			</div>
	</div>
<%
	}

	
%>

	<jsp:include page="../main/footer.jsp" />
	
</body>
</html>
