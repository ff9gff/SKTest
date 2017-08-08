<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sk.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta2 http-equiv="Refresh" content="3; url=index.jsp">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%
			String mem_id = request.getParameter("mem_id");
			
			MemberManager mm = new MemberManager();

			int cnt = mm.delete(mem_id);
			
			mm.close();
		%>
		
		<%=cnt %>행이 삭제되었습니다.
		
		<a href="listmember.jsp">회원목록</a>
		
		
	</body>
</html>