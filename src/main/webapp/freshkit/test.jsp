<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("button[id='allDelete']").on("click", function(){
		
		var frm = document.frm;
		
		document.frm.action="cart.jsp";
		document.frm.method="get";
		document.frm.submit();	
		
	})		
})
</script>
</head>
<body>
	<form action="" name="frm">
     <button type="button" class="btn btn-outline-secondary" id="allDelete">전체 삭제</button>
	</form>
</body>
</html>