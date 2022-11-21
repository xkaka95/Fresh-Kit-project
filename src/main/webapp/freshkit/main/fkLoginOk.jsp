
<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("customerid");
String pw = request.getParameter("customerpw");

//System.out.println(id);
//System.out.println(pw);

FkcustomerDAO dao = new FkcustomerDAO();

FkcustomerVO vo = dao.isExists(id,pw);



if(vo==null){
	%>
	<script type="text/javascript">
	alert("아이디와 비밀번호를 확인해주세요!");
	location.href="../main/fkLogin.jsp";
	</script>
	<%
	
}else{
	%>
	<script type="text/javascript">
	alert("Freshkit에 오신걸 환영합니다!");
	<%
	session.setAttribute("vo",vo);
	%>
	location.href="../main/main.jsp";
	
	</script>
	<%
	}
	%>


</body>
</html>