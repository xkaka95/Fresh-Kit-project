<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>


<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="kr.co.freshkit.vo.FkcartVO"%>
<%@page import="kr.co.freshkit.dao.FkcartDAO"%>
<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" type="text/css" href="footer.css">
    <link rel="stylesheet" type="text/css" href="footer.css">
    <link rel="stylesheet" type="text/css" href="header.css">
    <title>freshkit</title>
</head>

<body>

    <!-- header -->
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
                            <a href="/pc/menu/searchList?wid1=gnb_search_menu"></a>
                            <span class="txt">메뉴찾기</span>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
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
            font-family: "맑은고딕";
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











        li {
            list-style: none;
        }

        a {
            color: inherit;
            text-decoration: none;
        }







        .txt_wrap {
            font-family: "맑은고딕";
            font-weight: 400;
            font-size: 18px;
            line-height: 23px;
            margin: 10px 0px 10px 0px;
        }


        .delete_button{
            margin: 30px 0 0px 50px;
            width: 960px;
            text-align: left;
           
        }
        /*==========================table============================================*/
        #cart_table {

            margin: 30px 0 50px 50px;
            width: 960px;
            text-align: left;

            border-bottom: 1px rgb(174, 174, 174) solid;
            border-left: 1px rgb(174, 174, 174) solid;
            border-right: 1px rgb(174, 174, 174) solid;
            border-top: 1px rgb(174, 174, 174) solid;

        }

        /*==========================thead============================================*/

        #cart_table thead {
            vertical-align: middle;
            font-size: 45px;
            text-align: center;
            font-family: "맑은고딕";
            height: 50px;
        }

        #cart_table thead input {
            vertical-align: middle;

        }

        .pro_count_all {
            text-align: left;
            font-size: 25px;
            vertical-align: middle;

        }

        /*==========================tbody============================================*/
        .price_left_pname,
        .price_left_price {
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
            width: 350px;
            vertical-align: top;
        }

        table img {
            width: 80px;
            height: 80px;

        }



        .pro_count_text {
            width: 150px;

        }

        .pro_count_text>input {
            text-align: center;
            margin-left: 150px;

            width: 70px;

        }

        .count_pro_btn {
            width: 50px;
            text-align: left;
        }

        input.form-check-input {
            width: 20px;
            height: 20px;


        }




        #cart_table td {
            font-size: 15px;
            vertical-align: middle;

        }

        .img_pro {
            text-align: right;

        }

        .pro_count_payment {
            text-align: center;
            width: 150px;
        }

        .table_null {
            height: 20px;
        }

        /*==========================tbody============================================*/
        .tfoot_gray {
            border-top: 1px solid;
            background-color: rgb(236, 236, 236);
            text-align: center;
            vertical-align: middle;
            height: 100px;
            font-weight: 500px;

        }

        /*==========================big_table============================================*/
        .big_cart_sub {
            margin: 30px 0 50px 50px;
            width: 960px;
            text-align: center;
            margin-top: 150px;
            border-top: 2px solid black;
            border-bottom: 1px solid rgb(170, 170, 170);
        }

        .big_cart_table {
            margin-top: 50px;
            margin-bottom: 50px;
            width: 960px;
            text-align: center;
            vertical-align: middle;
            font-weight: 600;
            


        }

        .big_table_price {
            font-size: 50px;
        }

        .big_price_red {
            color: red;
        }

        .button_all {
            margin-left: 70px;
            margin-top: 100px;
            margin-bottom: 100px;
        }

        .button_all button {
            width: 200px;
            margin: 10px;
            height: 70px;
        }

        .big_cart_table .plus{
            font-size: 35px;
        }
        /*==========================다른============================================*/


       
    </style>


    <body>
        <section id="container">
            <div id="content" class="pd_wrap pd_mu_wrap">

                <div class="olki_list_wrap">
                    <!--inner단-->


                    <!--1단-->
                    <div id="content" class="top_sec">
                        <h2>장바구니</h2>

                    </div>

                    <div class="product_sub_sec2">
                        <div class="container text-center">
                            <div class="delete_button">
                                <button type="button" class="btn btn-outline-secondary">선택 삭제</button>
                                <button type="button" class="btn btn-outline-secondary">전체 삭제</button>
                            </div>
                            <table class="table table-borderless" id="cart_table">
                                <thead>
                                    <tr>
                                        <th rowspan="2"><input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckDefault" checked></th>
                                        <th colspan="2" class="pro_count_all">총 n/n개</th>

                                    </tr>
                                </thead>
                                <tbody class="table-group-divider">
                                <%
		//현재 세션에서 cart 속성 가져오기
		Object obj = session.getAttribute("cart");
		// null 이 아니라면
		if (obj != null) {
			ArrayList<Integer> list = (ArrayList<Integer>) obj;
			out.println(list);

			//ArrayList로 형변환
			//상품번호, 수량
			// HashMap

			HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();

			for (int x : list) {
				//x번 상품이 존재하면 
				if (map.containsKey(x)) {
			//있으면
			map.put(x, map.get(x) + 1);
			//x(상품명) : (상품명의 value)+1값 리턴
				} else {
			map.put(x, 1);
			//없으면 1개
				}
			}
			out.println("map : " + map);

			//dao 객체를 생성
			FkproductDAO dao = new FkproductDAO();

			//db에서 상품번호로 vo 객체 가져오기

			//키들만 모음으로 가져오기

			//맵에서 키값만 화면에 출력
			Set<Integer> set = map.keySet();

			Iterator<Integer> it = set.iterator();

			while (it.hasNext()) {
				int key = it.next();
				//out.println("<h3>"+key+"</h3>");
				FkproductVO vo = dao.selectOne(key);

				//out.println(vo.getPname() + " : " + map.get(key));
				int cnt = map.get(key);
				
		%>
                                    <tr class="table_null"></tr>
                                    <tr>
                                        <td rowspan="2" class="check_pro"><input class="form-check-input"
                                                type="checkbox" value="" id="flexCheckDefault" checked></td>
                                        <td rowspan="2" class="img_pro">
                                        <img
                                                src="https://img.cjcookit.com/images/file/product/673/20221103134103865.jpg"
                                                alt=""></td>
                                        <td class="price_left_pname"><%=vo.getPname() %></td>
                                        <td rowspan="2" class="pro_count_text">


                                            <input type="text" class="form-control count_pro_btn"
                                                id="cart_pcount" value="<%=cnt%>">

                                        </td>
                                        <td rowspan="2">
                                            <div class="btn-group" role="group" aria-label="Basic outlined example">
                                                <button type="button" id="minus_count" class="btn btn-outline-dark" onclick="minuscount()">-</button>
                                                <button type="button" id="plus_count" class="btn btn-outline-dark" onclick="pluscount()">+</button>

                                            </div>
                                        </td>
                                        <td rowspan="2" class="pro_count_payment"><%=cnt * (Math.round(vo.getPrice() * (1 - vo.getDcratio() * 0.01)))%> %></td>
                                    </tr>

                                    <tr>

                                        <td class="price_left_price">15,900</td>

                                    </tr>
                                    <tr class="table_null"></tr>
                                
                                <%
		}
		}
		%>
