<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FRESHKIT</title>
<link rel="stylesheet" type="text/css"
	href="../css/common.css">

<link rel="stylesheet" type="text/css"
	href="../css/op.css">
<link rel="stylesheet" type="text/css"
	href="../css/pd.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="shortcut icon" href="../images/mainlogo_footer.png">
<style>
	.btnlogin {
	/* transition: all .2s;
              outline: 0; */
	border: 0px;
	padding: 10px;
	border-radius: 50%;
	color: #fff;
	}

	.btnlogin:active {
	position: relative;
	top: 2px;
	}

	.text {
	color: black;
	}
	.btn green:hover{
	background: green;
	}
</style>
</head>
<body>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<!-- header끝 -->


<div id="content" class="logc_content">

        <div class="login_wrap">
        <br>
<br>
<br>
<br>

            <h1 class="title">로그인</h1>

            <br>
            


            <!-- 회원로그인 -->
            <div id="logc_mem" class="login_cont">
                <div class="fieldset">
                    
                        <input type="hidden" name="captchaChkYn" value="">
                        
                            <legend class="hide">회원 로그인</legend>

                            <div class="login_input">
                                <!-- input -->
                                <form name="loginForm" action="fkLoginOk.jsp">
                                <dl class="in">
                                    <dd>
                                        <div class="input_wrap ui_inputfield">
                                            <input type="text" class="txt required" name="customerid" id="customerid" value=""
                                                placeholder="아이디를 입력해주세요" title="아이디를 입력해주세요." minlength="6" maxlength="21">
                                            
                                        </div>
                                    </dd>
                                </dl>
                                <dl class="in">
                                    <dt class="hide"><label for="mem_pass">비밀번호</label></dt>
                                    <dd>
                                        <div class="input_wrap ui_inputfield">
                                            <input type="password" class="txt required" name="customerpw" id="customerpw"
                                                placeholder="비밀번호 영문, 특수문자, 숫자혼합 8~16자" title="비밀번호를 입력해주세요."
                                                minlength="8" maxlength="17">
                                            
                                        </div>
                                    </dd>
                                </dl>
 							    <div class="desc_wrap">
   									<div class="find">
                                        <a href="fkFindId.jsp"
                                            >아이디 찾기</a>
                                        <a href="fkFindPw.jsp"
                                            >비밀번호 찾기</a>
                                    </div>
                                </div>

                        
								<!-- button -->
                                <div class="btn_wrap full" style="position: relative; top: 20px;">
                                    <button class="btn green" id="loginBtn" type="submit" ><span>로그인</span></button>
                                        
                                        <div style="position: relative; top: 10px;">
                                        <button class="btn green" onclick="location.href='fkJoin.jsp'; return false;">
                                        <span>회원가입</span></button></div>
                                </div>
                                </form>
                            </div>

                            <!-- 간편로그인 -->
                            <div class="easy_login" style="position: relative; bottom: 40px;">
                                
                                <ul>
                                    <button class="btnlogin" style="background:rgb(37, 15, 15); margin-right: 30px;"><i
                                            class="xi-3x xi-phone"></i></button>
                                    <button class="btnlogin" style="background:rgb(13, 13, 138); margin-right: 30px;"><i
                                            class="xi-3x xi-facebook"></i></button>
                                    <button class="btnlogin" style="background:rgb(45, 187, 45); margin-right: 30px;"><i
                                            class="xi-3x xi-naver"></i></button>
                                    <button class="btnlogin" style="background:yellow"><i
                                            class="xi-3x xi-kakaotalk text"></i></button>
                                </ul>
                            </div>



                        
                    
                </div>
            </div>
            </div>
            </div>
            
            <!-- //회원로그인 -->
            
            
<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- footer끝 -->


</body>
</html>