<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
	
	 
<style>
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

.jull2_3 {
	width: 100%;
	height: 46px;
	padding: 0px 11px 1px 15px;
	border-radius: 4px;
	border: 1px solid rgb(221, 221, 221);
	font-weight: 400;
	font-size: 16px;
	line-height: 1.5;
	color: rgb(51, 51, 51);
	outline: none;
	box-sizing: border-box;
}

.css-button {
	display: block;
	padding: 0px 10px;
	text-align: center;
	overflow: hidden;
	width: 100%;
	height: 46px;
	border-radius: 3px;
	color: yellowgreen;
	background-color: rgb(255, 255, 255);
	border: 1px solid yellowgreen;
}

.css-buttondiv {
	width: 100px;
	margin-left: 8px;
}

.css-buttontext {
	display: inline-block;
	font-size: 16px;
	font-weight: 500;
}

.joinbutton1 {
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	border-top: 1px solid rgb(247, 247, 247);
	padding: 40px 0px;
}

.joinbutton1-1 {
	display: block;
	padding: 0px 10px;
	text-align: center;
	overflow: hidden;
	width: 240px;
	height: 56px;
	border-radius: 3px;
	color: rgb(255, 255, 255);
	background-color: yellowgreen;
	border: 0px none;
}

.joinbutton1-2 {
	display: inline-block;
	font-size: 16px;
	font-weight: 500;
}

.container1 {
	min-width: 1050px;
	margin-top: 50px;
	margin-bottom: 60px;
	background-color: rgb(255, 255, 255);
}

.jointitle {
	margin-bottom: 50px;
	font-size: 28px;
	line-height: 35px;
	font-weight: 500;
	text-align: center;
	letter-spacing: -1px;
	color: rgb(51, 51, 51);
}

.container1-1 {
	width: 640px;
	margin: 0px auto;
}

.forredstar {
	padding-bottom: 10px;
	border-bottom: 2px solid rgb(51, 51, 51);
	font-size: 12px;
	color: rgb(102, 102, 102);
	line-height: 17px;
	text-align: right;
}
button:active {
position: relative;
top: 2px;
}
button:hover {
background: #318F23;
}

</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript">
function checkForm(x){
	    
    var id = document.getElementById("customerid").value;
    var regid = /^[a-z]+[a-z0-9]{5,19}$/g;
    var pw = document.getElementById("customerpw").value;
    var regpw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
    var repw = document.getElementById("customerrepw").value;
    var name = document.getElementById("customername").value;
    var regname = /^[가-힣]+$/;
    var male = document.getElementById("customermale").checked;
    var female = document.getElementById("customerfemale").checked;
    var phone = document.getElementById("customerphone").value;
    var post = document.getElementById("customerpost").value;
    var addr = document.getElementById("customeraddr").value;
    var addrdetail = document.getElementById("customeraddrdetail").value;
    var email = document.getElementById("customeremail").value;
    var agree1 = document.getElementById("agree1");
    var agree2 = document.getElementById("agree2");
    var agree3 = document.getElementById("agree3");
    var agree4 = document.getElementById("agree4");
    
    if(id==''){
        alert("아이디를 입력하세요.");
        
        return ;
    }else if(!regid.test(id)){
            alert("아이디는 영문으로 시작해 6~20자의 영문자 또는 숫자이어야 합니다.");
        return ;
    }else if(pw==''){
        alert("비밀번호를 입력하세요.");
       
        return ;
    }else if(pw.length<=7 || pw.length>=16){
        alert("패스워드의 길이는 8자 이상, 16자리 이하여야 합니다.");
        pw='';
        
        return ;
    }else if(!regpw.test(pw)){
        alert("패스워드는 영문과 숫자 및 특수문자를 조합해서 사용해야 합니다.");
        pw='';
        
        return ;    
    }else if(repw==''){
        alert("비밀번호확인란을 입력하세요.");
        
        return ;
    }else if(pw!=repw){
        alert("비밀번호가 일치하지 않습니다.");
        pw='';
        repw='';
        
        return ;    
    }else if(name==''){
        alert("이름을 입력하세요.");
        
        return ;
    }else if(!regname.test(name)){
        alert("이름은 한글로 입력하세요.");
        
        return ;
    }else if(!male && !female){
        alert("성별을 선택하세요.");
        
        return ;
    
    }else if(phone==''){
        alert("연락처를 입력하세요.");
        
        return ;
    }else if(phone.length!=11){
        alert("연락처를 다시한번 확인해주세요.");
        phone="";
        
        return ;
    }else if(post==''){
        alert("주소를 입력하세요");
        
        return ;
    }else if(addr==''){
        alert("주소를 입력하세요");
        
        return ;
    }else if(addrdetail==''){
        alert("주소를 입력하세요");
        
        return ;
    }else if(email==''){
        alert("이메일을 입력하세요.");
        
        return ;    
    }else if(email.indexOf('@')==-1){
        alert("이메일 형식이 아닙니다.")
        email='';
        
        return ;
    }else if(!agree1.checked){
        alert("약관 동의를 체크하세요.");
        
        return ;
    }else if(!agree2.checked){
        alert("약관 동의를 체크하세요.");
        
        return ;
    }else if(!agree3.checked){
        alert("약관 동의를 체크하세요.");
        
        return ;
    }else if(!agree4.checked){
        alert("약관 동의를 체크하세요.");
        
        return ;
    }else{
    	alert("가입 축하드립니다");
    	x.form.action="fkJoinOk.jsp";
        
        x.form.method="post";
        
        
        x.form.submit();
    }
    
   
            
    
    
}


