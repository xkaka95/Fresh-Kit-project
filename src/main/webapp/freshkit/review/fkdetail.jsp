<%@page import="kr.co.freshkit.vo.FkreviewVO"%>
<%@page import="kr.co.freshkit.dao.FkreviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fkdetail.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- fkwrite css -->
<link rel="stylesheet" type="text/css" href="fkwrite.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript">
</script>

</head>
<body>

<jsp:include page="../main/header.jsp"/>
	<%
	
		String num = request.getParameter("reno");
		if(num != null) {
			int reno = Integer.parseInt(num);
			FkreviewDAO dao = new FkreviewDAO();
			FkreviewVO vo = dao.selectOne(reno);
	%>
	<div class="container1">
		<div class="jointitle">리뷰상세</div>
		<div class="container1-1">
			
			<div style="padding: 0px; width: 620px;">
				<form action="fkwriteOk.jsp" method="post" >
				
				<div id="rating">
				<div class="jull">
					<div class="jull1">
						<label class="julltext1">고객번호</label> 
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
								<input type="text" disabled="disabled" style="width:450px; height:50px;" name="no" id="" value="<%= vo.getNo() %>" />
								
							</div>
						</div>
					</div>
					
				</div>


				<div class="jull">
					<div class="jull1">
						<label class="julltext1">제목(상품명)</label> 
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
								<input type="text" disabled="disabled" style="width:450px; height:50px;" name="retitle" id="" value="<%=vo.getRetitle() %>" />
								
							</div>
						</div>
					</div>
				</div>

				


				<div class="jull">
					<div class="jull1">
						<label class="julltext1" id="recontents">내용</label> 
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2" >
							<textarea  name="recontents" id="recontents" disabled="disabled" 
							style="width:450px; height: 150px;" ><%= vo.getRecontents() %></textarea>
							</div>
						</div>
					</div>
				</div>
				<br><br><br><br><br>
				
				<div class="jull">
					<div class="jull1">
						<label class="julltext1" id="reimg">이미지</label> 
					</div>
					<div class="jull2">
						<div class="jull2_1">
							<div class="jull2_2">
							<%-- <input type="text" disabled="disabled" style="width:450px; height:50px;" name="reimg" id="" value="<%=vo.getReimg() %>" /> --%>
					<img src="<%=vo.getReimg() %>"  alt="" style="width:100px; height:150px;"/> 
						
							</div>
						</div>
					</div>
				</div>
				<br><br><br>
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
					<a href="fkmodify.jsp?reno=<%=vo.getReno() %>"><input type="button" class="btn btn-success" value="수정"/></a>
					<a href="fkdeleteOk.jsp?reno=<%=vo.getReno() %>"><input type="button" class="btn btn-warning" value="삭제" /></a>
				</div>
				</div>
				</form>
				</div>
				<%
			}
				%>
			</div>
		</div>
	
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>