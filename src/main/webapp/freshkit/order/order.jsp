<%@page import="java.util.Formatter"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.freshkit.vo.FkcartVO"%>
<%@page import="kr.co.freshkit.dao.FkcartDAO"%>
<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>freshkit</title>



<!-- CSS only -->
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

</head>

<style>
#footer {
	clear: both;
}

#container {
	width: 1250px;
	height: 100%;
	margin: 0 auto;
}

.order_fix {
	margin-bottom: 100px;
	margin-left: 150px;
	width: 900px;
}

#content {
	padding: 52px 0 80px;
}

.top_sec {
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
	height: 70px;
	width: 500px;
}

hr {
	color: black;
	border: 3px;
}

a {
	color: inherit;
	text-decoration: none;
}

.top_sub_sec h3 {
	color: #101010;
	font-weight: 700;
	font-size: 25px;
	line-height: 32px;
}

.right_sub_sec h3 {
	color: #101010;
	font-weight: 700;
	font-size: 25px;
	line-height: 32px;
}

.top_sub_sec {
	padding: 20px 0 16px;
	border-bottom: 2px solid #202020;
	float: left;
	width: 800px;
}

.right_sub_sec {
	padding: 20px 0 16px;
	border-bottom: 2px solid #202020;
	clear: both;
}

.product_sub_sec {
	margin-top: 50px;
	padding: 20px 0 16px;
	border-bottom: 2px solid #202020;
	clear: both;
}

.product_sub_sec h3 {
	color: #101010;
	font-weight: 700;
	font-size: 25px;
	line-height: 32px;
}

#product_table {
	margin: 30px 0 50px 70px;
	width: 800px;
	text-align: left;
}

#product_table td {
	font-size: 17px;
	vertical-align: middle;
	border: rgb(0, 0, 0);
}

#product_table tr {
	
}

#product_table th {
	height: 100px;
	line-height: 70px;
	font-size: 15px;
	text-align: left;
}

.price_left_pname .price_left_price .price_all_price_th {
	text-align: left;
	font-weight: 700;
	width: 300px;
	height: 30px;
	vertical-align: bottom;
}

.price_left_pname {
	text-align: left;
	font-weight: 700;
	width: 300px;
}

.price_left_price {
	text-align: left;
	font-weight: 700;
	width: 300px;
	vertical-align: top;
}

.payment_price {
	font-size: 16;
	line-height: 24px;
	color: #101010;
	font-weight: 600;
	font-weight: 500;
	padding-top: 10px;
}

.customer_info {
	clear: both;
}

thead>tr h3 {
	color: #101010;
	font-weight: 700;
	font-size: 25px;
	line-height: 32px;
}

img {
	width: 80px;
	height: 80px;
}

.payment_sub_sec2>table {
	margin-left: 150px;
	width: 600px;
	margin-bottom: 70px;
}

.payment_sub_sec2>table button {
	
}

.payment_desc {
	margin: 50px 100px 50px 60px;
	padding: 50px 100px 50px 60px;
	height: 200px;
	width: 800px;
	background-color: rgb(220, 220, 220);
}

.payment_move {
	margin: 40px auto;
	text-align: center;
}

.btn_payment_move {
	width: 250px;
	height: 70px;
	font-family: "맑은고딕";
	font-weight: 700;
	font-size: 25px;
	background-color: rgb(125, 166, 50);
	border: 0px;
}

#receiver_table {
	vertical-align: middle;
}

#product_table tablehei {
	height: 50px;
}

.all_cnt_price {
	margin-top: 50px;
	margin-right: 50px;
	padding: 20px 0 16px;
	text-align: right;
	font-family: "맑은고딕";
	font-size: 40px;
	font-weight: 600;
	border-top: 1px solid gray;
}
</style>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function receiver_execDaumPostcode() {
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
                    document.getElementById("receiver_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("receiver_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('receiver_postcode').value = data.zonecode;
                document.getElementById("receiver_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("receiver_detailAddress").focus();
            }
        }).open();
    }
    
    
    
  
    
   
    function Checkup_payment() {
    	 function recCheckup(){
    	    	var txt = recphone.trim();
    	    	
    	    	
    	    	if(txt==''){
    				alert('연락처를 입력해주세요.');
    				return ;
    	    	}else if(txt.length!=11){
    	            alert("연락처를 확인해주세요.");
    	            return ;
    	    	}
    	    	var params = "customerphone="+txt;
    	    	
    	    	
    	    	
    	    }
    	    
    	    function recCheckup2(){
    	    	var txt = $("customer_address").val().trim();    	
    	    	
    	    	if(txt==''){
    				alert('배송지를 입력해주세요.');
    				return ;
    	    	}
    	    	var params = "customer_address="+txt;
    	    	
    	    	
    	    	
    	    
    	    }
	}
   
    
 
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$(".payment_card").hide();
	$(".payment_account").hide();
	
	
});


