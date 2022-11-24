<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>FRESHKIT</title>
<link rel="shortcut icon" href="../images/mainlogo_footer.png">
 <link rel="stylesheet" type="text/css" href="fkwrite.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">

//단일이미지 미리보기
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	} 

function checkStar(){
	var rstarValue = "";
	var rstarValue = $("input[name=rstar]:checked").val();
	$("#view").empty();
	$("#view").append(rstarValue);
};


</script>
<style>
.rating { margin-top: 50px;}
.title {
	margin-left: 300px;
	margin-bottom: 50px;
	font-weight: bolder;
	width: 1000px;
	border-bottom: 4px solid #82ac64;
	padding: 20px 0px 36px;
	}

	</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<br><br>


		<h2 class="title">리뷰작성</h2>
	<div class="container1">
		<div class="container1-1">
			
			<div style="padding: 0px; width: 620px;">
				<form action="fkwriteOk.jsp" method="post" enctype="multipart/form-data">
				<%
					/* 로그인정보 가져오기 ------------------------------------- */
					Object obj = session.getAttribute("vo");
					
					int no = 0;
					
					if(obj == null){
						response.sendRedirect("../main/fkLogin.jsp");
					}else{
					
					FkcustomerVO vo5 = (FkcustomerVO)obj;
					no = vo5.getNo();
					
					FkcustomerDAO dao2 = new FkcustomerDAO(); // fkcustomer 테이블에 fkreview테이블에서 가져온 vo값 넣기
					FkcustomerVO vo2 = dao2.selectOne(vo5.getNo());
					
				/* ------------------------------------ */
				%>
				<div id="rating">
				<div class="jull">
					<div class="jull1">
						<label class="julltext1">아이디</label> 
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
								<input data-testid="input-box" id="" name="id"
									 type="text"  autofocus="autofocus" 
									class="jull2_3" value="<%=vo2.getId()%>" readonly style="border:none;">
									<input type="hidden" name="no" id="no" value="<%=vo2.getNo() %>" />
 							</div>
						</div>
					</div>
					
				</div>
				<%
					}
				%> 

				<div class="jull">
					<div class="jull1">
						<label class="julltext1">상품명</label> 
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
								<input data-testid="input-box" id="" name="retitle"
									type= "text" required class="jull2_3" >
							</div>
						</div>
					</div>
				</div>

				<div class="jull">
					<div class="jull1">
						<label class="julltext1" id="recontents">리뷰</label> 
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2" >
								<textarea name="recontents" id="recontents" style="width:450px; height: 150px;"></textarea>
								
							</div>
						</div>
					</div>
				</div>
				<br><br><br><br><br>
				<div class="jull">
					<div class="jull1">
						<label class="julltext1" id="reimg">이미지(필수)</label> 
						
					</div>
					<div class="jull2">
						<div class="jull2_1">
					<input style="display:block;" type="file" name="reimg" id="reimg" onchange="readURL(this);" > 
					<img id="preview" style="width:350px;"/>  
							
						</div>
					</div>
				</div>
			
				
		<!-- <table >
		<tr>
			<td>평점</td>
			<td style="margin-right:30px;">
 				<input type="radio" name="rstar" value="⭐⭐⭐⭐⭐">5점
     			<input type="radio" name="rstar" value="⭐⭐⭐⭐">4점
      			<input type="radio" name="rstar" value="⭐⭐⭐">3점
    			<input type="radio" name="rstar" value="⭐⭐">2점
     			<input type="radio" name="rstar" value="⭐">1점
  		</td>
			</tr>
 
  		</table> -->
  		
  
		
			<table class="rating">
			<tr>
			<td>평점</td>
			<td>
				<input type="radio" name="rstar" value="5" id="rate1"><label for="rate1">★</label>
				<input type="radio" name="rstar" value="4" id="rate2"><label for="rate2">★</label>
				<input type="radio" name="rstar" value="3" id="rate3"><label for="rate3">★</label>
				<input type="radio" name="rstar" value="2" id="rate4"><label for="rate4">★</label>
				<input type="radio" name="rstar" value="1" id="rate5"><label for="rate5">★</label>
			</td>
			</tr>
		
			</table>  
				<br> <br>

				<div class="btn">
					<a href="fkreview.jsp"><input type="button" class="btn btn-light" value="목록" /></a>
					<input type="submit" class="btn btn-success" value="리뷰 작성완료" onclick="checkStar()"/>
				</div>
				</div>
				
				</form>
				
				
				
				</div>
			</div>
		</div>
				
	
	
	<jsp:include page="../main/footer.jsp"/>


	
</body>
</html>