<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modify.jsp</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
            height: 500px;
            max-width: 850px;
			position: absolute;
			top: 300px;
			left: 500px;
            padding-left: 100px;
            padding-top: 50px;
            padding-bottom: 50px;
        }

        #addrSearch {
            width: 70px;
            font-family: 'Noto Sans KR', sans-serif;
        }

        #success {
            width: 200px;
            height: 40px;
            font-family: 'Noto Sans KR', sans-serif;
            position:absolute;
            top: 820px;
			left: 800px;
            font-size: 16;
            border-top: 0px;       	
            padding-top: 0px;         	
            padding-bottom: 1px;         	
        }

		#tr1>td {
			height: 20px;
		}

		footer {
			height: 290px;
			background-color: blanchedalmond;
		}
		
		#addrsSearch {
			width: 100px;
			height: 28px;
			padding-top: 0px;
			padding-bottom: 0px;
			margin-bottom: 5px;
		}
		
		#gender {
			display: none;
		}
		
		#noneno {
			/* display: none; */
		}
	</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">


	$(function(){
		
		$("#success").on("click", function(){
			
			var gender = document.getElementById("gender");
			
			gender.value = $('input[name="gen"]:checked').val();
			
			if($.trim($("#name").val())==''){
		      	alert("이름을 입력해주세요.");
		      	return false;
	    	}else if($.trim($("#email1").val())==''||$.trim($("#email2").val())=='') {
	    		alert("이메일을 입력해주세요.");
	    		return false;
	    	}else if($.trim($("#post").val())=='') {
	    		alert("우편번호를 입력해주세요.");
	    		return false;
	    	}else if($.trim($("#addrs1").val())==''||$.trim($("#addrs2").val())==''||$.trim($("#addrs3").val())=='') {
	    		alert("주소를 입력해주세요.");
	    		return false;
	    	}else if($.trim($("#phone").val())=='') {
	    		alert("휴대전화를 입력해주세요.");
	    		return false;
	    	}else if($.trim($("#gender").val())==''){
	    		alert("성별을 선택해주세요.");
	    		return false;
	    	}
			
			$("#modifyNext").submit();
			
		})
	})
	function search() {
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
	                    document.getElementById("addrs3").value = extraAddr;
	                
	                } else {
	                    document.getElementById("addrs3").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('post').value = data.zonecode;
	                document.getElementById("addrs1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addrs2").focus();
	            }
	        }).open();
	    }
	


	function changeEmail(){
		var email = document.getElementById("emailSelect");
		
		var email2 = document.getElementById("email2");
		
		email2.value = email.value;
	};

</script>
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
				<h1 class="logo"><a href="header.html"><span class="hide">COOKIT</span></a></h1>
	
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
						<!--                        <li class="g_my"><a href="/pc/my/myMain"><span class="hide">마이 쿡킷 페이지로 이동</span></a></li> 0701 숨김처리 -->
						<li class="g_od">
							<a href="/pc/order/cartList?wid1=gnb_cart">
															
								<span class="txt">장바구니</span>
							</a>
						</li>
						<li class="g_mu"><a href="/pc/menu/searchList?wid1=gnb_search_menu"><span
									class="txt">메뉴찾기</span>
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
			<p id="p2">개인정보확인/수정</p>
			<form action="modifyOk.jsp" method="post" id="modifyNext">
			<%
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				
				/* String nno = request.getParameter("no");
				
				int no = Integer.parseInt(nno); */
				
				int no = 18; // test용 임시값 (추후삭제)
				
				FkcustomerDAO dao = new FkcustomerDAO();
				
				FkcustomerVO vo = dao.selectOne(no);
			
				int at = vo.getEmail().indexOf("@");
			%>
            <table class="table table-borderless" style="width: 850px;">
                <tr id="noneno"> <!-- test후에 안보이게 css display:none; -->
                    <td>고객번호</td>
                    <td><input type="text" name="no" id="no" value="<%=no%>" readonly></td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="id" id="id" value="<%=vo.getId()%>" readonly></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" id="name" value="<%=vo.getName()%>" readonly></td>
                </tr>
    
                <tr>
                    <td>비밀번호</td>
                    <td>*******</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="email1" id="email1" value="<%=vo.getEmail().substring(0,at)%>"> @ <input type="text" name="email2" id="email2" value="<%=vo.getEmail().substring(at+1)%>"> 
                        <select name="emailSelect" id="emailSelect" onchange="changeEmail(this.value)">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="직접입력">직접입력</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>우편번호</td>
                    <td><input type="text" name="post" id="post" value="<%=vo.getPost() %>" style="width: 100px"></td>
                </tr>
                <tr>
                	<td>현재 주소</td>
                	<td><input type="text" name="" id="" value="<%=vo.getAddress() %>" style="width: 450px;"></td>
                </tr>
                <tr>
                	<td>수정할 주소</td>
                	<td><input type="text" name="addrs1" id="addrs1" style="width: 450px;"/></td>
                </tr>
                <tr>
                	<td></td>
                	<td><input type="text" name="addrs2" id="addrs2" style="width: 223px;" /> <input type="text" name="addrs3" id="addrs3" style="width: 223px;"/> <input class="btn btn-light btn-outline-dark" type="button" value="주소찾기" id="addrsSearch" onclick="search()"></td>
                </tr>
                <tr>
                    <td>휴대전화</td>
                    <td><input type="text" name="phone" id="phone" value="<%=vo.getPhone()%>"></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td>
                        <input type="radio" name="gen" id="gen" value="남자" />남
                        <input type="radio" name="gen" id="gen" value="여자" />여
                    </td>
                    <td><input type="text" name="gender" id="gender" value=""/></td>
                </tr>

            </table>

            </form>                
                <p class="text-center">
                   	<input type="button" class="btn btn-success" value="회원정보 수정완료" id="success" />
                </p>
                
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