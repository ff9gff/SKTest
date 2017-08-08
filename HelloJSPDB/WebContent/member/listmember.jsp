<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.io.*, com.sk.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Insert title here</title>
	</head>
	
	<body>
		<%
			MemberManager mm = new MemberManager();
			
			List<Member> list = mm.select();
			Member member;
			
		%>
		<a href="registerform.jsp">회원가입</a>
		<table border=1>
		<%
			for (int i = 0; i < list.size(); i++) {
				member = list.get(i);
		%>		
			<tr>
				<td><%= member.mem_id %></td>
				<td><%= member.mem_name %></td>
				<%
					if (member.gender.equals("man")) {
				%>
						<td><img src="../images/man.png" width=20 height=20></td>
				<%
					} else {
				%>
						<td><img src="../images/woman.png" width=20 height=20></td>
				<%
					}
				%>
				<td><a href="deletemember.jsp?mem_id=<%=member.mem_id%>">삭제</a></td>
				<td><a href="editmemberform.jsp?mem_id=<%=member.mem_id%>">수정</a></td>
			</tr>
		<%
			}
		%>
		
		</table>
		
		
		<a href="../index.jsp">메인화면(3초 후 자동 이동)</a>
		
		
	</body>
</html>