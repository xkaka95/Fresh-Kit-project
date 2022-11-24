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

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap')
	;

#aaa {
	/* margin : auto; */
	width: 970px;
	height: 500px;
	margin-top: 10px;
	margin-bottom: 15px;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
	width: 1000px;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 100px;
	border: 3px solid #82ac64;
}

td {
	width: 500px;
	height: 400px;
}
.fs-1{
	padding-left: 10px;
}
.fs-5{
	padding-left: 10px;
}
</style>
</head>
<body>

	<jsp:include page="../main/header.jsp" />

	<!-- info -->
	<div class="container">
		<table>
			<img id="aaa" src="../images/infomain.jpg" />
		</table>
		<table>
			<tr>
				<td>
					<figure class="figure">
						<img src="../images/info1.jpg" class="figure-img img-fluid rounded"
							alt="...">
					</figure>
				</td>
				<td>
					<p class="fs-1">FRESHKIT!<br> 신선함이 다르다!</p>
					<p class="fs-5">
						<br> 바쁘게 살고 있는 현대인들에게 매일 정성스럽게 집밥을 준비하는 것은 결코 쉽지 않은 일이죠. <br>힘
						안들이고 직접 요리할 수 있도록, 가족과의 행복한 시간만 남도록 모든 사람들이 셰프가 아니더라도 셰프처럼. <br>정성스럽게
						준비된 식재료로 만든 요리키트로 쉽고 즐겁게 매일, 가족의 식탁에 특별한 집밥을 올려놓을 수 있게 그래서 시작합니다
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<p class="fs-1">FRESHKIT만의 다른점!</p>
					<p class="fs-5">
						<br> 1. 분야별 전문 연구진과 FK의 엄격한 심사기준<br> 2. 국내 및 글로벌 특급 호텔
						경력 최고의 셰프 11인의 메뉴 개발<br> 3. 내가 원하는 날, 새벽배송으로 만나는 신선한 재료<br>
						4. 매월 업데이트 되는 신선하고 맛있는 다양한 메뉴
					</p>

				</td>
				<td>
					<figure class="figure">
						<img src="../images/info2.jpg" class="figure-img img-fluid rounded"
							alt="...">
					</figure>
				</td>
			</tr>
			</tr>
			<tr>
				<td>
					<figure class="figure">
						<img src="../images/info3.jpg" class="figure-img img-fluid rounded"
							alt="...">
					</figure>
				</td>
				<td>

					<p class="fs-1">
						FRESHKIT의 야채가 더<br> 신선하게 유지되는 이유!
					</p>
					<p class="fs-5">
						<br> 1. 호흡량이 높은 야채에 적용하는 Breathable Film<br> 2. 호흡량이 낮지만
						변색이 잘되는 야채에 적용하는 진공포장<br> 3. 고유의 향과 맛을 유지할 수 있는 야채 간의 특성을 고려한
						그룹핑<br> 4. 눈으로 확인하는 물 100% 아이스팩<br> 5. 최적의 설계로 어떤 날씨에도
						신선하게!
					</p>

				</td>
			</tr>
			<tr>
				<td>
					<p class="fs-1">
						FRESHKIT에서 <br> 지금 바로  구매하세요!
					</p>
					<p class="fs-5">
						<br> 테마별로 상품을 확인해보세요!<br> 한식부터 양식, 중식, 일식, 동남아 음식까지! <br>
						남녀노소 누구나 간편히 즐길 수 있는 밀키트로 준비되어있습니다!
					</p>

				</td>
				<td>
					<figure class="figure">
						<img src="../images/info4.jpg" class="figure-img img-fluid rounded"
							alt="...">
					</figure>
				</td>
			</tr>
		</table>
	</div>

	<jsp:include page="../main/footer.jsp" />


</body>
</html>