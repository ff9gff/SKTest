<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> 1 TO 50 </title>
	</head>
	
	<body>

		<%
			String userid = (String) session.getAttribute("userid");
			
			if ( userid == null ) {
				response.sendRedirect("../../login/loginform.jsp?code=game2");
			}
		%>
		
		<a href="../../login/logout.jsp">로그아웃</a>
		<a href="../../index.jsp">홈으로</a>
		<label><%=userid %>님 환영합니다.</label>
		
		<br><br>
		
		<iframe src="../game2/1to50.jsp" frameborder="0" width="100%" height="380"></iframe>
		<iframe src="../../chat/chatajaxform2.jsp" frameborder="0" width="100%" height="380"></iframe>

	</body>
</html>