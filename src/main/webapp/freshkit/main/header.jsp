<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <link rel="stylesheet" type="text/css" href="../css/header.css">

<header id="head">
    <div class="gnb_wrap">
        <div class="gnb_util">
            <div class="util_wrap">
            <%
	            /* 로그인정보 가져오기 ------------------------------------- */
				Object obj = session.getAttribute("vo");
				
				if(obj == null){
			%>
                <ul>
                    <li><a href="../main/fkJoin.jsp">회원가입</a></li>
                    <li><a href="../main/fkLogin.jsp">로그인</a></li>
                    <li><a href="../cs/fkcs.jsp">고객센터</a></li>
                </ul>
			
			<%
				}else{
				
				FkcustomerVO vo5 = (FkcustomerVO)obj;
								
				
			%>
				<ul>
					<li><a href="../mypage/orderList.jsp"><%=vo5.getName() %>님</a></li>
					<li><a href="../main/fkLogout.jsp">로그아웃</a></li>
					<li><a href="../cs/fkcs.jsp">고객센터</a></li>
				</ul>			
			<%
				}
				/* ------------------------------------ */
            %>
            </div>
        </div>
        <div class="gnb_menu">
            <h1 class="logo"><a href="../main/main.jsp"><span class="hide">freshkit</span></a></h1>

            <ul class="list_gmenu">

                <li>
                    <a href="../info/info.jsp" target="_self">FRESH KIT 소개</a>
                </li>
                <li>
                    <a href="../menu/menu.jsp" target="_self">FRESH KIT 메뉴</a>
                </li>
                <li>
                    <a href="../review/fkreview.jsp" target="_self">리뷰</a>
                </li>
                <li>
                    <a href="../cs/fknotice.jsp" target="_self">공지사항</a>
                </li>
                <li>
                    <a href="../mypage/orderList.jsp" target="_self">MY프레시킷</a>
                </li>

            </ul>
				<input type="hidden" name="no" />
            <div class="my_gmenu">
                <ul>
                    <li class="g_od">
                        <a href="../cart/fkviewcart.jsp">
                                                        
                            <span class="txt">장바구니</span>
                        </a>
                    </li>
                    <li class="g_mu">
                    <a href="../menu/menu.jsp">
                    <span class="txt">메뉴찾기</span>
                    </a>
                </ul>
            </div>
        </div>
    </div>
</header>
