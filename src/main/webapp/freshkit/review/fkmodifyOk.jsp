
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.freshkit.vo.FkreviewVO"%>
<%@page import="kr.co.freshkit.dao.FkreviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파라미터값
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	//업로드 디렉토리
	String saveDir = request.getRealPath("/freshkit/upload");
	System.out.println("saveDir : " + saveDir);
		
	//첨부파일 최대크기
	int maxFileSize = 1024*1024*10;
		
		 //MultipartRequest(HttpServletRequest request, String saveDirectory, int maxPostSize, java.lang.String encoding, FileRenamePolicy)
		//					(요청객체, 저장파일디렉토리, 최대파일크기, 인코딩타임, 동명파일처리규정객체)
			
	MultipartRequest mr = 
		new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
	
	//고객번호 기준으로 값 가져오기
	String num = mr.getParameter("reno");
	String num2 = mr.getParameter("no");
	
	if(num != null && num2 != null) {
		//형변환
		int reno = Integer.parseInt(num);
		int no = Integer.parseInt(num2);
		
	String retitle = mr.getParameter("retitle");
	String reimg = mr.getOriginalFileName("reimg");
	String recontents = mr.getParameter("recontents");
	
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