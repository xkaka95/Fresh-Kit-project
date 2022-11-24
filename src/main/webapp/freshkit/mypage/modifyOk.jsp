<%@page import="kr.co.freshkit.dao.FkcustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOk.jsp</title>
</head>
<body>
			<%
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				
				String nono = request.getParameter("no");
				int no = Integer.parseInt(nono);

				String gender = request.getParameter("gender");
				
				String email1 = request.getParameter("email1");
				String email2 = request.getParameter("email2");
				String email = email1+"@"+email2;
				
				String post = request.getParameter("post");
				
				String addrs1 = request.getParameter("addrs1");
				String addrs2 = request.getParameter("addrs2");
				String addrs3 = request.getParameter("addrs3");
				String addrs = addrs1+" / "+addrs2;
				
				String phone = request.getParameter("phone");
				
				FkcustomerDAO dao = new FkcustomerDAO();
				
				dao.modifyOne2(gender, email, addrs, post, phone, no);
				
			%>
				<script>
						alert("회원정보가 수정되었습니다.");
						location.href= "modify.jsp";
				</script>
</body>
</html>