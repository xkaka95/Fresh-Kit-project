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
			height: 1015px;
		}

		#side1 {
			background-color: #d9e2ae;
			width: 300px;
			height: 100%;
			float: left;
			font-family: 'Noto Sans KR', sans-serif;
		}
		#side1>p {
			padding-bottom: 10px;
			padding-left: 10px;
		}
		#header{

			font-family: 'Noto Sans KR', sans-serif;
		}
		#p1 {
			font-size: 35;
			font-weight: 600;
			padding-left: 10;
		}
		#p2 {
			font-size: 35;
			font-weight: 600;
			padding-left: 350;
		}
		#header>ul {
			padding-left: 0px;

		}
		#contents {
			height: 100%;
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
			position: relative;
			text-align: center;
            margin-top: 300px;
            top: 90%;
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
        .bullets{
            position: absolute;
            left: 50%; /* 가로로 가운데 정렬 */
            transform: translateX(-50%);
            bottom: 20px; /* 슬라이드 밑에서 20px 간격 띄움 */
            z-index: 2; /* 슬라이드 위에 보이도록 레이어 순위를 높임 */
        }
        .bullets label{
            display: inline-block; /* 한 줄로 불릿 나열*/
            border-radius: 50%; /* 원형 불릿으로 처리 */
            background-color: rgba(0,0,0,0.55);
            width: 20px; /* 불릿 너비 */
            height: 20px; /* 불릿 높이 */
            cursor: pointer;
        }        
        .slider{
            width: 100%;
            height: 640px;
            position: relative;
            margin: 0 auto;
        }
        .slider input[type=radio]{
            display: none;
        }
        .slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
            background-color: #fff;
        }
        .slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
            background-color: #fff;
        }
        .slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
            background-color: #fff;
        }
        .slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
            background-color: #fff;
        }
        .slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
            opacity: 1;
            transition: 1s;
            z-index: 1;
        }
        .slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
            opacity: 1;
            transition: 1s;
            z-index: 1;
        }
        .slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
            opacity: 1;
            transition: 1s;
            z-index: 1;
        }
        .slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
            opacity: 1;
            transition: 1s;
            z-index: 1;
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
	</style>
</head>

<body onload="show()">
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
				<h1 class="logo"><a href="header.html"><span class="hide">freshkit</span></a></h1>
	
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
						<a href="/pc/my/myMain?wid1=gnb_my" target="_self">MY프레시킷</a>
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
            <div class="slider">
                <input type="radio" name="slide" id="slide1" checked>
                <input type="radio" name="slide" id="slide2">
                <input type="radio" name="slide" id="slide3">
                <input type="radio" name="slide" id="slide4">
                <ul id="imgholder" class="imgs">
                    <li><img src="../P_img/main1.jpg"></li>
                    <li><img src="../P_img/main2.jpg"></li>
                    <li><img src="../P_img/main3.jpg"></li>
                </ul>
                <div class="bullets">
                    <label for="slide1">&nbsp;</label>
                    <label for="slide2">&nbsp;</label>
                    <label for="slide3">&nbsp;</label>
                    <label for="slide4">&nbsp;</label>
                </div>
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
                    	
                    %>
                    <tr>
                        <td><a href="../project/orderList.html"><img src="<%= vo.getPimg1() %>" alt=""></a></td>
                        <td><a href="../project/orderList.html"><img src="<%= vo.getPimg1() %>" alt=""></a></td>
                        <td><a href="../project/orderList.html"><img src="<%= vo.getPimg1() %>" alt=""></a></td>
                    </tr>
                    <tr>
                        <td>한식<br><%= vo.getPname() %><br><%= vo.getPrice() %></td>
                        <td>한식<br><%= vo.getPname() %><br><%= vo.getPrice() %></td>
                        <td>한식<br><%= vo.getPname() %><br><%= vo.getPrice() %></td>
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