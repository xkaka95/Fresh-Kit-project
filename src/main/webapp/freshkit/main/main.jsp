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
	<title>FRESHKIT</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../css/header.css">
	<link rel="stylesheet" href="../css/footer.css">
	<link rel="shortcut icon" href="../images/mainlogo_footer.png">
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap');

		body {
			height: 100%;
		}
		#header{

			font-family: 'Noto Sans KR', sans-serif;
		}
		#header>ul {
			padding-left: 0px;

		}
		#contents {
			height: 100%;
			min-height: 1800px;
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
			position: absolute;
            top: 1250px;
            left: 50%;
            transform: translate(-50%,-50%);
            font-family: 'Noto Sans KR', sans-serif;
        }
        #weekBest {
            font-size: 30px;
            padding-right: 200px;
        }
		td>a>img {
			width: 366px;
			height: 366px;
            margin-top: 20px;
		}

        #mainImg {
            text-align: center;
        }

        #imageholder>img {
            width: 100%;
            height: 640px;
            max-width: 1800px;
            text-align: center;
            left: 50%;
        }
        #addrSearch {
            width: 70px;
            font-family: 'Noto Sans KR', sans-serif;
        }

        #success {
            width: 150px;
            height: 30px;
            font-family: 'Noto Sans KR', sans-serif;
            position:absolute;
            top: 850px;
			left: 800px;
            font-size: 16;
        }

		#tr1>td {
			height: 20px;
		}

		footer {
			height: 290px;
			background-color: blanchedalmond;
		}
        
        #divMain {
            width: 100%;
            height: 640px;
        }
        
        div#container {
            padding-bottom: 0px;
        }

        ul.imgs{
            padding: 0;
            margin: 0;
        }
        ul.imgs li{
            position: absolute; /* 슬라이드가 겹쳐서 모여야 하므로 absolute 속성으로 배치 */
            opacity: 0; /* 체크한 라디오박스 순서의 슬라이드만 표시되도록 기본 투명도 설정 */
            list-style: none;
            padding: 0;
            margin: 0;
        }
        ul.imgs li{
            position: absolute;
            opacity: 0;
            list-style: none;
            padding: 0;
            margin: 0;
            transition-delay: 0.9s; /* 트랜지션 지연 시간 지정 */
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        
        /* slide효과 */
		* {margin:0;padding:0;box-sizing:border-box;}
		ul, li {list-style:none;}
		
		[name="slide"] {display:none;}
		.slidebox {max-width:1480px;width:100%;margin:0 auto;text-align:center;}
		.slidebox img {max-width:100%;}
		.slidebox .slidelist {
			white-space:nowrap;
			font-size:0;
			overflow:hidden;
		}
		.slidebox .slideitem {
			position:relative;
			display:inline-block;
			vertical-align:middle;
			width:100%;
			transition:all .35s;
		}
		.slidebox .slideitem label {
			position:absolute;
			z-index:1;
			top:50%;
			transform:translateY(-50%);
			padding:20px;
			border-radius:50%;
			cursor:pointer;
		}
		label.left {
			left:20px;
			background-color:#5F5F5F;
			background-image:url('../images/left-arrow.png');
			background-position:center center;
			background-size:50%;
			background-repeat:no-repeat;
		}
		label.right {
			right:20px;
			background-color:#5F5F5F;
			background-image:url('../images/right-arrow.png');
			background-position:center center;
			background-size:50%;
			background-repeat:no-repeat;
		}
		
		/* 페이징 스타일 */
		.paginglist {text-align:center;padding:30px 0;}
		.paginglist > li {display:inline-block;vertical-align:middle;margin:0 10px;}
		.paginglist > li > label {display:block;padding:10px 30px;border-radius:10px;background:#ccc;cursor:pointer;}
		.paginglist > li:hover > label {background:#333;}
		
		[id="slide01"]:checked ~ .slidelist .slideitem {transform:translateX(0);animation:slide01 20s infinite;}
		[id="slide02"]:checked ~ .slidelist .slideitem {transform:translateX(-100%);animation:slide02 20s infinite;}
		[id="slide03"]:checked ~ .slidelist .slideitem {transform:translateX(-200%);animation:slide03 20s infinite;}
		[id="slide04"]:checked ~ .slidelist .slideitem {transform:translateX(-300%);animation:slide04 20s infinite;}
		
		@keyframes slide01 {
			0% {left:0%;}
			23% {left:0%;}
			25% {left:-100%;}
			48% {left:-100%;}
			50% {left:-200%;}
			73% {left:-200%;}
			75% {left:-300%;}
			98% {left:-300%;}
			100% {left:0%;}
		}
		@keyframes slide02 {
			0% {left:0%;}
			23% {left:0%;}
			25% {left:-100%;}
			48% {left:-100%;}
			50% {left:-200%;}
			73% {left:-200%;}
			75% {left:100%;}
			98% {left:100%;}
			100% {left:0%;}
		}
		@keyframes slide03 {
			0% {left:0%;}
			23% {left:0%;}
			25% {left:-100%;}
			48% {left:-100%;}
			50% {left:200%;}
			73% {left:200%;}
			75% {left:100%;}
			98% {left:100%;}
			100% {left:0%;}
		}
		@keyframes slide04 {
			0% {left:0%;}
			23% {left:0%;}
			25% {left:300%;}
			48% {left:300%;}
			50% {left:200%;}
			73% {left:200%;}
			75% {left:100%;}
			98% {left:100%;}
			100% {left:0%;}
		}
</style>
</head>

<body>
	<jsp:include page="header.jsp"/>	
	
	<div id="container">
		<div id="contents">
            <br><br>
            <div class="slidebox">
				<input type="radio" name="slide" id="slide01" checked>
				<input type="radio" name="slide" id="slide02">
				<input type="radio" name="slide" id="slide03">
				<input type="radio" name="slide" id="slide04">
				<ul class="slidelist">
					<li class="slideitem">
						<div>
							<label for="slide04" class="left"></label>
							<label for="slide02" class="right"></label>
							<a href="../menu/menu.jsp"><img class="slide1" src="../P_img/main3.png"></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide01" class="left"></label>
							<label for="slide03" class="right"></label>
							<a href="../menu/200.jsp"><img class="slide1" src="../P_img/main1.png"></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide02" class="left"></label>
							<label for="slide04" class="right"></label>
							<a href="../cs/fknotice.jsp"><img class="slide1" src="../P_img/main4.png"></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide03" class="left"></label>
							<label for="slide01" class="right"></label>
							<a href="../cs/fkcs.jsp"><img class="slide1" src="../P_img/main2.png"></a>
						</div>
					</li>
				</ul>
				<ul class="paginglist">
					<li>
						<label for="slide01"></label>
					</li>
					<li>
						<label for="slide02"></label>
					</li>
					<li>
						<label for="slide03"></label>
					</li>
					<li>
						<label for="slide04"></label>
					</li>
				</ul>
			</div>
        </div>
            <div>
                <table style="width: 82%;" class="table-borderless">
                    <tr>
                        <th id="weekBest">MD's 추천메뉴</th>
                    </tr>
                    <%
                    FkproductDAO dao = new FkproductDAO();
            		FkproductVO vo = dao.selectOne(7);       	
            		FkproductVO vo2 = dao.selectOne(11);       	
            		FkproductVO vo3 = dao.selectOne(14);       	
            		FkproductVO vo4 = dao.selectOne(17);       	
            		FkproductVO vo5 = dao.selectOne(24);       	
            		FkproductVO vo6 = dao.selectOne(25);       	
                    
            		FkcodeDAO dao2 = new FkcodeDAO();
            		FkcodeVO vo11 = dao2.selectOne2(vo.getHsno());
            		FkcodeVO vo12 = dao2.selectOne2(vo2.getHsno());
            		FkcodeVO vo13 = dao2.selectOne2(vo3.getHsno());
            		FkcodeVO vo14 = dao2.selectOne2(vo4.getHsno());
            		FkcodeVO vo15 = dao2.selectOne2(vo5.getHsno());
            		FkcodeVO vo16 = dao2.selectOne2(vo6.getHsno());
            		

            		DecimalFormat formatter = new DecimalFormat("###,###");
                    %>
                    <tr>
                        <td><a href="../menu/fkproductDetail.jsp?pno=<%=vo.getPno()%>"><img src="<%= vo.getPimg1() %>" alt=""></a></td>
                        <td><a href="../menu/fkproductDetail.jsp?pno=<%=vo2.getPno()%>"><img src="<%= vo2.getPimg1() %>" alt=""></a></td>
                        <td><a href="../menu/fkproductDetail.jsp?pno=<%=vo3.getPno()%>"><img src="<%= vo3.getPimg1() %>" alt=""></a></td>
                    </tr>
                    <tr>
                        <td><p><%=vo11.getHsname() %></p><p class="fs-5 fw-bold"><%= vo.getPname() %></p><p><%=formatter.format(vo.getPrice())%>원</p></td>
                        <td><p><%=vo12.getHsname() %></p><p class="fs-5 fw-bold"><%= vo2.getPname() %></p><p><%=formatter.format(vo2.getPrice())%>원</p></td>
                        <td><p><%=vo13.getHsname() %></p><p class="fs-5 fw-bold"><%= vo3.getPname() %></p><p><%= formatter.format(vo3.getPrice())%>원</p></td>
                    </tr>
                    <tr>
                        <td><a href="../menu/fkproductDetail.jsp?pno=<%=vo4.getPno()%>"><img src="<%= vo4.getPimg1() %>" alt=""></a></td>
                        <td><a href="../menu/fkproductDetail.jsp?pno=<%=vo5.getPno()%>"><img src="<%= vo5.getPimg1() %>" alt=""></a></td>
                        <td><a href="../menu/fkproductDetail.jsp?pno=<%=vo6.getPno()%>"><img src="<%= vo6.getPimg1() %>" alt=""></a></td>
                    </tr>
                    <tr>
                        <td><p><%=vo14.getHsname() %></p><p class="fs-5 fw-bold"><%= vo4.getPname() %></p><p><%= formatter.format(vo4.getPrice())%>원</p></td>
                        <td><p><%=vo15.getHsname() %></p><p class="fs-5 fw-bold"><%= vo5.getPname() %></p><p><%=formatter.format(vo5.getPrice())%>원</p></td>
                        <td><p><%=vo16.getHsname() %></p><p class="fs-5 fw-bold"><%= vo6.getPname() %></p><p><%= formatter.format(vo6.getPrice())%>원</p></td>
                    </tr>
                </table>
            </div>
		</div>	
	
	<jsp:include page="footer.jsp"/>
</body>

</html>