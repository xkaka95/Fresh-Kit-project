<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
<%@page import="kr.co.freshkit.vo.FkorderVO"%>
<%@page import="kr.co.freshkit.dao.FkorderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>orderList.jsp</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="header.css">
	<link rel="stylesheet" href="footer.css">
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap');

		body {
			height: 1095px;
		}

		#side1 {
			background-color: #d9e2ae;
			width: 300px;
			height: 100%;
			min-height: 1500px;
			float: left;
			font-family: 'Noto Sans KR', sans-serif;
			clear: both;
		}
		#side1>p {
			padding-bottom: 10px;
			padding-left: 10px;
		}
		#header{
			font-family: 'Noto Sans KR', sans-serif;
		}
		#p1 {
			height: 50px;
			font-size: 35px;
			font-weight: 600px;
			padding-left: 10px;
		}
		#p2 {
			font-size: 35px;
			font-weight: 600px;
			padding-left: 350px;
		}
		#header>ul {
			padding-left: 0px;

		}
		#contents {
			height: 100%;
			min-height: 1025px;
			font-family: 'Noto Sans KR', sans-serif;
		}

		a { text-decoration: none; color: black; }
		a:visited { text-decoration: none; }
		a:hover { text-decoration: none; }
		a:focus { text-decoration: none; }
		a:hover, a:active { text-decoration: none; }

        table {
            width: 100%;
            max-width: 1280px;
            min-width: 1280px;
			position: absolute;
			text-align: center;
			top: 300px;
            left: 350px;
        }
		td>img {
			width: 150px;
			height: 150px;
		}
		#tr1>td {
			height: 20px;
		}

		footer {
			clear: both;
			height: 290px;
			background-color: blanchedalmond;
		}
		div#container {
			height: 100%;
            padding-bottom: 300px;
        }
        div#table1 {
        	max-height : 1000px;
        	overflow: auto;
        }
	</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		$("button#ono").on("click", function(){
			
			var frm = document.frm;
			
			var result = confirm("주문을 취소하시겠습니까?");
			
			if(result){
				document.frm.action="orderDelete.jsp";
				document.frm.method="get";
				document.frm.submit();				
			}else{
				false;
			}


		})
	})
</script>
<body>
	<jsp:include page="header.jsp"/>	
	
	<form action="" name="frm">
	<div id="container">
		<jsp:include page="sidebar1.jsp"/>

		<div id="contents">
            <br><br>
			<p id="p2">주문목록/배송조회</p>
			<div id="table1">
            <table style="width: 70%; overflow-auto" id="container" class="table align-middle">
				<tr class="table-light">
					<th>상품이미지</th>
					<th>상품명</th>
					<th>주문일자</th>
					<th>주문번호</th>
					<th>주문금액(수량)</th>
					<th>주문상태</th>
					<th></th>
				</tr>
				<%
					request.setCharacterEncoding("UTF-8");
					response.setContentType("text/html;charset=UTF-8");
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
					
					int no = 1;
					
					FkorderDAO dao = new FkorderDAO();					
					ArrayList<FkorderVO> list = dao.selectAll2(no);
					
					FkproductDAO dao2 = new FkproductDAO();
					FkproductVO vo2 = null;
					
					for(FkorderVO vo : list){
						vo2 = dao2.selectOne(vo.getPno());
				%>
				<tr>
					<td><img src="<%=vo2.getPimg1()%>" alt=""></td>
					<td><a href="fkproductDetail.jsp?pno=<%=vo2.getPno()%>"><%=vo2.getPname()%></a></td>
					<td><%=sdf.format(vo.getOdate())%></td>
					<td><%=vo.getOno() %></td>
					<td><%=vo.getOprice() %>원(<%=vo.getCount() %>set)</td>
					<td><%=vo.getOstatus() %></td>
					<td><button type="submit" id="ono" name="ono" class="btn btn-outline-dark btn-sm" value="<%=vo.getOno() %>" style="width:80px;">주문취소</button></td>
				</tr>
				<%
					}
				%>
            </table>
            </div>
		</div>

	</div>
	</form>
		
	<jsp:include page="footer.jsp"/>
	
</body>

</html>