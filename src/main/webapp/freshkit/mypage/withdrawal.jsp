<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FRESHKIT</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../css/header.css">
	<link rel="stylesheet" href="../css/footer.css">
	<link rel="shortcut icon" href="../images/mainlogo_footer.png">
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap');

		body {
			height: 1015px;
		}
		#footer{
		clear: both;}

		#side1 {
	background-color: #d9ffb2;
	width: 300px;
	height: 100%;
	min-height: 1500px;
	float: left;
	font-family: 'Noto Sans KR', sans-serif;
	clear: both;
	
}

#side1>p {
	padding-bottom: 10px;
	padding-left: 10px;
	margin-left: 20px;
	margin-bottom: 5px;
}

		#header{

			font-family: 'Noto Sans KR', sans-serif;
		}
		#p1 {
			height: 50px;
			font-size: 35px;
			font-weight: 600px;
			padding-left: 10px;
		}
		#p2 {
			font-size: 35px;
			font-weight: 600px;
			padding-left: 350px;
		}
		#header>ul {
			padding-left: 0px;

		}
		#contents {
			height: 100%;
			min-height: 1025px;
			font-family: 'Noto Sans KR', sans-serif;
		}

		a { text-decoration: none; color: black; }
		a:visited { text-decoration: none; }
		a:hover { text-decoration: none; }
		a:focus { text-decoration: none; }
		a:hover, a:active { text-decoration: none; }

		#contents>form>table {
			width: 400px;
			height: 100px;
			position: absolute;
			top: 400px;
			left: 700px;
		}

		#tr1>td {
			height: 20px;
		}

		#quit {
			width: 140px;
			height: 35px;
			position: absolute;
			top: 550px;
			left: 850px;
			font-family: 'Noto Sans KR', sans-serif;
			font-size: 15px;
			padding: 0px;
			border: 0px;
		}

		footer {
			height: 290px;
			background-color: blanchedalmond;
		}
		
		#quitSuccess {
			position: absolute;
			top: 500px;
			left: 700px;
			font-size: 35px;
		}
	</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	 
	 $(function(){
	 	$("#quit").on("click",function(){

		    	if($.trim($("#id").val())==''){
			      	alert("ID를 입력해주세요.");
			      	return false;
		    	}else if($.trim($("#pw").val())=='') {
		    		alert("비밀번호를 입력해주세요.");
		    		return false;
		    	}
		    	$("#next_form").submit();
		  	})
	 })
</script>
</head>

<body>
	<jsp:include page="../main/header.jsp"/>
	
	<div id="container">
	
		<jsp:include page="sidebar1.jsp"/>
		
		<div id="contents">
			<br><br>
			<p id="p2">회원탈퇴</p>

			<form action="withdrawalOk.jsp" id="next_form" method="post">
			<table class="table table-borderless">
				<tr id="tr1">
					<td>아이디 : </td>
					<td><input type="text" name="id" id="id"></td>
				</tr>
				<tr id="tr2">
					<td>비밀번호 : </td>
					<td><input type="password" name="pw" id="pw"></td>
				</tr>
			</table>
			
			<input type="button" class="btn btn-dark" value="회원탈퇴 완료" name="quit" id="quit" size="100%">

			</form>
		</div>

	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>

</html>