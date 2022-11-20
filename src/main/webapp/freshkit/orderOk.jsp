<%@page import="kr.co.freshkit.dao.FkpaymentDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="kr.co.freshkit.vo.FkorderVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.freshkit.dao.FkorderDAO"%>
<%@page import="kr.co.freshkit.vo.FkproductVO"%>
<%@page import="kr.co.freshkit.dao.FkproductDAO"%>
<%@page import="kr.co.freshkit.dao.FkcartDAO"%>
<%@page import="kr.co.freshkit.vo.FkcartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");		
		
		
		
		int no = 1; // 임시고객번호
		
		// 주문테이블 생성
		
		String[] pname = request.getParameterValues("pname"); // 상품명
		int[] pno = new int[pname.length];
		
		String[] cCount = request.getParameterValues("cartCount"); // 주문갯수
		int[] cartCount = new int[cCount.length];
		
		String[] oSum = request.getParameterValues("orderSum"); // 주문총액
		int[] orderSum = new int[oSum.length];

		
		String orderMsg = request.getParameter("orderMsg"); // 배송메세지
		
		String addrs1 = request.getParameter("addrs1"); // 배송지주소
		String addrs2 = request.getParameter("addrs2");
		String addrs3 = request.getParameter("addrs3");
		String addrs = addrs1+" "+addrs2+" "+addrs3;
		
		String post = request.getParameter("post"); // 배송지우편번호
		
		String orderName = request.getParameter("orderName"); // 수취인이름
		
		String orderPhone1 = request.getParameter("orderPhone1"); // 수취인연락처
		String orderPhone2 = request.getParameter("orderPhone2");
		String orderPhone3 = request.getParameter("orderPhone3");
		String orderPhone = orderPhone1+orderPhone2+orderPhone3;
		
		
		FkproductDAO dao = new FkproductDAO();
		FkproductVO vo = null;
		
		for(int i=0; i<pname.length; i++){
			vo = dao.selectName(pname[i]);
			pno[i] = vo.getPno();
			cartCount[i] = Integer.parseInt(cCount[i]);
			orderSum[i] = Integer.parseInt(oSum[i]);
		}
		
		
		String sysdate1 = new SimpleDateFormat("yyMMddHHmmss").format(new Date()); // 현재시간을 주문번호로 변경
		
		
		FkorderDAO dao2 = new FkorderDAO();

		for(int i=0; i<pno.length; i++){
			String sysdate2 = sysdate1+no+pno[i];
			dao2.insertOne2(sysdate2,pno[i],cartCount[i],orderSum[i],orderMsg,addrs,post,orderName,orderPhone,no);
		}

		out.println(cartCount[0]+","+orderSum[0]);
		
		FkcartDAO dao3 = new FkcartDAO();
		dao3.deleteAll(no); // 장바구니 전체삭제
		
		/* ================================================================ */
		// 결제테이블 생성
		
		String psum = request.getParameter("paysum");
		int paysum = Integer.parseInt(psum);
		
		String pay = request.getParameter("pay");
		String pay2 = request.getParameter("pay2");
		String pay3 = pay+" "+pay2;
		
		
		
		String sysdate3 = sysdate1+no;
		
		FkpaymentDAO dao4 = new FkpaymentDAO();
		
		dao4.insertOne2(paysum, pay3, sysdate3);
		
		
    //리다이렉트
    	response.sendRedirect("fkorderOk.jsp");
    
    %>    
    
    
    