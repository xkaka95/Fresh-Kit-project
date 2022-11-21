<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.co.freshkit.dao.FkcartDAO"%>
<%@page import="oracle.jdbc.Const"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>freshkit</title>
</head>




	<!-- CSS only -->
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
	padding: 52px 0 140px;
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

hr {
	color: black;
	border: 3px;
}

.second_wrap {
	margin-top: 120px;
	width: 1000px;
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
	height: 400px;
	position: relative;
	margin-top: 60px;
}

.pro_list .item {
	float: left;
	margin: 40px 0 0 36px;
	min-height: 300px;
}

li {
	list-style: none;
}

a {
	color: inherit;
	text-decoration: none;
}

.pd_mu_wrap .olki_list_wrap .top_sub_sec h3 {
	color: #101010;
	font-weight: 700;
	font-size: 30px;
	line-height: 32px;
}

.pd_mu_wrap .olki_list_wrap .top_sub_sec {
	padding: 100px 0 16px;
	border-bottom: 2px solid #202020;
}

.page_num {
	text-align: center;
	clear: both;
}

.txt_wrap {
	font-family: "맑은고딕";
	font-weight: 400;
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

div.page_num {
	margin-left: 450px;
	text-align: center;
}

img {
	width: 200px;
	height: 200px;
}

.under_theme {
	height: 100px;
	width: 1000px;
}


</style>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">

	
	
	
	
	</script>
<body>
<jsp:include page="../main/header.jsp" />
	<section id="container">



		<div id="content" class="pd_wrap pd_mu_wrap">

			<div class="olki_list_wrap">
				<!--inner단-->


				<!--1단-->
				<div id="content" class="top_sec">
					<h2>FRESHKIT 메뉴</h2>

				</div>


				<!-- ============================================================ -->
					<div class="under_theme">
						
						
						
						<div class="btn-group btn-group-lg" role="group"
							aria-label="Large button group">
							<a type="button" class="btn btn-outline-dark"
								onclick="alltheme()"  href="menu.jsp">전체보기</a>


						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="btn-group btn-group-lg" role="group"
								aria-label="Large button group">
								<a type="button" class="btn btn-outline-dark" href="100.jsp">한식</a>
								<a type="button" class="btn btn-outline-dark" href="200.jsp">양식</a>
								<a type="button" class="btn btn-outline-dark" href="300.jsp">중식/일식</a>
								<a type="button" class="btn btn-outline-dark" href="400.jsp">동남아</a>
								<a type="button" class="btn btn-outline-dark" href="500.jsp">분식/야식</a>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;

							<div class="btn-group btn-group-lg sidefood" role="group"
								aria-label="Large button group">
								<a type="button" class="btn btn-outline-dark" href="600.jsp">샐러드</a>
								
									<a type="button" class="btn btn-outline-dark" href="800.jsp">반찬</a>
									<a type="button" class="btn btn-outline-dark" href="900.jsp">키즈</a>

							</div>

						
					</div>
				

				<!--검색 회색-->






				<!--2단 -->
				<!--판매중인 상품 -->


				<div class="top_sub_sec">
					<h3>전체메뉴</h3>
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
										<a href="../cart/fkviewcart.jsp"><button type="button"
												id="order_in" class="btn btn-outline-danger">구매하기</button></a>

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
				<!-- 다음 페이징 -->
				<!-- 
				<div class="page_num">
					<nav aria-label="...">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link"><span
									aria-hidden="true">&laquo;</span></a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item" aria-current="page"><a
								class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"> <span
									aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
				</div> -->
			</div>
		</div>
		<!--inner단-->

	</section>
<jsp:include page="../main/footer.jsp" />
</body>
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

	});
<%}%>
	
</script>



</html>