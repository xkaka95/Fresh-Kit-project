<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
FkcustomerVO person = (FkcustomerVO)session.getAttribute("vo");

	if(person == null){
		response.sendRedirect("../main/fkLogin.jsp");
	}else{

//System.out.println(person);
//System.out.println(id);
//System.out.println(pw);

	System.out.println(person.getGrade());
	System.out.println(person.getId());
	
		
	
%>

    <div id="side1">
        <br><br>
		<p id="p1">MY프레시킷</p><br><br>
		<p><a href="../mypage/orderList.jsp">주문목록/배송조회</a></p>
		<p><a href="../cart/fkviewcart.jsp">장바구니</a></p>
		<p><a href="../cs/fkcs.jsp">고객센터</a></p>
		<p><a href="../mypage/modify.jsp">개인정보확인/수정</a></p>
		<p><a href="../mypage/withdrawal.jsp">회원탈퇴</a></p>
		<% if(person.getId()!=null&&person.getGrade().equals("관리자")){ %>
		<p><a href="admin.jsp">관리자 회원관리 페이지</a></p>
		<p><a href="admintotal.jsp">관리자 총괄 페이지</a></p>
		<% }
		%>
	</div>
	
	<%
	}
	%>