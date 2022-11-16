<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main.jsp</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="header.css">
	<link rel="stylesheet" href="footer.css">
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
            top: 100%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        #weekBest {
            font-size: 30px;
            padding-right: 200px;
        }
		td>a>img {
			width: 350px;
			height: 400px;
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
	<header id="head">
		<div class="gnb_wrap">
			<div class="gnb_util">
				<div class="util_wrap">
					<ul>
						<li><a href="https://www.cjone.com/cjmweb/join.do?coopco_cd=7060&amp;brnd_cd=6130&amp;mcht_no=6130&amp;etc1=PC&amp;etc2=ckgs"
								target="_blank">회원가입</a></li>
						<li><a href="javascript:cj.login(null, null, null, 'gnb_login');">로그인</a></li>
						<li><a href="/pc/cs/csMain?wid1=gnb_cs">고객센터</a></li>
					</ul>
				</div>
			</div>
			<div class="gnb_menu">
				<h1 class="logo"><a href="main.jsp"><span class="hide">freshkit</span></a></h1>
	
				<ul class="list_gmenu">
	
					<li>
						<a href="/pc/cn/cookitIntro?wid1=gnb_intro" target="_self">FRESH KIT 소개</a>
					</li>
					<li>
						<a href="/pc/menu/menuList?dlUnstScheDd=ALL&amp;wid1=gnb_menu" target="_self">FRESH KIT 메뉴</a>
					</li>
					<li>
						<a href="/pc/rvw/review?wid1=gnb_review" target="_self">리뷰</a>
					</li>
					<li>
						<a href="/pc/event/eventMain?wid1=gnb_event" target="_self">공지사항</a>
					</li>
					<li>
						<a href="orderList.jsp" target="_self">MY프레시킷</a>
					</li>
	
				</ul>
	
				<div class="my_gmenu">
					<ul>
						<li class="g_od">
							<a href="/pc/order/cartList?wid1=gnb_cart">
															
								<span class="txt">장바구니</span>
							</a>
						</li>
						<li class="g_mu">
						<a href="/pc/menu/searchList?wid1=gnb_search_menu">
						<span class="txt">메뉴찾기</span>
						</a>
					</ul>
				</div>
			</div>
		</div>
	</header>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
							<a href=""><img class="slide1" src="../P_img/main3.png"></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide01" class="left"></label>
							<label for="slide03" class="right"></label>
							<a><img class="slide1" src="../P_img/main1.png"></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide02" class="left"></label>
							<label for="slide04" class="right"></label>
							<a><img class="slide1" src="../P_img/main4.png"></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide03" class="left"></label>
							<label for="slide01" class="right"></label>
							<a><img class="slide1" src="../P_img/main2.png"></a>
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
                        <th id="weekBest" span="3">주간베스트</th>
                    </tr>
                    <%
                    FkproductDAO dao = new FkproductDAO();
            		FkproductVO vo = dao.selectOne(1);       	
            		FkproductVO vo2 = dao.selectOne(2);       	
            		FkproductVO vo3 = dao.selectOne(3);       	
            		FkproductVO vo4 = dao.selectOne(4);       	
            		FkproductVO vo5 = dao.selectOne(5);       	
            		FkproductVO vo6 = dao.selectOne(6);       	
                    
            		String theme = null;
            		
            		if(vo.getHsno()==100){
            			theme = "한식";
            		}else if(vo.getHsno()==200){
            			theme = "양식";
            		}else if(vo.getHsno()==300){
            			theme = "중식/일식";
            		}else if(vo.getHsno()==400){
            			theme = "동남아";
            		}else if(vo.getHsno()==500){
            			theme = "분식/야식";
            		}else if(vo.getHsno()==600){
            			theme = "샐러드";
            		}else if(vo.getHsno()==700){
            			theme = "디저트";
            		}else if(vo.getHsno()==800){
            			theme = "반찬";
            		}else if(vo.getHsno()==900){
            			theme = "키즈";
            		}
            		
                    %>
                    <tr>
                        <td><a href="../project/orderList.html"><img src="<%= vo.getPimg1() %>" alt=""></a></td>
                        <td><a href="../project/orderList.html"><img src="<%= vo2.getPimg1() %>" alt=""></a></td>
                        <td><a href="../project/orderList.html"><img src="<%= vo3.getPimg1() %>" alt=""></a></td>
                    </tr>
                    <tr class="fw-bold">
                        <td><p><%=theme %></p><p class="fs-5"><%= vo.getPname() %></p><p><%= vo.getPrice() %></p></td>
                        <td><p><%=theme %></p><p class="fs-5"><%= vo2.getPname() %></p><p><%= vo2.getPrice() %></p></td>
                        <td><p><%=theme %></p><p class="fs-5"><%= vo3.getPname() %></p><p><%= vo3.getPrice() %></p></td>
                    </tr>
                    <tr>
                        <td><a href="../project/orderList.html"><img src="<%= vo4.getPimg1() %>" alt=""></a></td>
                        <td><a href="../project/orderList.html"><img src="<%= vo5.getPimg1() %>" alt=""></a></td>
                        <td><a href="../project/orderList.html"><img src="<%= vo6.getPimg1() %>" alt=""></a></td>
                    </tr>
                    <tr class="fw-bold">
                        <td><p><%=theme %></p><p class="fs-5"><%= vo4.getPname() %></p><p><%= vo4.getPrice() %></p></td>
                        <td><p><%=theme %></p><p class="fs-5"><%= vo5.getPname() %></p><p><%= vo5.getPrice() %></p></td>
                        <td><p><%=theme %></p><p class="fs-5"><%= vo6.getPname() %></p><p><%= vo6.getPrice() %></p></td>
                    </tr>
                </table>
            </div>
		</div>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<footer id="footer">        
        <div class="footer_wrap">
            <div class="footer_cont">
                <div class="fl_l">
                    <div class="logo"><img src="../images/mainlogo.png" alt=""></div>
                </div>
                <div class="fl_c">
                    <div class="menu">
                        <ul>
                            <li><a href="http://naver.com">이용약관</a></li>
                            <li class="bg"><a href="http://google.com">개인정보처리 방침</a></li>
                            <li><a href="http://daum.net">법적고지</a></li>
                            <li><a href="https://www.youtube.com/">사업자정보 확인</a></li>
                        </ul>
                    </div>
                    <div class="f_info">
                        <div class="f_info_cont">
                            <p>&nbsp;&nbsp;FRESHKIT(주)</p>
                            <p>&nbsp;&nbsp;대표이사  : 문소연, 연지해, 이규정, 임예린, 정태수</p>
                            <p>&nbsp;&nbsp;사업자등록번호 : 111-22-33333</p>
                            <p>&nbsp;&nbsp;주소 : 경기 성남시 분당구 판교역로 166 카카오 판교아지트 A동 3층 (지번) 백현동 532</p>
                            <p>&nbsp;&nbsp;통신판매업신고 분당구 제 77777호</p>
                            <br>
                            <p>&nbsp;&nbsp;개인정보보호책임자  : FRESHKIT</p>
                            <p>&nbsp;&nbsp;이메일 : freshkit@naver.com </p>
                            <p>&nbsp;&nbsp;제휴문의 : firstteam@naver.com</p>
                            <p>&nbsp;&nbsp;호스팅제공자 : 팀플은 처음이라 </p>
                            <p>&nbsp;&nbsp;FRESHKIT밀키트 판매</p>
                            <p>&nbsp;&nbsp;© FRESHKIT CORP.  ALL RIGHTS RESERVED.</p>
                        </div>
                    </div>
                </div>
                <div class="fl_r">           
                        <span class="line">freshkit 계열사 바로가기 ></span>                  
                    <div class="f_cs_info">
                        <div>
                            <p>고객 문의전화 1234-5678</p>
                            <p>10:00am- 5:00pm</p>
                            <p>lunch 1:00pm - 2:00pm</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>

</html>