<!-- =============================== =============================================================================================-->
                                    
                                </tbody>
                                <tfoot class="tfoot_gray">
                                    <tr>
                                        <td colspan="6">
                                            <h5>상품금액 62,000 + 배송비 0원 = 총 62,000원</h5>
                                        </td>

                                    </tr>
                                </tfoot>
                            </table>


                            <div class="big_cart_sub">
                                <table class="table big_cart_table table-borderless">

                                    <tbody>
                                        <tr class="big_table_th">

                                            <td>총 상품금액</td>
                                            <td rowspan="2" class="plus">-</td>
                                            <td>총 할인금액</td>
                                            <td rowspan="2" class="plus">+</td>
                                            <td>총 배송비</td>
                                            <td rowspan="2" class="plus">=</td>
                                            <td>총 결제예정금액</td>

                                        </tr>
                                        <tr class="big_table_price">
                                            <td>62,000원</td>

                                            <td>0원</td>

                                            <td>0원</td>

                                            <td class="big_price_red">18,900원</td>
                                        </tr>

                                    </tbody>
                                </table>



                            </div>

                            <div class="button_all ">
                                <button type="button" class="btn btn-outline-dark btn-lg">
                                    선물하기
                                </button>

                                <button type="button" class="btn btn-outline-dark btn-lg">
                                    선택주문하기
                                </button>

                                <button type="button" class="btn btn-success btn-lg">
                                    전체주문하기</button>
                                </button>

                            </div>


                        </div>


                    </div>


                </div>

                <!--inner단-->
            </div>
        </section>
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
                                <p>&nbsp;&nbsp;대표이사 : 문소연, 연지해, 이규정, 임예린, 정태수</p>
                                <p>&nbsp;&nbsp;사업자등록번호 : 111-22-33333</p>
                                <p>&nbsp;&nbsp;주소 : 경기 성남시 분당구 판교역로 166 카카오 판교아지트 A동 3층 (지번) 백현동 532</p>
                                <p>&nbsp;&nbsp;통신판매업신고 분당구 제 77777호</p>
                                <br>
                                <p>&nbsp;&nbsp;개인정보보호책임자 : FRESHKIT</p>
                                <p>&nbsp;&nbsp;이메일 : freshkit@naver.com </p>
                                <p>&nbsp;&nbsp;제휴문의 : firstteam@naver.com</p>
                                <p>&nbsp;&nbsp;호스팅제공자 : 팀플은 처음이라 </p>
                                <p>&nbsp;&nbsp;FRESHKIT밀키트 판매</p>
                                <p>&nbsp;&nbsp;© FRESHKIT CORP. ALL RIGHTS RESERVED.</p>
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