function creditcard(){
	$(".payment_card").show();
	$("#pay").attr("value","신용카드");
	$(".payment_account").hide();

	
}

function creditcard1(){
	console.log($("#card1 option:selected").val());
	$("#pay").attr("value",$("#card1 option:selected").val());
}

function creditcard2(){
	console.log($("#card2 option:selected").val());
	$("#pay2").attr("value",$("#card2 option:selected").val());
}

function payaccount(){
	$(".payment_account").show();
	$("#pay").attr("value","계좌이체");
		$(".payment_card").hide();
	
}

	

</script>
<body>
	<jsp:include page="../main/header.jsp" />
	<section id="container">
		<form action="orderOk.jsp">
			<div id="content" class="payorder_wrap">

				<div class="order_fix">
					<!--inner단-->



					<div id="content" class="top_sec">
						<h2>주문하기</h2>

					</div>



					<div class="customer_info">

						<%

						%>



						<table class="table">
							<thead>
								<tr class="border-bottom border-2 border-dark">
									<th scope="col" colspan="4">
										<h3>주문자</h3>
									</th>

								</tr>

							</thead>
							<tbody>
								<tr>
									<th scope="col">이름</th>
									<th scope="col" colspan="3">휴대폰</th>
								</tr>


								<tr>

									<%
									request.setCharacterEncoding("UTF-8");
									response.setContentType("text/html;charset=UTF-8");
									/* 로그인정보 가져오기 ------------------------------------- */
									Object obj = session.getAttribute("vo");
									
									int nos = 0;
									
									if(obj == null){
										response.sendRedirect("../main/fklogin.jsp");
									}else{
									
									FkcustomerVO vo5 = (FkcustomerVO)obj;
									nos = vo5.getNo();
									}
									/* ------------------------------------ */
									FkcustomerDAO daocu = new FkcustomerDAO();
									FkcustomerVO vocu = daocu.selectOne(nos);
									String cuphone = vocu.getPhone();

									String telcu1 = cuphone.substring(0, 3);
									String telcu2 = cuphone.substring(3, 7);
									String telcu3 = cuphone.substring(7, 11);
									%>

									<td><input type="text" class="form-control"
										id="customer_name" placeholder="이름"
										value="<%=vocu.getName()%>"></td>
									<td><input type="text" class="form-control"
										id="customer_tel_1" placeholder="010" value="<%=telcu1%>"
										disabled></td>
									<td><input type="text" class="form-control"
										id="customer_tel_2" placeholder="0000" value="<%=telcu2%>"
										disabled></td>
									<td><input type="text" class="form-control"
										id="customer_tel_3" placeholder="0000" value="<%=telcu3%>"
										disabled></td>
								</tr>
								<%

								%>
							</tbody>

						</table>
						<br> <br>

						<table class="table" id="receiver_table">
							<thead>
								<tr class="border-bottom border-2 border-dark">
									<th scope="col" colspan="4">
										<h3>수취인</h3>
									</th>

									<td colspan="3">
										<button type="button" class="btn btn-outline-dark"
											id="customer_address" onclick="customeraddr()">주문자
											배송지</button>
									</td>
								</tr>
							</thead>
							<tbody>

								<tr>
									<th scope="row">이름</th>
									<td colspan="3"><input type="text" class="form-control"
										id="receiver_name" name="orderName" placeholder="이름"></td>


									<td></td>
								</tr>

								<tr>
									<th scope="row">전화번호</th>

									<td><input type="text" class="form-control"
										id="receiver_tel_1" name="orderPhone1" placeholder="010"></td>
									<td><input type="text" class="form-control"
										id="receiver_tel_2" name="orderPhone2" placeholder="0000"></td>
									<td><input type="text" class="form-control"
										id="receiver_tel_3" name="orderPhone3" placeholder="0000"></td>
									<td></td>

								</tr>
								<tr>
									<th scope="row" rowspan="2">주소</th>
									<td>
										<button type="button" class="btn btn-outline-dark"
											onclick="receiver_execDaumPostcode()">&nbsp;&nbsp;
											&nbsp;&nbsp; 우편번호 찾기 &nbsp;&nbsp;&nbsp;&nbsp;</button>
									</td>
									<td><input type="text" class="form-control"
										id="receiver_postcode" name="post" placeholder="배송지우편번호"></td>
									<td colspan="2"><input type="text" class="form-control"
										id="receiver_address" name="addrs1" placeholder="배송지주소"></td>


								</tr>
								<tr>


									<td colspan="2"><input type="text" class="form-control"
										id="receiver_extraAddress" name="addrs3" placeholder="참고항목"></td>
									<td colspan="2"><input type="text" class="form-control"
										id="receiver_detailAddress" name="addrs2" placeholder="상세주소"></td>

								</tr>
								<tr>
									<th scope="row">배송메시지</th>
									<td colspan="4"><input type="text" name="orderMsg" class="form-control"
										id="order_message" placeholder="배송메세지"></td>

								</tr>
							</tbody>
						</table>

					</div>
				</div>

				<div class="order_fix">
					<div class="product_sec">
						<div class="product_sub_sec">
							<h3>주문상품</h3>

						</div>
						<div class="product_sub_sec2">
							<div class="container text-center">

								<table class="table" id="product_table">
									<thead>
									<tbody>
										<!-- <tr>

											<td rowspan="2"><img
												src="https://img.cjcookit.com/images/file/product/673/20221103134103865.jpg"
												alt=""></td>
											<td class="price_left_pname">숯불향 고추장삼겹살 구이</td>
											<td rowspan="2">예시</td>
											<td rowspan="2">예시</td>
										</tr>
										<tr>

											<td class="price_left_price">15,900</td>

										</tr> -->
										<%
										int sum = 0;
										
										/* 로그인정보 가져오기 ------------------------------------- */
										Object obj2 = session.getAttribute("vo");
										
										int no = 0;
										
										if(obj2 == null){
											response.sendRedirect("../main/fklogin.jsp");
										}else{
										
										FkcustomerVO vo6 = (FkcustomerVO)obj2;
										no = vo6.getNo();
										}
										/* ------------------------------------ */
										
										String[] price = request.getParameterValues("pprice");
										int[] pprice = new int[price.length];
										
										String[] ppno = request.getParameterValues("pno");
										int[] pno = new int[ppno.length];
										
										FkcartDAO dao = new FkcartDAO();
										ArrayList<FkcartVO> list = dao.selectAll2(no);
										FkproductDAO dao2 = new FkproductDAO();
										FkproductVO vo2 = null;
										
										int priceCnt = 0;
										
										DecimalFormat formatter = new DecimalFormat("###,###");
										for (int i=0; i<price.length; i++) {
											
											pprice[i] = Integer.parseInt(price[i]);
											pno[i] = Integer.parseInt(ppno[i]);
											
											vo2 = dao2.selectOne2(pno[i]);

											System.out.println(vo2.getPrice());
										%>

										<tr>

											<td rowspan="2"><img src="<%=vo2.getPimg1()%>" alt=""></td>
											<td class="price_left_pname"><input type="text" name="pname" id="" value="<%=vo2.getPname()%>" style="width:220px;border:none;"/></td>
											<td rowspan="2">수량 <input type="text" name="cartCount" id="" value="<%=pprice[i]/vo2.getPrice()%>" style="width:30px;border:none;text-align:right;" readonly/>개
											</td>
											<td rowspan="2"><input type="text" name="orderSum" id="" value="<%=pprice[i]%>" style="width:80px;text-align:right;border:none;font-weight:bold;" readonly/>원</td>
										</tr>
										<tr>

											<td class="price_left_price"><input type="text" name="" id="" value="<%=formatter.format(vo2.getPrice())%>" style="width:80px;text-align:right;border:none;font-weight:bold;" readonly/>원</td>

										</tr>
										<tr class="tablehei">

										</tr>
										<%
											sum += pprice[i];
										}
										%>

										<tr></tr>



									</tbody>
								</table>
								<div class="all_cnt_price">

									<div class="alert alert-success" role="alert">
										<div class="row">
											<div class="col ">총 주문금액</div>
											<div class="col">
												<input type="text" name="paysum" id="" value="<%=sum%>" style="width:200px;border:none;color:#0F5132;background:#D1E7DD;" readonly/>원
											</div>
										</div>

									</div>

								</div>



							</div>


						</div>
					</div>
				</div>

				<!--1단-->
				<div class="order_fix">
					<div class="payment_sec">
						<div class="right_sub_sec">
							<h3>결제수단</h3>

						</div>
						<div class="payment_sub_sec2">
							<table class="table">

								<tbody>
									<tr>

										<td><button type="button"
												class="btn btn-outline-dark btn-lg" style="width:167.25px;" onclick="creditcard()">신용카드
												</button></td>
										<td><button type="button"
												class="btn btn-outline-dark btn-lg " style="width:167.25px;height:48px;font-size:19px;" onclick="payaccount()">실시간계좌이체</button></td>
										<td><button type="button"
												class="btn btn-outline-dark btn-lg" id="phonepay" style="width:167.25px;" disabled>
												휴대폰결제</button></td>
									</tr>
									<tr>

										<td><button type="button"
												class="btn btn-outline-danger btn-lg" style="width:167.25px;" disabled>PAYCO
												</button></td>
										<td><button type="button"
												class="btn btn-outline-warning btn-lg" style="width:167.25px;" disabled>kakaopay</button></td>
										<td><button type="button"
												class="btn btn-outline-success btn-lg" style="width:167.25px;" disabled>
												네이버페이</button></td>
									</tr>
									<tr>

										<td><button type="button"
												class="btn btn-outline-warning btn-lg" style="width:167.25px;" disabled>SMILE
												PAY</button></td>
										<td><button type="button"
												class="btn btn-outline-primary btn-lg" style="width:167.25px;" disabled>삼성페이</button></td>
										<td></td>
										<td><input type="hidden" name="pay" id="pay" /></td>
										<td><input type="hidden" name="pay2" id="pay2" /></td>
									</tr>

								</tbody>
							</table>


						</div>
						<div class="payment_card" id="payment_card">
							<table class="table">

								<tbody>
									<tr>


										<td>카드종류</td>
										<td>할부종류</td>
									</tr>
									<tr>

										<td><select class="form-select"
											aria-label="Default select example" id="card1" onchange="creditcard1()">
												<option selected>카드 선택</option>
												<option value="우리카드">우리카드</option>
												<option value="하나카드">하나카드</option>
												<option value="삼성카드">삼성카드</option>
												<option value="수협카드">수협카드</option>
										</select></td>

										<td><select class="form-select"
											aria-label="Default select example" id="card2" onchange="creditcard2()">
												<option selected>할부선택</option>
												<option value="일시불">일시불</option>
												<option value="1개월">1개월</option>
												<option value="2개월">2개월</option>
												<option value="3개월">3개월</option>
										</select></td>
									</tr>

								</tbody>
							</table>
							<div class="alert alert-secondary" role="alert">
								<a href="#" class="alert-link">신용카드 결제 이용안내</a>.
								<p></p>
								<p>신용카드 할부는 50,000원 이상만 가능합니다.</p>

							</div>
						</div>
						<div class="payment_account" id="payment_account">

							<div class="alert light" role="alert">
								<a href="#" class="alert-link">계좌이체 이용 안내</a>.
								<p></p>
								<p></p>
								<p>프레시킷 1002-855-332121 우리은행</p>

							</div>



						</div>
						<div class="payment_move">
							<a href="fkorderOk.jsp"><input type="submit" value="결제하기"
								class="btn_payment_move"></a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
	<jsp:include page="../main/footer.jsp" />


	<script>
function customeraddr(){

	<%String name = vocu.getName();
String phone = vocu.getPhone();
String post = vocu.getPost();
String addr = vocu.getAddress();

String tel1 = phone.substring(0, 3);
String tel2 = phone.substring(3, 7);
String tel3 = phone.substring(7, 11);

//receiver_postcode
//receiver_address
//receiver_extraAddress
//receiver_detailAddress
String add = "";
String detailaddr = "";
if (addr.contains("/")) {
	int idx = addr.indexOf("/");
	add = addr.substring(0, idx);
	detailaddr = addr.substring(idx + 1);
} else {
	add = addr;
	detailaddr = "";
}%>
	
	document.getElementById('receiver_name').value = '<%=name%>';
	document.getElementById('receiver_tel_1').value = '<%=tel1%>';
	document.getElementById('receiver_tel_2').value = '<%=tel2%>';
	document.getElementById('receiver_tel_3').value = '<%=tel3%>';
	
	document.getElementById('receiver_postcode').value = '<%=post%>';
	document.getElementById('receiver_address').value = '<%=add%>';
	document.getElementById('receiver_detailAddress').value = '<%=detailaddr%>';

		}
	</script>
</body>

</html>