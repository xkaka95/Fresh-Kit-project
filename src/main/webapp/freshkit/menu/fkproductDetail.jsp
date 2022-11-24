<%@page import="kr.co.freshkit.vo.FkcodeVO"%>
<%@page import="kr.co.freshkit.dao.FkcodeDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.btn_cart {
        background: url( "images/cart.png" ) no-repeat;
        border: none;
        width: 50px;
        height: 50px;
        cursor: pointer;
      }
button:action {
position: relative;
top: 2px;
}      

* {
font-family: "맑은고딕";
font-weight: 550;
font-size: 15px;
}

h1.pname_big{
font-weight: 800;
margin-bottom: 0px;
}
.table tr:not(.line_tr){
border-bottom: white 1px;
height: 40px;
vertical-align: middle;
}

.price_td{
font-size: 25px;
}

.line_tr{
border-bottom: 1px #e0e0e0 solid;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- css only -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- javascript bundle with popper -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<%
//1. 파라미터값 가져오기 pno=
String p = request.getParameter("pno");

//2. null이 아니면
if(p!=null){
//3. 숫자로 형변환 ( 문자>숫자) 
	int pno = Integer.parseInt(p);
	
//4. dao 객체
	FkproductDAO dao = new FkproductDAO();

//5. 상품번호로 vo객체 얻어오기
FkproductVO vo = dao.selectOne(pno);

//fkproduct 테이블에 fkcode테이블에서 가져온 hsno값 넣기



int  hsno = vo.getHsno();
DecimalFormat formatter = new DecimalFormat("###,###");
%>

<script type="text/javascript">
$(function(){
	$("#caution").on("click",function(){
		$("#rdc").attr("src","../images/refund.jpg");
	})
	$("#info").on("click",function(){	
		$("#rdc").attr("src","<%=vo.getPimg2()%>");
	})
	
	$("#buy").on("click", function(){ // 주문하기
		
		var frm = document.frm;
		if($("#countnum").val()==0){
			alert("수량을 선택해주세요.");
		}else{
			document.frm.action="../order/order.jsp";
			document.frm.method="get";
			document.frm.submit();			
		}
	})	
});

function calculate(){
	$('input[class="pp"]').empty();
	var pprice = <%=Math.round(vo.getPrice()*(1-vo.getDcratio()*0.01))%>;
	
	var amount = (pprice*$("#countnum").val());
	console.log(amount);
	$('input[class="pp"]').attr("value",amount);
}

function plus_num(){
	
    var number = ($("#countnum").attr('value'));
    if(number==9){     // 숫자가 9라면 0으로 만든다.
        $("#countnum").attr('value', '0'); //초기화 : 0 
    }else{
        var plus_num = parseInt(number) + 1; //숫자화해서 1을 추가한다(역순카운트일경우 -1)
        $("#countnum").attr('value', plus_num);
    }
}

function minus_num(){
    var number = ($("#countnum").attr('value'));
    if(number==0){     // 숫자가 9라면 0으로 만든다.
        $("#countnum").attr('value', '0'); //초기화 : 0
    }else{
        var minus_num = parseInt(number) - 1; //숫자화해서 1을 추가한다(역순카운트일경우 -1)
        $("#countnum").attr('value', minus_num);
    }
}


</script>
</head>
<body>
<jsp:include page="../main/header.jsp" />

<div id="container">
<div id="1pg" style="margin-top:100px;">
<div  style="margin-left:100px; float:left;">
<div><img src="<%= vo.getPimg1() %>" style="width: 500px; height:500px;"/></div>

</div>

		<div style=" float:right; margin-right:200px; class="shadow p-3 mb-5 bg-body rounded">
		<form action="" name="frm">
		
		<h1 class="pname_big"><%=vo.getPname() %></h1>
		
		
		
		

		<table class="table table-hover" style="width:600px;">
			<tr>
			<hr />
				<td style="width:150px;">상품가격</td>
				<td class="price_td"><input type="hidden" name="pno" value="<%=vo.getPno() %>" /><%=formatter.format(vo.getPrice())%>원</td>
				
			</tr>
			<tr>
				<td style="width:150px;">상품번호</td>
				<td><input type="hidden" name="pno" value="<%=vo.getPno() %>" /><%=vo.getPno() %></td>
				
			</tr>
		
			<tr  class="line_tr">
			
			<%
			FkcodeDAO daocode = new FkcodeDAO();
			FkcodeVO vocode = daocode.selectOne2(hsno);
			
			%>
				<td>분류명</td>
				
				<td><input type="hidden" name="pno" value="<%=vo.getPno() %>" /><%=vocode.getHsname() %></td>
			</tr>
			<tr>
				<td>배송구분</td>
				<td>택배배송</td>
			</tr>
			
			<tr  class="line_tr">
			
				<td>안내사항</td>
				<td>모든 제품은 신선함을 우선으로 취급하고 있으며 구입 후 냉장/냉동 보관하여 가급적 빨리 섭취를 권장드립니다. <br>남은 제품은 냉동보관 권장 드립니다.</td>
			</tr>
			<tr>
				<td>구매수량</td>
				<td>
				<input type="hidden" name="" value="가격">
				<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="countnum" value="0" size="3" style="position: relative; top:2px;"onchange="">
				<div class="btn-group btn-group-sm" role="group" aria-label="Default button group">
 				 <button type="button" class="btn btn-outline-dark" onclick="plus_num(); calculate();" >+</button>
  				<button type="button" class="btn btn-outline-dark" onclick="minus_num(); calculate();" >-</button>
				</div>
				</td>	
			</tr>
			<tr>
				<td>총 금액</td>
				<td>
					<input class="pp" type="text" name="pprice" id="" value="0" style="border:none;width:70px; text-align: right;" readonly/>  원
				</td>
			</tr>
			
		</table>
	
		<div style="margin-top: 40px;" method="">
						<%
						/* 로그인정보 가져오기 ------------------------------------- */
						Object obj = session.getAttribute("vo");

						int no = 0;

						if (obj == null) {
							%>
							<a href="../main/fkLogin.jsp"><button type="button" id="" class="btn btn-outline-success btn-lg" style="font-size:larger; margin-left: 30px; margin-bottom: 50px; margin-right: 30px; width: 210px;">
							<span class="">구매하기</span>
							</button></a>
						<%
						} else {
							%>
							<button type="button" id="buy" class="btn btn-outline-success btn-lg" style="font-size:larger; margin-left: 30px; margin-bottom: 50px; margin-right: 30px; width: 210px;">
								<span class="">구매하기</span>
							</button>
						
						
						<%
						}
						
						/* ------------------------------------ */					
						%>	

						<a href="../cart/cart.jsp?pno=<%=vo.getPno()%>"><button type="button" id="cart" class="btn btn-outline-success btn-lg" style="font-size:larger; margin-left: 30px; margin-bottom: 50px; margin-right: 30px; width: 210px;">
							<span class="">장바구니</span>
						</button></a>
					
			<button type="button" id="" onclick="" class="btn_cart">
			
				</button>	
				
				</form>
			</div>
	
		</div>
			
			
	
			
		</div>
		
		
		
		<div id="2pg" style="width: 80%; height: 150px; margin-left:auto;
		margin-right:auto; position:relative; top:50px; clear: both;" class="border-top" >
		<br>
		<br>
		
		<div class="row">
		<div class="btn-group col text-center"  role="group" aria-label="Basic outlined example" >
  <button type="button" id="info" class="btn btn-outline-success" style="padding:20px; font-size:x-large;" >상세설명</button>
  
  <button type="button" id="caution" class="btn btn-outline-success" style="padding:20px; font-size:x-large;">배송/교환/반품</button>
</div>
</div>

		
		
		</div>
		<div style="text-align: center; margin-top: 50px; margin-bottom: 25px;">
<img src="" alt="" id="rdc" style="border: 0; width: 1000px;" />
</div>
		
<%
}
%>

<jsp:include page="../main/footer.jsp" />
</body>
</html>