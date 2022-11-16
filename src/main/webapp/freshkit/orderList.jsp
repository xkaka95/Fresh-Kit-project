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
			height: 1015px;
		}

		#side1 {
			background-color: #d9e2ae;
			width: 300px;
			height: 1200px;
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
            width: 1200px;
            max-width: 1280px;
            min-width: 1280px;
			position: absolute;
			text-align: center;
			top: 300px;
            left: 400px;
        }
		td>img {
			width: 150px;
			height: 150px;
		}
		#tr1>td {
			height: 20px;
		}

		footer {
			height: 290px;
			background-color: blanchedalmond;
		}
		div#container {
			height: 100%;
            padding-bottom: 300px;
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
		<div id="side1">
            <br><br>
			<p id="p1">MY프레시킷</p><br><br>
			<p><a href="orderList.jsp">주문목록/배송조회</a></p>
			<p><a href="#">장바구니</a></p>
			<p><a href="#">QnA</a></p>
			<p><a href="modify.jsp">개인정보확인/수정</a></p>
			<p><a href="withdrawal.jsp">회원탈퇴</a></p>
		</div>
		<div id="contents">
            <br><br>
			<p id="p2">주문목록/배송조회</p>
            <table style="width: 70%;" id="container" class="table align-middle">
				<tr class="table-light">
					<th>상품이미지</th>
					<th>상품명</th>
					<th>주문일자</th>
					<th>주문번호</th>
					<th>주문금액(수량)</th>
					<th>주문상태</th>
				</tr>
				<tr>
					<td><img src="../images/coffee1.jpg" alt=""></td>
					<td>맛있는커피</td>
					<td>2022/11/14</td>
					<td>202211141551</td>
					<td>5000(1)</td>
					<td>배송중</td>
				</tr>
				<tr>
					<td><img src="../images/coffee1.jpg" alt=""></td>
					<td>맛있는커피</td>
					<td>2022/11/14</td>
					<td>202211141551</td>
					<td>5000(1)</td>
					<td>배송중</td>
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