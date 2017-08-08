<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta2 http-equiv="Refresh" content="5; url=chat.jsp">
		<title>Insert title here</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	</head>
	
	<body>
		
		<%
			// BufferedReader를 쓰면 한 줄씩(readLine()) 데이터를 가져올 수 있음
			// 일반 FileReader는 한 글자씩 가져와서 효율이 많이 떨어짐
		
			String message = "";
			BufferedReader br = new BufferedReader(new FileReader("C:/Study/chat.txt"));
			String line;
			while ( (line = br.readLine()) != null ) {
				message += line;
			}
				
			br.close();
			
			String chat = request.getParameter("chat");
			
			// 세션에 저장된 아이디 정보를 가져온단.
			String userid = (String) session.getAttribute("userid");
			
			if ( userid == null ) {	
				response.sendRedirect("loginform.jsp?code=chat");
			}	
			
			if ( chat != null ) {
				message += "[" + userid + "] " + chat + "<br>";
			}
			
			BufferedWriter bw = new BufferedWriter(new FileWriter("C:/Study/chat.txt"));
			bw.write(message);

			bw.close();
			
			
			
		%>
		
		<label><%=userid %>님 환영합니다.</label>
		
		<div id="div1" style="background-color: lightgreen; width:100%; height:200px; overflow-y: auto; "> 
			<%=message %>
		</div>

		<form action="chat2.jsp">
			<input type="text" name="chat" id="chat">
		</form> <br>
		
		<img src="lion1.png" width="40" height="40">
		<img src="lion2.png" width="40" height="40">
		
		<script>
			
			var h = $('#div1').prop('scrollHeight');
			$('#div1').scrollTop(h);
			
			$('img').click(function() {
				$('#chat').val("<img src=" + $(this).attr("src") + " width=70 height=70> <br>");
				$('#chat').focus();
			});
		
		</script>
		
		<!-- <a href="logout.jsp">로그아웃</a>
		<a href="index.jsp">홈으로</a> -->
		
	</body>
</html>