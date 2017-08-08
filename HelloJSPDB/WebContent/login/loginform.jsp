<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
		<title>Insert title here</title>
	</head>
	
	<body>
	
		<!-- 로그인 버튼 누르면 login.jsp 실행 -->
		<!-- 
			GET: URL 창에 데이터가 노출된다.
			POST: URL 창에 데이터가 노출되지 않는다.
		-->
		
		<form action="login.jsp" method="post">
			아이디 <input type="text" id='user' name='user' required> &nbsp; 
			패스워드 <input type="password" name='pwd' required> &nbsp; 
			<input type="hidden" name="code" value="<%=request.getParameter("code")%>">
			<input type="submit" value="login">
		</form>
		
		<script>
			$('#user').focus(); 
		</script>
	
	</body>
</html>