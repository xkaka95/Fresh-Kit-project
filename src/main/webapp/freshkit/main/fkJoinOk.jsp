
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
String name = request.getParameter("customername");
String gender = request.getParameter("customergender");
String email = request.getParameter("customeremail");
String post = request.getParameter("customerpost");
String address = request.getParameter("customeraddr");
String addressdetail = request.getParameter("customeraddrdetail");
String addr = null;
String phone = request.getParameter("customerphone");


FkcustomerDAO dao = new FkcustomerDAO();

FkcustomerVO vo = new FkcustomerVO();


vo.setGrade("회원");
vo.setId(id);
vo.setPw(pw);
vo.setName(name);
vo.setGender(gender);
vo.setEmail(email);
vo.setPost(post);

if(!address.equals("") && !addressdetail.equals("")){
	addr = address + "/" + addressdetail;
}
vo.setAddress(addr);
vo.setPhone(phone);


dao.insertOne(vo);

response.sendRedirect("fkLogin.jsp");
%>
<script>
}
</script>
 
</body>
</html>