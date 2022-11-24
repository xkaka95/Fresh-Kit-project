<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FRESHKIT</title>
<style>
button:active{
position:relative;
top:2px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css only -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="shortcut icon" href="../images/mainlogo_footer.png">
<!-- javascript bundle with popper -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">
function pwModify(){
	var pw = document.getElementById("customerpw").value;
	var pw2 = document.getElementById("customerpw2").value;
	var regpw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
	
	if (pw.length < 1) {
		alert("비밀번호를 입력해주세요.");
		return ;
	}
	if (pw != pw2) {
		alert("비밀번호가 일치하지 않습니다.");
		return ;
	}

	if (pw.length <= 7 || pw.length >=17) {
		alert("비밀번호는 8자이상 16자리 이하여야 합니다.");
		return ;
	}
	if(!regpw.test(pw)){
        alert("패스워드는 영문과 숫자 및 특수문자를 조합해서 사용해야 합니다.");
               
        return ;
	}
	frm.method = "get";
	frm.action = "fkpwreviseCheck.jsp";
	frm.submit();
}
</script>	
    
</head>

<body>
	<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<!-- header끝 -->

<div style="margin-bottom: 130px; margin-top: 100px;">
<form action="" name="frm" >
	<div style="width: 50%; margin: auto; position: relative; top: 100;">
<div style="margin: auto;"><p style="font-weight: bold; font-size: 45px; text-align: center;">비밀번호 수정</p></div>
	<div class="mb-3" style="margin: auto; position: relative; left: 100px;">
		<label for="exampleFormControlInput1" class="form-label">
			비밀번호</label> <input type="password" class="form-control border border-2 rounded-start"
			id="customerpw" name="customerpw" placeholder="새로운 비밀번호를 입력하세요." style="width: 70%; padding-top:15px; padding-bottom:15px;">
	</div>
	<div class="mb-3" style="margin: auto; position: relative; left: 100px;">
		<label for="exampleFormControlTextarea1" class="form-label">비밀번호 확인</label>
		<input type="password" class="form-control border border-2 rounded-start" id="customerpw2" placeholder="한번 더 입력하세요."
			style="width: 70%; padding-top:15px; padding-bottom:15px;" ></text>
	</div>
	<br>
	<button type="button" onclick="pwModify();"class="btn btn-outline-success" style="width: 70%; padding-top:20px; padding-bottom:20px; margin: auto; position: relative; left: 100px;">확인</button>
</div>
</form>
     </div>       
            
<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- footer끝 -->            
            

</body>
</html>