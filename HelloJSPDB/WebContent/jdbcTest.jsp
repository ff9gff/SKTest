<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		
		<%
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			Statement stmt = conn.createStatement();

			String sql = "select * from member where gender='man'";

			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				// 	out.println("<label>" + rs.getString("mem_id") + " : " + rs.getString("mem_name") + "</label> <br>");
		%>	
			
				<font color='blue'>id = <%=rs.getString("mem_id") %></font>&nbsp;&nbsp;&nbsp;&nbsp;
				<font color='gray'>name = <%=rs.getString("mem_name") %></font> <br>
		
		<%
			}
			rs.close();
			stmt.close();
		%>
		
		connection~~~
		
	</body>
</html>