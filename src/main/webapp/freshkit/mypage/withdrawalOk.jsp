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
					response.setContentType("text/html;charset=UTF-8");
					
					String id = request.getParameter("id");
					String pw = request.getParameter("pw");
				
					FkcustomerDAO dao = new FkcustomerDAO();
					
					FkcustomerVO vo = dao.withdrawal(id, pw);
				
					if(vo==null){
				%>
				<script>
						alert("ID 또는 패스워드를 확인해주세요");
						location.href= "withdrawal.jsp";
				</script>
				<%		
					}else{
					
						if(id!=null&&pw!=null){
						
						dao = new FkcustomerDAO();
						
						dao.deleteOne2(id, pw);
						
						dao.close();
						
						%>
						<script>
								alert("회원탈퇴가 완료되었습니다.");
								location.href= "main.jsp";
						</script>
						<%	
						

						}else{
							
						}
					}
				%>
</body>
</html>