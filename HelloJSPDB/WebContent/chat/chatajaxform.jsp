<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.io.*"%>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<%
	// BufferedReader를 쓰면 한 줄씩(readLine()) 데이터를 가져올 수 있음
	// 일반 FileReader는 한 글자씩 가져와서 효율이 많이 떨어짐
	
	String message = "";
	BufferedReader br = new BufferedReader(new FileReader("C:/Study/chat.txt"));
	String line;
	while ((line = br.readLine()) != null) {
		message += line;
	}

	br.close();

	// 세션에 저장된 아이디 정보를 가져온단.
	String userid = (String) session.getAttribute("userid");

	if (userid == null) {
		response.sendRedirect("../login/loginform.jsp?code=chat");
	}
%>

<label><%=userid%>님 환영합니다.</label>

<div id="msg"
	style="background-color: lightgreen; width: 100%; height: 200px; overflow-y: auto;">
	<%=message%>
</div>

<input type="text" name="chat" id="chat">

<img src="../images/lion1.png" width="40" height="40">
<img src="../images/lion2.png" width="30" height="30">

<script>
	var h = $('#msg').prop('scrollHeight');
	
	$(document).ready(function() {
		$('#msg').scrollTop(h);
	});
	

	function refresh() {

		var q = 'chatajax.jsp';
		// 3초에 한번씩 Ajax 호출
		// ajax : chatajax.jsp
		// success : server 리턴값을 div에 표시
		// url은 직접 넣어줘도 된다.
		$.ajax({
			url : q,
			dataType : "text",
			success : function(data) {
				$('#msg').html(data);
			}
		});

	}

	setInterval(refresh, 2000);
	// setInterval(function() {}, 1000);

	$('#chat').keypress(function(e) {
		// 엔터키 코드가 13.
		if (e.which == 13) {
			var q = "chatajax.jsp?chat=" + $('#chat').val();
			$.ajax({
				url : encodeURI(q),
				dataType : "text",
				success : function(data) {
					$('#chat').val("");
					$('#chat').focus();
					refresh();
					$('#msg').scrollTop(h);
					// ajax();
				}
			});
		}
	});


	$('img').click(function() {
		$('#chat').val(
				"<img src=" + $(this).attr("src")
						+ " width=70 height=70> <br>");
		$('#chat').focus();
	});
	
	

	/* ajax('chatajax.jsp', function(data) {
		$('#msg').html(data);
	});
	
	function ajax(url, success) {
		$.ajax({
			url : encodeURI(url),
			dataType : "text",
			success : fun,
	        error : function(){
	           alert('error~~~');
	    	}
		});
		
		var h = $('#msg').prop('scrollHeight');
		$('#msg').scrollTop(h);
	} */
</script>

<a href="../login/logout.jsp">로그아웃</a>
<a href="../index.jsp">홈으로</a>

