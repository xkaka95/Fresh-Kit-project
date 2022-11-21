<%@page import="kr.co.freshkit.vo.FkreviewVO"%>
<%@page import="kr.co.freshkit.dao.FkreviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파라미터값
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
//수정완료한 값을 받아서 db값 수정하기
	String num = request.getParameter("reno");
	String num2 = request.getParameter("no");
	
	if(num != null && num2 != null) {
		int reno = Integer.parseInt(num);
		int no = Integer.parseInt(num2);
		
		String retitle = request.getParameter("retitle");
		String reimg = request.getParameter("reimg");
		String recontents = request.getParameter("recontents");
		
		//textarea 엔터값 저장하기
		recontents = recontents.replace("/\r\n","<br>");
		
		FkreviewDAO dao = new FkreviewDAO();
		FkreviewVO vo = new FkreviewVO();
		
		vo.setReno(reno);
		vo.setNo(no);
		vo.setRetitle(retitle);
		vo.setReimg(reimg);
		vo.setRecontents(recontents);
		
		dao.modifyOne(vo);
		
		response.sendRedirect("fkreview.jsp");
	}
%>