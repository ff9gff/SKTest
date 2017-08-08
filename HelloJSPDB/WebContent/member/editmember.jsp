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
			
			int result = mm.update(member);
			
			mm.close();
		%>
		
		<%=result %>행이 업데이트 되었습니다.
		
		<a href="../login/loginform.jsp">메인화면(3초 후 자동 이동)</a>
		
		
	</body>
</html>