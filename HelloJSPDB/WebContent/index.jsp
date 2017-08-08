<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	
		<%
			String userid = (String) session.getAttribute("userid");
		
			if ( userid == null ) {
		%>
				<a href="login/loginform.jsp?code=index1">로그인</a>
				<a href="member/registerform.jsp">회원가입</a>
				<!-- <a href="chat/chatajaxform.jsp">채팅</a> -->
				<a href="game/game1/game1.jsp">축구</a>
				<a href="game/game2/game2.jsp">50</a>
				<a href="board/list.jsp">게시판</a>
				
				<br>
		<%
			} 	else if ( userid.equals("admin") ) {
		%>
				<label><%=userid %>님 환영합니다.</label> <br>
				<a href="login/logout.jsp">로그아웃</a>
				<!-- <a href="chat/chatajaxform.jsp">채팅</a> -->
				<a href="game/game1/game1.jsp">축구</a>
				<a href="game/game2/game2.jsp">50</a> 
				<a href="board/list.jsp">게시판</a> 
				<a href="member/listmember.jsp">회원관리</a> 	<br>
		<%
			} else {
		%>
				<label><%=userid %>님 환영합니다.</label> <br>
				<a href="login/logout.jsp">로그아웃</a>
				<!-- <a href="chat/chatajaxform.jsp">채팅</a> -->
				<a href="game/game1/game1.jsp">축구</a>
				<a href="game/game2/game2.jsp">50</a> 
				<a href="board/list.jsp">게시판</a>  	<br>
		<%
			}
		%>
	
		<img src="images/bvb.png" width="30%" height="30%">
	</body>
</html>