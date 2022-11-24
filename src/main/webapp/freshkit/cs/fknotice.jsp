<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FRESHKIT</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<link rel="shortcut icon" href="../images/mainlogo_footer.png">
	
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap');

		
		.cs_wrap {
			margin: 0px auto;
			/* 화면비율유지*/
	width: 960px;
	height: 100%;
	margin: 0 auto;
			
		}
		
		.tabs{
			display: block;
			height: 49px;
			padding: 13px 16px 0;
			color: green;
			font-weight: 500;
			font-size: 16px;
			line-height: 24px;
			float: left;
			
			width: 300px;
		}  
		.notice{
			float:left;
			padding-right: 15px;
		}
	
		
		
		.title {
			margin: 0px auto;
			font-weight: bolder;
			width: 1000px;
			border-bottom: 4px solid #82ac64;
			padding: 20px 0px 36px;
		}
		
		.accordion {
			margin: 0px auto; 
			height: 1000px;
			width: 1000px;
		}
		
		.accordion .fkcs_box {
			margin-top: 80px;
			margin-bottom: 50px;
		
		}
		
		

</style>
</head>

<body>

	<jsp:include page="../main/header.jsp"/>


	<div class="cs_wrap">
		<h2 class="title">공지사항</h2>
		
		<div calss="tab_wrap">
			<ul class="tabs">
				<li>
					<a href="../cs/fknotice.jsp">
						
						<span class="notice">공지사항</span>
						<em class="hide">선택됨</em>
						
					</a>
				</li>
				
				<li class="on">
				 	<a href="../cs/manyqna.jsp">
				 		<span>많이묻는질문</span>
				 	</a>
				</li>
			</ul>

		</div>

		<div class="accordion" id="accordionExample">
			<div class="fkcs_box">
				<button type="button" class="btn btn-outline-success">공지사항</button>

				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">SC 제일은행
							체크카드 결제 서비스 일시중단 안내</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse "
						aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							안녕하세요.<br> 프레시킷담당자입니다.<br> <br> SC제일은행 시스템 작업에 따른
							결제 서비스 일시 중단 안내드립니다.<br> <br> 작업시간<br> -SC제일은행 :
							11월 19일(토) 00:00~02:00/체크카드 이용중지, 신용카드 이용가능<br> <br>
							*작업 영향에 따라 작업시간이 변동/지연될 수 있습니다. <br> <br> 더욱 편리하고 안정적인
							서비스를 제공하는 프레시킷이 되겠습니다.<br> 감사합니다.
						</div>
					</div>
				</div>


				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">씨티/우리은행
							결제 서비스 일시중단 안내 [11.13(일)]</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse"
						aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							안녕하세요.<br> 프레시킷 담당자입니다.<br> <br> 씨티/우리은행 시스템 작업에
							따른 결제 서비스 중단 안내드립니다.<br> <br> 작업시간<br> -씨티은행 : 11월
							13일 (일) 01:00~10:00 체크카드 이용불가, 신용카드 안심클릭 인증 불가 <br>-우리은행 :
							11월 13일 (일) 02:00~06:00 체크카드 이용불가, 신용카드 이용 가능 <br> <br>
							*작업 영향에 따라 작업시간이 변동/지연될 수 있습니다. <br> <br> 더욱편리하고 안정적인
							서비스를 제공하는 프레시킷이 되겠습니다.<br> 감사합니다.


						</div>
					</div>
				</div>


				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">롯데카드
							서비스 일시중단 안내 [11.06(일) 01:30~15:00]</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse"
						aria-labelledby="headingThree" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							﻿안녕하세요. <br>프레시킷 담당자입니다.<br> <br> 롯데카드 시스템 작업에 따른
							서비스 중단 안내드립니다.<br> <br> 작업시간 : 2022.11.06(일) 01:30 ~
							15:00 <br>작업내용 : 롯데카드 시스템 작업에 따른 서비스 일시중단 <br> <br>*
							작업 시간동안 롯데카드 서비스 일시중단 <br> <br>* 작업 영향에 따라 작업시간이 변동/지연될
							수 있습니다. <br> <br>더욱 편리하고 안정적인 서비스를 제공하는 프레시킷이 되겠습니다. <br>감사합니다.
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFour">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseFour"
							aria-expanded="false" aria-controls="collapseThree">주문취소
							및 배송지 변경 일시 불가 안내 [10/31(월)23:30~03:00]</button>
					</h2>
					<div id="collapseFour" class="accordion-collapse collapse"
						aria-labelledby="headingFour" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							안녕하세요.<br> 프레시킷 담당자입니다.<br> 시스템 작업으로 주문취소 및 배송지 변경이
							일시적으로 불가하여 안내드립니다.<br> - 일시 : 2022년 10월 31일 (월) 23:30 ~ 11월
							1일 (화) 03:00 <br> - 내용 : 해당 시간 동안 주문취소, 배송지 및 배송예정일 변경 불가 <br>
							<br> 작업 종료 후에는 주문취소 및 배송지 변경 가능하여, 새로고침 후 이용 바랍니다. <br>
							<br> * 서비스 작업 영향에 따라 작업시간은 변동될 수 있습니다. <br> <br>
							더욱 편리하고 안정적인 서비스를 제공하는 프레시킷이 되겠습니다. <br>감사합니다.
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFive">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseFive"
							aria-expanded="false" aria-controls="collapseFive">프레시킷
							이메일 시스템 점검 안내 [10.22(토) 20:00~10.23(일) 06:00]</button>
					</h2>
					<div id="collapseFive" class="accordion-collapse collapse"
						aria-labelledby="headingFive" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							안녕하세요. <br>프레시킷 담당자입니다. <br>보다 나은 서비스 제공을 위해 아래와 같이 이메일
							시스템 점검이 진행될 예정입니다. <br>해당 점검 시간에는 프레시킷 이메일이 미발송 되오니 고객님의 너그러운
							양해 부탁 드립니다. <br>
							<br>- 점검 일시 : 2022.10.22(토) 20:00 ~ 10.23(일) 06:00<br>
							- 점검 내용 : 프레시킷 이메일 시스템 점검 <br>- 점검 영향 : 시스템 작업 시간 내 이메일 발송 불가
							<br>
							<br>* 서비스 작업 영향에 따라 작업 시간은 변동 될 수 있습니다. <br>
							<br>더욱 편리하고 안정적인 서비스를 제공하는 프레시킷이 되겠습니다.<br> 감사합니다.
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<jsp:include page="../main/footer.jsp"/>

</body>
</html>


