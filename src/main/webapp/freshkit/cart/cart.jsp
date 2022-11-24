<%@page import="kr.co.freshkit.vo.FkcustomerVO"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
<%@page import="kr.co.freshkit.dao.FkcartDAO"%>
<%@page import="kr.co.freshkit.vo.FkcartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.freshkit.dao.FkorderDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FRESHKIT</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="shortcut icon" href="../images/mainlogo_footer.png">

</head>
<body>
    <%
    
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String nono = request.getParameter("pno");
		int pno = Integer.parseInt(nono);
		
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
		
		FkcartDAO dao = new FkcartDAO();
		
		if(dao.cartCheck(pno, no)==true){
			
		out.println("<script language='javascript'>");
		out.println("alert('장바구니에 있는 물품입니다.')");
		out.println("</script>");
		out.flush();

		}else{
			dao.insertOne(pno, no);			
		}
		
		
    //리다이렉트
    	
    
    %>   
    <script>
    	location.href="../cart/fkviewcart.jsp";    
    </script>
    	
</body>
</html>
    