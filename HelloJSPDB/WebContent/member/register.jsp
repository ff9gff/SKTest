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
			String mem_pwd = request.getParameter("mem_pwd");
			String mem_name = request.getParameter("mem_name");
			String gender = request.getParameter("gender");
			String hobbys[] = request.getParameterValues("hobby");
			String hobby = Arrays.toString(hobbys).toString();
			
			MemberManager mm = new MemberManager();
			
			Member member = new Member(mem_id, mem_pwd, mem_name, gender, hobby);
			
			mm.insert(member);
			
			mm.close();
		%>
		
		이름 : <%=mem_name %> <br>
		아이디 : <%=mem_id %> <br>
		패스워드 : <%=mem_pwd %> <br>
		성별 : <%=gender %> <br>
		취미 : <%=hobby %> <br>
		
		<a href="../login/loginform.jsp">메인화면(3초 후 자동 이동)</a>
		
		
	</body>
</html>