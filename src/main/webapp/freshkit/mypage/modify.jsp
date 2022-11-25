<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FRESHKIT</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="../css/header.css">
	<link rel="stylesheet" href="../css/footer.css">
	<link rel="shortcut icon" href="../images/mainlogo_footer.png">
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap');

		body {
			height: 1015px;
		}

		#side1 {
		background-color: #d9ffb2;
		width: 300px;
		height: 100%;
		min-height: 1500px;
		float: left;
		font-family: 'Noto Sans KR', sans-serif;
		clear: both;
	
}
#footer{
	clear:both;
}

#side1>p {
	padding-bottom: 10px;
	padding-left: 10px;
	margin-left: 20px;
	margin-bottom: 5px;
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
			
	    	if($.trim($("#email1").val())==''||$.trim($("#email2").val())=='') {
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
	<jsp:include page="../main/header.jsp"/>
	
	<div id="container">
	
		<jsp:include page="sidebar1.jsp"/>
		
		<div id="contents">
            <br><br>
			<p id="p2">개인정보확인/수정</p>
			<form action="modifyOk.jsp" method="post" id="modifyNext">
			<%
					request.setCharacterEncoding("UTF-8");
					response.setContentType("text/html;charset=UTF-8");
					
					/* String nno = request.getParameter("no");
					
					int no = Integer.parseInt(nno); */
					/* 로그인정보 가져오기 ------------------------------------- */
					Object obj = session.getAttribute("vo");
					
					int no = 0;
					
					if(obj == null){
						response.sendRedirect("../main/fkLogin.jsp");
					}else{
					
					FkcustomerVO vo5 = (FkcustomerVO)obj;
					no = vo5.getNo();
					}
					/* ------------------------------------ */
				
					FkcustomerDAO dao = new FkcustomerDAO();
					
					FkcustomerVO vo = dao.selectOne(no);
					
					if(vo!=null){									
				
					int at = vo.getEmail().indexOf("@");
			
			%>
			
            <table class="table table-borderless" style="width: 850px;">
                <tr id="noneno"> <!-- test후에 안보이게 css display:none; -->
                    <td></td>
                    <td><input type="hidden" name="no" id="no" value="<%=no%>" readonly></td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td><%=vo.getId()%></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><%=vo.getName()%></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="email1" id="email1" value="<%=vo.getEmail().substring(0,at)%>"> @ <input type="text" name="email2" id="email2" value="<%=vo.getEmail().substring(at+1)%>"> 
                        <select name="emailSelect" id="emailSelect" onchange="changeEmail(this.value)">
                            <option value="직접입력">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                        </select>
                    </td>
                </tr>
                <tr>
                	<td>현재 주소</td>
                	<td><input type="text" name="" id="" value="<%=vo.getAddress() %>" style="width: 450px;"></td>
                </tr>
                <tr>
                    <td>우편번호</td>
                    <td><input type="text" name="post" id="post" value="<%=vo.getPost() %>" style="width: 100px"></td>
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
                        <input type="radio" name="gen" id="gen" value="남" />남
                        <input type="radio" name="gen" id="gen" value="여" />여
                    </td>
                    <td><input type="text" name="gender" id="gender" value=""/></td>
                </tr>

            </table>

            </form>
            <%
					}else{
			%>
					<script>
						location.href= "login.jsp";
					</script>
			<%
					}
            %>                
                <p class="text-center">
                   	<input type="button" class="btn btn-success" value="회원정보 수정완료" id="success" />
                </p>
                
		</div>

	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>

</html>