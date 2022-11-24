 <%@page import="java.text.DecimalFormat"%>
<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>freshkit</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
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
#footer {
	clear: both;
}

.olki_list_wrap {
	/* 화면비율유지*/
	width: 960px;
	height: 100%;
	margin: 0 auto;
}

#content {
	padding: 20px 0 70px;
}

.pd_mu_wrap .olki_list_wrap .top_sec {
	padding-bottom: 0;
	border-bottom: 0;
	border-bottom-width: 0px;
	border-bottom-style: initial;
	border-bottom-color: initial;
}

.top_sec h2 {
	font-family: "맑은고딕";
	color: #101010;
	font-size: 40px;
	line-height: 56px;
	font-weight: 700;
}

.top_sec {
	height: 100px;
}

.box_search_gray {
	margin: 24px 0 -54px;
	padding: 32px 220 32 220;
	background-color: #f7f7f7;
}

.input_wrap_field {
	width: 650;
	text-align: left;
	height: 70px;
	padding: 0 20px 0 20px;
	border: 2px solid #202020;
	color: #101010;
	font-weight: 700;
	font-size: 20px;
	opacity: 1;
	background-color: white;
}

input.text {
	font-family: '맑은고딕';
	height: 55px;
	padding: 0 156px 0 20px;
	margin-top: 10;
	border: 0;
	font-weight: 1000;
	font-size: 20px;
	opacity: 1;
}

.srch_gray {
	margin: 25px 0 25px 100px;
	width: 750px;
	/* background-color: rgb(231, 255, 111) ;*/
}

hr {
	color: black;
	border: 3px;
}


.top_sub_title {
	color: #101010;
	font-weight: 700;
	font-size: 22px;
	line-height: 32px;
	padding: 100px 0 16px;
	border-bottom: 2px solid #202020;
}

ul {
	margin: 0;
	padding: 0;
	word-break: break-all;
	letter-spacing: -0.5px;
}

.pro_module {
	width: 200px;
	height: 380px;
	position: relative;
	margin-top: 20px;
}

.pro_list .item {
	float: left;
	margin: 40px 0 0 36px;
	min-height: 300px;
}

li {
	list-style: none;
}
#button-addon2{
	clear: both;
	vertical-align: middle;
	font-size: 20px;
	
}

a {
	color: inherit;
	text-decoration: none;
}

.page_num {
	text-align: center;
	clear: both;
}

.pd_mu_wrap .olki_list_wrap .top_sub_sec h3 {
	color: #101010;
	font-weight: 700;
	font-size: 22px;
	line-height: 32px;
}

.pd_mu_wrap .olki_list_wrap .top_sub_sec {
	padding: 50px 0 10px;
	border-bottom: 2px solid #202020;
}

.txt_wrap {
	font-family: "맑은고딕";
	
	font-size: 17px;
	line-height: 23px;
	margin: 10px 0px 10px 0px;
}

span.dcratio {
	color: red;
	font-size: 18px;
}

span.dcratio_price {
	font-size: small;
	color: gray;
	text-decoration: line-through;
}

#footer {
	clear: both;
}

.img_wrap img {
	width: 200px;
}
.pro_btm{
clear:both;

height: 200px;
}

.tit_mt  {
font-weight: 550;
}
</style>
</head>


<body>
	<jsp:include page="../main/header.jsp" />
	<section id="container">
		<div id="content" class="pd_wrap pd_mu_wrap">

			<div class="olki_list_wrap">
				<!--inner단-->


				<!--1단-->
				<div id="content" class="top_sec">
					<h2>메뉴찾기</h2>

				</div>

				<div class="srch_gray">

					<!--검색 회색-->
<%


%>
					<!-- 검색창 -->
					<form action="searchname.jsp"><div class="input-group mb-3">
						<input type="text" class="form-control form-control-lg"
							placeholder="메뉴명으로 검색해주세요" aria-label=".form-control-lg example"
							aria-describedby="button-addon2" name="msg">
						
						<button class="btn btn-outline-secondary" type="submit"
							id="button-addon2" >검색</button>
					</div>
</form>
					<!-- 검색창 -->
					<p>
						<mark>FRESHKIT</mark>
						의 모든 메뉴를 쉽고 빠르게 찾아볼 수 있습니다.
					</p>

				</div>

				<!--검색 회색-->







				<!--판매중인 상품 -->

				<div class="top_sub_sec">
					<h3>판매중</h3>
				</div>
				<div class="pro_list">

					<ul class="salePrd">
						<%
                          
						FkproductDAO dao = new FkproductDAO();
						ArrayList<FkproductVO> list = dao.selectAll();
						int cnt = 0;
						for (FkproductVO vo : list) {
							int pno = vo.getPno();
							String pname = vo.getPname();
							int price = vo.getPrice();
							String img = vo.getPimg1();
							int dcratio = vo.getDcratio();

							int dprice = price - (price / 100 * dcratio);
							DecimalFormat formatter = new DecimalFormat("###,###");
							cnt++;
						%>

						<!-- ==========================================================================  -->


						<!-- loop -->
						<li class="item">
							<!--상품 리스트-->
							<form class="cartgo<%=pno%>" action="../cart/cart.jsp" name="frm">

								<div class="pro_module">
									<!--상품전체 module-->

									<div class="img_wrap">
										<!--상품이미지-->
										<a href="fkproductDetail.jsp?pno=<%=vo.getPno()%>"> <img
											src="<%=vo.getPimg1()%>"></img>
										</a>
									</div>
									<div class="txt_wrap">
										<input type="hidden" name="pno" value="<%=vo.getPno()%>" />

										<div class="tit_info">
											<!--상품정보 div-->
											<span class="tit_mt"> <!--상품이름--> <a
												href="fkproductDetail.jsp?pno=<%=vo.getPno()%>"> <%=pname%></a>
											</span>
										</div>
										<div class="price_info">
											<!--span으로 할인가:, 가격, 원-->
											<span class="dcratio"><%=dcratio%>%</span> <span
												class="price"><%=formatter.format(dprice)%></span><span
												class="won">원</span> <span class="dcratio_price"><%=formatter.format(price)%>원</span>


										</div>



									</div>
									<div class="act_btn_wrap">
										<!---->

										<button type="button" id="cart<%=pno%>"
											class="btn btn-outline-primary">장바구니</button>
										<button type="button"
												id="buy<%=pno %>" class="btn btn-outline-danger">구매하기</button>

									</div>
								</div>
							</form>
						</li>
						<!--loop 끝-->

						<%
						}
						%>




					</ul>
				</div>





			</div>
			<!--inner단-->
		</div>
		<div class="pro_btm">
								
								</div>
	</section>
	<jsp:include page="../main/footer.jsp" />
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>

<%FkproductDAO dao1 = new FkproductDAO();
ArrayList<FkproductVO> list2 = dao1.selectAll();
for (FkproductVO vo2 : list) {
	int pno3 = vo2.getPno();%>
$(function() {
	$("button#cart<%=pno3%>").on("click", function() {
		console.log("gg");
		
		$('form[class="cartgo<%=pno3%>"]').submit();
		});

	$("button#buy<%=pno3%>").on("click", function() {
		console.log("gg");
		
		$('form[class="cartgo<%=pno3%>"]').submit();
		});
	});
<%}%>
	
</script>


</html>