$(function(){
	$("#btncheck").on("click",fkCheckup);
	$("#btncheck2").on("click",fkCheckup2);
	$("#btncheck3").on("click",fkCheckup3);	
	
	});


	
		
		 function fkCheckup(){
		    	
		    	var txt = $("#customerid").val().trim();
		    	var regid = /^[a-z]+[a-z0-9]{5,19}$/g;		    	
		    	if(txt==''){
					alert('아이디를 입력해주세요.');
					return ;
		    	}else if(!regid.test(txt)){
		            alert("아이디는 영문으로 시작해 6~20자의 영문자 또는 숫자이어야 합니다.");
		            return ;
		    	}
		    	var params = "customerid="+txt;
		    	
		    	
		    	sendRequest("fkIdCheck.jsp",params,callback,"GET");
		    	
		        	
		    	
		    }
		 
		    function callback(){
		    	
		    	if(xhr.readyState==4 && xhr.status==200){
		    		var msg = xhr.responseText.trim(); 
		    		
		    		if(msg=="1"){
		    			
		    			alert("이 아이디는 사용할 수 없습니다.");
		    		}else{
		    			
		    			alert("사용 가능한 아이디입니다.");
		    		}
		    		
		    	}
		    }
		    
		    
				function fkCheckup2(){
		    	
		    	var txt = $("#customerphone").val().trim();
		    	
		    	
		    	if(txt==''){
					alert('연락처를 입력해주세요.');
					return ;
		    	}else if(txt.length!=11){
		            alert("연락처를 확인해주세요.");
		            return ;
		    	}
		    	var params = "customerphone="+txt;
		    	
		    	
		    	sendRequest("fkPhoneCheck.jsp",params,callback2,"GET");
		    	
		        	
		    	
		    }
		 
		    function callback2(){
		    	
		    	if(xhr.readyState==4 && xhr.status==200){
		    		var msg = xhr.responseText.trim(); 
		    		
		    		if(msg=="true"){
		    			
		    			alert("이미 등록된 번호입니다.");
		    		}else{
		    			
		    			alert("사용 가능한 번호입니다.");
		    		}
		    		
		    	}
		    }
		    
			function fkCheckup3(){
		    	
		    	var txt = $("#customeremail").val().trim();
		    	
		    	
		    	if(txt==''){
					alert('이메일을 입력해주세요.');
					return ;
		    	}else if(txt.indexOf('@')==-1){
		            alert("이메일 형식이 아닙니다.")
		            email='';
		            
		            return ;
		    	}
		    	
		    	var params = "customeremail="+txt;
		    	
		    	
		    	sendRequest("fkEmailCheck.jsp",params,callback3,"GET");
		    	
		        	
		    	
		    }
		 
		    function callback3(){
		    	
		    	if(xhr.readyState==4 && xhr.status==200){
		    		var msg = xhr.responseText.trim(); 
		    		
		    		if(msg=="true"){
		    			
		    			alert("이미 등록된 이메일입니다.");
		    		}else{
		    			
		    			alert("사용 가능한 이메일입니다.");
		    		}
		    		
		    	}
		    }
		    
		    
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('customerpost').value = data.zonecode;
		                document.getElementById('customeraddr').value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("customeraddrdetail").focus();
		            }
		        }).open();
		    }
		
