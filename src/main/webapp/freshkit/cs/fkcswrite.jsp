<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@page import="kr.co.freshkit.vo.FkcsVO"%>
<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fkcswrite.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous">

$(function(){
	
	 $('#summernote').summernote();
	 
})
	</script>
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


</style>
</head>


<body>

	<jsp:include page="../main/header.jsp" />
 	
 	<!-- fkcswrite -->
 	
	<div class="cs_wrap">
		<h2 class="title">1:1 문의작성</h2>
		

<div class="container">
	<form action="fkcswriteOk.jsp" method="post">
		<table class="table table-striped">
		<%
		/* 로그인정보 가져오기 ------------------------------------- */
		Object obj = session.getAttribute("vo");
		
		int no = 0;
		
		if(obj == null){
			response.sendRedirect("../main/fkLogin.jsp");
		}else{
		
		FkcustomerVO vo5 = (FkcustomerVO)obj;
		no = vo5.getNo();
		
		FkcustomerDAO dao2 = new FkcustomerDAO(); // fkcustomer 테이블에 fkreview테이블에서 가져온 vo값 넣기
		FkcustomerVO vo2 = dao2.selectOne(vo5.getNo());
		/* ------------------------------------ */
		%>
			<tr>
				<th>아이디</th>
				<td>
				<input type="text" autofocus="autofocus" name="id" id="" value="<%=vo2.getId() %>" style="border:none;" readonly />
				<input type="hidden" name="no" id="no" value="<%=vo2.getNo() %>" />
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="cstitle" id="" /></td>
			</tr>
			<tr>
				<th>문의내용</th>
				<td><textarea id="summernote" rows="20" cols="80" name="cscontents"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="fkcs.jsp"><input type="button" value="목록" class="btn btn-success"/></a>
					<input type="submit" value="작성" class="btn btn-primary"/>				
				</td>
			</tr>
		</table>
	</form>
</div>
<%
		}
%>
	</div>

		<jsp:include page="../main/footer.jsp" />
		
</body>
</html>


