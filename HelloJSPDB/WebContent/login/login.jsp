	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, com.sk.db.*"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
	Statement stmt = conn.createStatement();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>

		<%	
			String user;
			String pwd;
			String gameCheck;
			
			user = request.getParameter("user");
			pwd = request.getParameter("pwd");
			gameCheck = request.getParameter("code");
			
			
			
			MemberManager mm = new MemberManager();
			boolean memberCheck = mm.isExist(user, pwd);
			mm.close();
			
			if ( memberCheck ) {
				session.setAttribute("userid", user);
				if ( gameCheck.equals("chat") ) {
					response.sendRedirect("../chat/chatajaxform.jsp");
				} else if ( gameCheck.equals("index1") ) {
					response.sendRedirect("../index.jsp");
				} else if ( gameCheck.equals("game1") ) {
					response.sendRedirect("../game/game1/game1.jsp");
				} else if ( gameCheck.equals("game2") ) {
					response.sendRedirect("../game/game2/game2.jsp");
				} else if ( gameCheck.equals("board")) {
					response.sendRedirect("../board/list.jsp");
				} else {
					response.sendRedirect("../index.jsp");
				}
			} else {
		%>
				<script>
					// 실패 알림창 띄워준 후 자동으로 loginform.jsp로 돌아간다.
					alert('비밀번호를 확인해주세요!');
					history.go(-1);
				</script> 
		<%
			}
			
			
			stmt.close();
			conn.close();
		%>
		
		<script>
			console.log(<%=user %>);
			console.log(<%=pwd %>);
			console.log(<%=gameCheck %>);
		</script>
		
		
	</body>
</html>