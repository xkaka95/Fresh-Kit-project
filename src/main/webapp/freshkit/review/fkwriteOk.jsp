<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.freshkit.vo.FkreviewVO"%>
<%@page import="kr.co.freshkit.dao.FkreviewDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//한글처리
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
	
	//리뷰에서 쓴 파라미터값 가져와서 db저장하기
	String cno = mr.getParameter("no");
	String retitle = mr.getParameter("retitle");
	String reimg = mr.getOriginalFileName("reimg");
	String recontents = mr.getParameter("recontents");
	
	//textarea 엔터값 저장하기
	recontents = recontents.replace("/\r\n","<br>");
	
	System.out.println(cno);
	System.out.println(retitle);
	System.out.println(reimg);
	System.out.println(recontents);

	if(cno != null && retitle != null && reimg != null && recontents != null) {
		//번호 형변환
		int no = Integer.parseInt(cno);
		
		//dao, vo 객체 생성
		FkreviewDAO dao = new FkreviewDAO();
		FkreviewVO vo = new FkreviewVO();
		
		vo.setNo(no);
		vo.setRetitle(retitle);
		vo.setReimg(reimg);
		vo.setRecontents(recontents);
		
		dao.insertOne(vo);
		
		
		
		//다작성한 후에는 목록으로 리다이렉트하기
		response.sendRedirect("fkreview.jsp"); 
		
	}
%>
