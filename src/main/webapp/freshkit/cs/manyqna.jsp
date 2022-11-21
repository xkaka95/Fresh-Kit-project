<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>fkmanyqna.jsp</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

	
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap');



		.cs_wrap {
			margin: 0px auto;
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
			margin-left: 250px;
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
			width: 1000px;
			height: 1300px;
			margin-bottom: 400px;
		}
		
		.accordion .fkcs_box {
			margin-top: 80px;
			margin-bottom: 100px;
		}
</style>
</head>


<body>

<jsp:include page="../main/header.jsp"/>


	<div class="cs_wrap">
		<h2 class="title">많이묻는 질문</h2>
		
		<div calss="tab_wrap">
			<ul class="tabs">
				<li>
					<a href="fknotice.jsp">
						<span class="notice">공지사항</span>
						<em class="hide">선택됨</em>
						
					</a>
				</li>
				<li class="on">
				 	<a href="manyqna.jsp">
				 		<span>많이묻는질문</span>
				 	</a>
				</li>
			</ul>

		</div>
		<div class="accordion" id="accordionExample">
			<div class="fkcs_box">
				<button type="button" class="btn btn-outline-success">배송</button>

				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">Q. 외국이나
							해외에 거주하는 사람도 배송받을 수 있나요?</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show"
						aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body">A. 서울, 경기, 인천, 청주, 대전, 천안, 아산,
							세종 (일부지역 제외)에만 새벽 배송되고 있으며, 신선 식품으로 해외 배송은 불가합니다.</div>
					</div>
				</div>


				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">Q.
							토요일, 일요일, 공휴일에도 배송이 되나요?</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse"
						aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							A. 주5일(화/수/목/금/토) 새벽 배송되며, 주문 마감일을 기준으로 다음날 새벽에 배송되기 때문에 일부 공휴일에도
							배송될 수 있습니다. <br>주문 가능일로부터 최대 5일 이내 원하는 날짜를 선택하여 배송받을 수 있는
							서비스입니다.<br>배송가능일은 메뉴 상세정보에서 확인해 주시기 바랍니다. <br> <br>
							※ 주문 마감일 : 월/화/수/목/금 오전 7시 (토요일/일요일/공휴일은 주문 마감 없음)<br> ※ 배송
							가능일 : 화/수/목/금/토 새벽 (일요일/월요일/공휴일 다음날은 배송 없음)
						</div>
					</div>
				</div>


				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">Q.
							배송시간을 선택할 수 있나요?</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse"
						aria-labelledby="headingThree" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							A. 배송 시간은 선택 불가합니다. <br>모든 메뉴는 주문 시 선택한 배송일에 새벽(아침 7시전) 배송
							됩니다.<br> 다만, 교통상황 및 기상에 따라 배송이 지연될 수 있습니다. <br>양해
							부탁드립니다.
						</div>
					</div>
				</div>
			</div>


			<div class="fkcs_box">
				<button type="button" class="btn btn-outline-success">결제/영수증</button>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFour">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseFour"
							aria-expanded="true" aria-controls="collapseFour">Q. 주문후
							결제 방식을 변경할 수 있나요?</button>
					</h2>
					<div id="collapseFour" class="accordion-collapse collapse show"
						aria-labelledby="headingFour" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							A. 결제 방식은 주문마감(배송일 전일 오전 7시)전까지만 카드로 결제한 금액에 대해 카드 변경만 가능합니다. <br>카드
							변경은 [MY프레시킷>주문/배송조회] 주문상세 페이지에서 [결제수단 변경] 버튼을 눌러 변경할 수 있습니다. <br>
							<br>※ 결제수단은 '결제 완료' 단계에서만 가능하며 '재료 준비' 단계부터는 변경이 불가하여 [결제수단
							변경] 버튼이 출력되지 않습니다.
						</div>
					</div>
				</div>


				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFive">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseFive"
							aria-expanded="false" aria-controls="collapseFive">Q.
							카드영수증은 어떻게 신청하나요?</button>
					</h2>
					<div id="collapseFive" class="accordion-collapse collapse"
						aria-labelledby="headingFive" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							A.카드 결제 시, 자동으로 발급되며 <br>발행된 영수증은 [MY프레시킷>주문/배송내역]주문상세정보에서
							확인하실 수 있습니다.
						</div>
					</div>
				</div>


				<div class="accordion-item">
					<h2 class="accordion-header" id="headingSix">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseSix"
							aria-expanded="false" aria-controls="collapseSix">Q.
							세금계산서는 어떻게 신청하나요?</button>
					</h2>
					<div id="collapseSix" class="accordion-collapse collapse"
						aria-labelledby="headingSix" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							A. 세금계산서는 현금 및 법인카드 결제에 한해 발행됩니다.<br> 주문완료 후 [MY프킷>주문/배송내역]
							주문상세 페이지에서 [세금계산서 신청] 버튼을 눌러 세금계산서 신청을 해주시기 바랍니다.<br> <br>
							■ 세금계산서/영수증발행안내 신용카드로 결제시 세금계산서 발급 요청을 하실 수 없습니다. <br>2004년
							부터 부가가치세법의 변경에 따라 세금계산서와 영수증(신용카드)은 이중 발행이 불가하오니 신중하게 선택하여 신청하시기
							바랍니다.<br> 「부가세법 시행령 57조 2항」이에 신용카드로 결제시, 세금계산서 발급 요청이 불가합니다.
							<br> <br> 세금계산서는 매달 5일 발행이 마감 됩니다.<br> 2010년부터
							법인기업 전자세금계산서 사용 및 전송 의무화에 따라, 세금계산서는 매달 5일 발행 마감되며 (예 : 1월 결제분 2월
							5일 세금계산서 발행마감)<br> 이후에는 해당 월 세금계산서를 발행 하실 수 없습니다. (예 : 2월 5일
							이후에는 2월 세금계산서가 발급됩니다.) <br> <br>세금계산서는 이메일을 통해 전달됩니다. <br>2010년부터
							법인 기업 전자세금계산서 사용 및 전송 의무화에 따라, 세금계산서는 이메일로만 발송되오니 세금계산서 신청 시 정확한
							이메일 주소를 적어주시기 바랍니다.
						</div>
					</div>
				</div>
			</div>

			<div class="fkcs_box">
				<button type="button" class="btn btn-outline-success">회원</button>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingSeven">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseSeven"
							aria-expanded="true" aria-controls="collapseSeven">Q.
							회원가입에 나이제한이 있나요?</button>
					</h2>
					<div id="collapseSeven" class="accordion-collapse collapse show"
						aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							A. 전자상거래법에 의거하여 <br> 만 14세 이상의 고객님만 서비스 이용이 가능합니다.
						</div>
					</div>
				</div>


				<div class="accordion-item">
					<h2 class="accordion-header" id="headingEight">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseEight"
							aria-expanded="false" aria-controls="collapseEight">Q.
							회원탈퇴는 어떻게 하나요?</button>
					</h2>
					<div id="collapseEight" class="accordion-collapse collapse"
						aria-labelledby="headingEight" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							A.회원 탈퇴는 [My프레시킷>회원 탈퇴]에서 신청 가능하며, 회원 탈퇴 시 회원 정보가 삭제됩니다. <br>
							<br>① 선물 또는 배송 중이거나 반품 진행 중인 주문 건이 있을 경우, 처리 완료 후 탈퇴가 가능합니다.
							<br>② 탈퇴 시 쿠폰 및 포인트 등은 모두 삭제되며, 재가입 시 복원 불가합니다.<br> ③
							탈퇴 후 재가입이 가능합니다.
						</div>
					</div>
				</div>


				<div class="accordion-item">
					<h2 class="accordion-header" id="headingNine">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseNine"
							aria-expanded="false" aria-controls="collapseNine">Q.
							비회원으로 주문할 수 있나요?</button>
					</h2>
					<div id="collapseNine" class="accordion-collapse collapse"
						aria-labelledby="headingNine" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							A. 현재 프레시킷 에서는 비회원 주문이 되지 않습니다.<br> 빠른시일내에 가능하도록 준비하겠습니다.<br>
							회원으로 주문 부탁드립니다.
						</div>
					</div>
				</div>
			</div>

			<div class="fkcs_box">
				<button type="button" class="btn btn-outline-success">기타</button>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTen">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTen"
							aria-expanded="true" aria-controls="collapseTen">Q. 보냉제는
							100% 물인가요?</button>
					</h2>
					<div id="collapseTen" class="accordion-collapse collapse show"
						aria-labelledby="headingTen" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							A. 프레시킷은 지구를 위한 첫 걸음으로<br> 아이스팩에 화학제품을 넣지 않고, 100% 물을 넣어
							사용하고 있습니다.<br> <br>프레시킷의 아이스팩은 종량제 봉투에 넣지 말고, 녹으면 잘라 물을
							버리고 비닐은 분리수거 해주시기 바랍니다.<br> 신선한 배송을 위해 일회용품을 사용하고 있지만, 줄이기
							위한 연구를 지속하겠습니다.
						</div>
					</div>
				</div>


				<div class="accordion-item">
					<h2 class="accordion-header" id="headingEleven">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseEleven"
							aria-expanded="false" aria-controls="collapseEleven">Q.
							고객센터 상담시간은 언제인가요?</button>
					</h2>
					<div id="collapseEleven" class="accordion-collapse collapse"
						aria-labelledby="headingEleven" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							A. 고객문의전화 : 1234-5678 <br> <br> 평일 : 오전 10시 ~ 오후 5시 <br>
							점심시간 : 점심 1시 ~ 오후 2시 <br> (주말,공휴일 휴무)

						</div>
					</div>
				</div>


				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwelve">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwelve"
							aria-expanded="false" aria-controls="collapseTwelve">Q.
							배송된 재료는 세척해서 사용해야 하나요?</button>
					</h2>
					<div id="collapseTwelve" class="accordion-collapse collapse"
						aria-labelledby="headingTwelve" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							A.야채는 전해수로 세척하여 손질하기 때문에<br> 조리 시 다시 세척하지 않으셔도 됩니다. <br>

							<br>다만, 버섯은 물에 닿지 않도록 준비하고, <br> 세척으로 인해 물러지기 쉬운 야채는 세척
							없이 원상태로 배송될 수 있습니다.

						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

<jsp:include page="../main/footer.jsp"/>

</body>
</html>