function cancle(){
	location.href="fkLogin.jsp";
}



</script>
</head>
<body>
<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<!-- header끝 -->

	<div class="container1">
		<div class="jointitle">회원가입</div>
		<div class="container1-1">
			<div class="forredstar">
				<span style="color: red;">*</span> 필수입력사항
			</div>
			<div style="padding: 0px; width: 620px;">
				<form action="" method="" >
				<div class="jull">
					<div class="jull1">
						<label class="julltext1">아이디</label> <span style="color: red;">*</span>
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
								<input data-testid="input-box" id="customerid" name="customerid"
									placeholder="아이디를 입력해주세요" type="text" required="" autofocus="autofocus"
									class="jull2_3" value="">
							</div>
						</div>
					</div>
					<div class="css-buttondiv">
						<button class="css-button" type="button" id="btncheck" >
							<span class="css-buttontext">중복확인</span>
						</button>
						
					</div>
				</div>


				<div class="jull">
					<div class="jull1">
						<label class="julltext1">비밀번호</label> <span style="color: red;">*</span>
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
								<input data-testid="input-box" id="customerpw" name="customerpw"
									placeholder="비밀번호를 입력해주세요" type="password" required
									class="jull2_3" value="">
							</div>
						</div>
					</div>
				</div>




				<div class="jull">
					<div class="jull1">
						<label class="julltext1">비밀번호 확인</label> <span style="color: red;">*</span>
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
								<input data-testid="input-box" id="customerrepw" name="customerrepw"
									placeholder="한번 더 입력해주세요" type="password" required
									class="jull2_3" value="">
							</div>
						</div>
					</div>
				</div>


				<div class="jull">
					<div class="jull1">
						<label class="julltext1">이름</label> <span style="color: red;">*</span>
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
								<input data-testid="input-box" id="customername" name="customername"
									placeholder="이름을 입력해주세요" type="text" required
									class="jull2_3" value="">
							</div>
						</div>
					</div>
				</div>

				<div class="jull">
					<div class="jull1">
						<label class="julltext1">성별</label> <span style="color: red;">*</span>
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2" style="margin-top: 12px;">
								<input type="radio" name="customergender" id="customermale" value="남" required >남 <input
									type="radio" name="customergender" id="customerfemale" value="여" required
									style="margin-left: 15px;">여
							</div>
						</div>
					</div>
				</div>

				<div class="jull">
					<div class="jull1">
						<label class="julltext1">연락처</label> <span style="color: red;">*</span>
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
								<input data-testid="input-box" id="customerphone" name="customerphone"
									placeholder="-없이 숫자만 입력하세요." type="text" required
									class="jull2_3" value="" maxlength="11">
							</div>
						</div>
					</div>
					<div class="css-buttondiv">
						<button class="css-button" type="button" id="btncheck2">
							<span class="css-buttontext">인증</span>
						</button>
					</div>
				</div>

				<div class="jull">
					<div class="jull1">
						<label class="julltext1">주소</label> <span style="color: red;">*</span>
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
								<input data-testid="input-box" id="customerpost" name="customerpost"
									placeholder="우편번호" type="text" class="jull2_3" required
									value="" style="width: 300px;">
							</div>
						</div>
					</div>
					<div class="css-buttondiv">
						<button class="css-button" type="button" onclick="sample6_execDaumPostcode()">
							<span class="css-buttontext">검색</span>
						</button>
					</div>

				</div>

				<div class="jull2_1">
					<div class="jull2_2">
						<input data-testid="input-box" id="customeraddr" name="customeraddr"
							 placeholder="주소를 검색해주세요" type="text" required
							class="jull2_3" style="width: 370px; margin-left: 160px;"
							value="">
					</div>
				</div>
				
				<div class="jull2_1">
					<div class="jull2_2">
						<input data-testid="input-box" id="customeraddrdetail" name="customeraddrdetail"
							placeholder="상세주소를 입력해주세요" type="text" required
							class="jull2_3" style="width: 370px; margin-left: 160px;"
							value="">
					</div>
				</div>
				
				<div class="jull2_1">
					<div class="jull2_2">
						<input data-testid="input-box" id="sample6_extraAddress" name="sample6_extraAddress"
							placeholder="참고항목" type="text" 
							class="jull2_3" style="width: 370px; margin-left: 160px;"
							value="">
					</div>
				</div>

				<div class="jull">
					<div class="jull1">
						<label class="julltext1">이메일</label> <span style="color: red;">*</span>
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
								<input data-testid="input-box" id="customeremail" name="customeremail"
									placeholder="본인 이메일을 입력해주세요" type="text" required
									class="jull2_3" value="">
							</div>
						</div>
					</div>
					<div class="css-buttondiv">
						<button class="css-button" type="button" id="btncheck3">
							<span class="css-buttontext">중복확인</span>
						</button>
					</div>
				</div>
				<br> <br> <br>
				<div class="jull" style="border: 1px solid yellowgreen;">

					<div class="jull2">
						<div class="jull2_1">
							<span class="jull2_2"
								style="margin-top: 20px; font-size: 20px; font-weight: bold; font-family: 'Do Hyeon', sans-serif;">
								> 쇼핑몰 이용약관 </span> <span style="float: right;"> <input
								type="radio" name="agree1" value="" id="agree1" required >동의합니다
							</span>
						</div>
					</div>
				</div>
				<br> <br>


				<div class="jull" style="border: 1px solid yellowgreen;">

					<div class="jull2">
						<div class="jull2_1">
							<span class="jull2_2"
								style="margin-top: 20px; font-size: 20px; font-weight: bold; font-family: 'Do Hyeon', sans-serif;">
								> 개인정보 수집 항목 및 목적 </span> <span style="float: right;"> <input
								type="radio" name="agree2" value="" id="agree2" required >동의합니다
							</span>
						</div>
					</div>
				</div>
				<br> <br>

				<div class="jull" style="border: 1px solid yellowgreen;">

					<div class="jull2">
						<div class="jull2_1">
							<span class="jull2_2"
								style="margin-top: 20px; font-size: 20px; font-weight: bold; font-family: 'Do Hyeon', sans-serif;">
								> 개인정보 보유 및 이용기간 </span> <span style="float: right;"> <input
								type="radio" name="agree3" value="" id="agree3" required >동의합니다
							</span>
						</div>
					</div>
				</div>
				<br> <br>

				<div class="jull" style="border: 1px solid yellowgreen;">

					<div class="jull2">
						<div class="jull2_1">
							<span class="jull2_2"
								style="margin-top: 20px; font-size: 20px; font-weight: bold; font-family: 'Do Hyeon', sans-serif;">
								> 개인정보 제 3자 제공동의 </span> <span style="float: right;"> <input
								type="radio" name="agree4" value="" id="agree4" required >동의합니다
							</span>
						</div>
					</div>
				</div>

				<div class="joinbutton1">
					<button class="joinbutton1-1"  width="240" height="56"
						radius="3" onclick="checkForm(this);">
						<span class="joinbutton1-2">가입하기</span>
					</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="joinbutton1-1"  width="240" height="56"
						radius="3" onclick="cancle();">
						<span class="joinbutton1-2">취소하기</span>
					</button>
				</div>

				</form>
			</div>
		</div>
	</div>
	
<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- footer끝 -->	
	
</body>
</html>