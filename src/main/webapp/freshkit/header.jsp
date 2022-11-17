<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <link rel="stylesheet" type="text/css" href="header.css">

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
