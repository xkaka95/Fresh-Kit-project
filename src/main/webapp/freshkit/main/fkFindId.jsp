<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FRESHKIT</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css only -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="shortcut icon" href="../images/mainlogo_footer.png">
<!-- javascript bundle with popper -->
<style>
button:active{
position:relative;
top:2px;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script type="text/javascript">
	function idSearch(){
		var name = document.getElementById("customername").value;
		var phone = document.getElementById("customerphone").value;
		
		if (name.length < 1) {
			alert("이름을 입력해주세요");
			return ;
		}

		if (phone.length != 11) {
			alert("연락처를 정확하게 입력해주세요");
			return ;
		}

		frm.method = "get";
		frm.action = "fkFindIdCheck.jsp";
		frm.submit();
	}
</script>
</head>
<body>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<!-- header끝 -->

<div style="margin-bottom: 130px; margin-top: 100px;">
<form action="" name="frm">
<div style="width: 50%; margin: auto; position: relative; top: 100;">
<div style="margin: auto;"><p style="font-weight: bold; font-size: 45px; text-align: center;">아이디 찾기</p></div>
	<div class="mb-3" style="margin: auto; position: relative; left: 100px;">
		<label for="exampleFormControlInput1" class="form-label">
			이름</label> <input type="text" class="form-control border border-2 rounded-start" value="" name="customername"
			id="customername" placeholder="이름을 입력하세요." style="width: 70%; padding-top:15px; padding-bottom:15px;">
	</div>
	<div class="mb-3" style="margin: auto; position: relative; left: 100px;">
		<label for="exampleFormControlTextarea1" class="form-label">연락처</label>
		<input type="text" class="form-control border border-2 rounded-start" maxlength="11" value="" id="customerphone" name="customerphone" placeholder="연락처를 입력하세요."
			style="width: 70%; padding-top:15px; padding-bottom:15px;" ></text>
	</div>
	<br>
	<button type="button" onclick="idSearch();" class="btn btn-outline-success" style="width: 70%; padding-top:20px; padding-bottom:20px; margin: auto; position: relative; 
	left: 100px; ">
	확인</button>
</div>
</form>
</div>

<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- footer끝 -->
</body>
</html>