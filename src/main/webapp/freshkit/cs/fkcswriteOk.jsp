<%@page import="kr.co.freshkit.vo.FkcsVO"%>
<%@page import="kr.co.freshkit.dao.FkcsDAO"%>
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
		response.setContentType("text/html;charset=UTF-8");
		
		String cno = request.getParameter("no");
		String cstitle = request.getParameter("cstitle");
		String cscontents = request.getParameter("cscontents");
		
		if(cno != null && cstitle != null && cscontents != null){

			int no = Integer.parseInt(cno);
			
			FkcsDAO dao = new FkcsDAO();
			FkcsVO vo = new FkcsVO();
			
			vo.setNo(no);
			vo.setCstitle(cstitle);
			vo.setCscontents(cscontents);
			
			dao.insertOne(vo);
			
			response.sendRedirect("../cs/fkcs.jsp");
		}
	%>

</body>
</html>