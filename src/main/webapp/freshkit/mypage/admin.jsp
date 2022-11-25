<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="adminCheck.jsp" %>
<%
	
	List<FkcustomerVO> list = dao.selectAll2();
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#allSelect").change(function(){
		if(this.checked){
			$(".check").prop("checked",true);
		}else{
			$(".check").prop("checked",false);
		}
	});
	
	
	$("#checkForm").submit(function(){
		if($(".check").filter(":checked").length==0){
			alert("관리할 회원을 선택해주세요.");
			return false;
		}
	});
});
</script>
<style>
.t1{
	margin: 50px auto;
	width: 1400px;
	font-size: 14px;
	text-align: center;
}
h1{
margin:30px;
font-size: 35px; 


}

</style>
</head>
<body>
<h1 align="center">회원관리</h1>
<form action="adminCustomerRemove.jsp" method="post" id="checkForm">
<table align="center" border="1" cellspacing="2" class="table table-hover t1">
<tr bgcolor="black">
	<th width="200"><input  type="checkbox" id="allSelect" /></th>
	<th width="200" style="color:white">고객번호</th>
	<th width="140" style="color:white">등급</th>
	<th width="140" style="color:white">아이디</th>
	<th width="140" style="color:white">비밀번호</th>
	<th width="140" style="color:white">이름</th>
	<th width="140" style="color:white">성별</th>
	<th width="140" style="color:white">이메일</th>
	<th width="1000" style="color:white">주소</th>
	<th width="140" style="color:white">우편번호</th>
	<th width="140" style="color:white">휴대전화</th>
</tr>
<% for(FkcustomerVO vo : list){%>
<tr>
<td width="140" align="center">
	<%if(vo.getGrade().equals("관리자")){ %>
	접근불가
	<%}else{ %>
	<input type="checkbox" name="checkId" value="<%=vo.getId()%>" class="check" />
	<% } %>
</td>
	<td width="140"><%=vo.getNo() %></td>
	<td width="140"><%=vo.getGrade() %></td>
	<td width="140"><%=vo.getId() %></td>
	<td width="140"><%=vo.getPw() %></td>
	<td width="140"><%=vo.getName() %></td>
	<td width="140"><%=vo.getGender() %></td>
	<td width="140"><%=vo.getEmail() %></td>
	<td width="1100"><%=vo.getAddress() %></td>
	<td width="200"><%=vo.getPost() %></td>
	<td width="140"><%=vo.getPhone() %></td>
</tr>
<% }%>
</table>
<table align="center">
<tr><td>&nbsp;</td></tr>
<tr align="center">
	<td><button  class="btn btn-dark" type="submit">회원삭제</button></td>
</tr>
</table>
</form>
</body>
</html>