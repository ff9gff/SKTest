<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	</head>
	
	<style>
		.btn {
			width: 50px;
			height: 50px;
			background: lightblue;
		}
		
		@font-face {
			font-family: "fontTest";
			src: url('../images/digital-7.TTF');
		}
		
		#time {
			font-family: "fontTest";
			font-size: 16pt;
			color: gold;
		}
	</style>
	
	<title> 1 TO 50 </title>
	
	<script>
		function shuffle(random) {
		
			var j, x, i;
		
			for (i = random.length; i; i--) {
		
				j = Math.floor(Math.random() * i);
				// a.length가 아니라 i를 곱하는 이유?
				// 전체 범위가 아니라 범위가 점점 줄어들기 때문!
		
				x = random[i - 1];
				random[i - 1] = random[j];
				random[j] = x;
		
			}
		}
	</script>

	<body>
	
		<%
			String userid = (String) session.getAttribute("userid");	
		
			if ( userid == null ) {	
				response.sendRedirect("loginform.jsp");
			} 
		%>	
	
		<table>
			<tr id='row1'>
				<td><button class='btn'>1</button></td>
				<td><button class='btn'>2</button></td>
				<td><button class='btn'>3</button></td>
				<td><button class='btn'>4</button></td>
				<td><button class='btn'>5</button></td>
			</tr>
			
			<tr id='row2'>
				<td><button class='btn'>1</button></td>
				<td><button class='btn'>2</button></td>
				<td><button class='btn'>3</button></td>
				<td><button class='btn'>4</button></td>
				<td><button class='btn'>5</button></td>
			</tr>
			
			<tr id='row3'>
				<td><button class='btn'>1</button></td>
				<td><button class='btn'>2</button></td>
				<td><button class='btn'>3</button></td>
				<td><button class='btn'>4</button></td>
				<td><button class='btn'>5</button></td>
			</tr>
			
			<tr id='row4'>
				<td><button class='btn'>1</button></td>
				<td><button class='btn'>2</button></td>
				<td><button class='btn'>3</button></td>
				<td><button class='btn'>4</button></td>
				<td><button class='btn'>5</button></td>
			</tr>
			
			<tr id='row5'>
				<td><button class='btn'>1</button></td>
				<td><button class='btn'>2</button></td>
				<td><button class='btn'>3</button></td>
				<td><button class='btn'>4</button></td>
				<td><button class='btn'>5</button></td>
			</tr>
		</table> <br>
		
		<button id='refresh'> 섞기 </button>
		
		<button id='check' style='display: none;'> 확인 </button> 
		
		<label>시간: </label>
		
		<label id='time'>0</label> <br>
		
		<!-- 		
		<a href="logout.jsp">로그아웃</a>
		<a href="index.jsp">홈으로</a>
		 -->
		
		
		<script>
		
			var btnArr = [];
			for (var i = 0; i < $('button.btn').length; i++) {
				btnArr[i] = i + 1;
			}
			
			var btnArr2 = [];
			for (var i = 0; i < $('button.btn').length; i++) {
				btnArr2[i] = i + 26;
			}
			
			var answerCheck = 1;
			var valueCheck = 0;
			
			shuffle(btnArr);
			shuffle(btnArr2);
			
			// 매개변수로 넘어온 btn은 jquery객체가 아니다.
			// $을 씌워준다.
			$('button.btn').each(function(i, btn) {
				$(btn).text(btnArr[i]);
			});
			
			
			$('#refresh').click(function() {
				shuffle(btnArr);
				shuffle(btnArr2);
				$('button.btn').each(function(i, btn) {
					$(btn).text(btnArr[i]);
					$(btn).css('background', 'lightblue');	
				});
				valueCheck = 0;
				answerCheck = 1;
				$('#time').html('0');
			});
			
			$('#check').click(function() {
				if (answerCheck == 51) {
					alert('다 끝났습니다! \n' + $('#time').html() + '초 걸렸습니다.');
					
					valueCheck = 0;
					answerCheck = 1;
					$('#time').html('0');
					
					shuffle(btnArr);
					shuffle(btnArr2);
					$('button.btn').each(function(i, btn) {
						$(btn).text(btnArr[i]);
						$(btn).css('background', 'lightblue');	
					});
					
					$('#check').hide();
				}
				
			});
		
			$('button.btn').click(function() {
				
				var answer = $(this).text();
				
				console.log(answer);
				
				if (answer == answerCheck) {
					
					if (answer < 26) {
						$(this).fadeOut(100, function() {
							// 전역변수를 많이 쓰면 안되는 이유!
							// 비동기문제가 발생할 수 있다!
							$(this).text(btnArr2[valueCheck]);	
							$(this).css('background', 'lightyellow');
							answerCheck++;
							valueCheck++;
						});
						$(this).fadeIn(100);
						$(this).css('background', 'lightyellow');
					} else {
						$(this).css('background', 'white');
						$(this).text('');
						answerCheck++;
						valueCheck++;
					}
					
					if (answerCheck == 51) {
						$('#check').show();
					}
				} else {
					$(this).effect('shake');
				}
				
			});
			
			setInterval(function() {
		
				// time = $('#time').text(parseInt($('#time').text()) + 1);
				$('#time').text(parseInt($('#time').text()) + 1);
		
			}, 1000);
			
		</script>
	</body>

</html>

