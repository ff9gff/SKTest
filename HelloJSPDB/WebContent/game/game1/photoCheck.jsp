<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
		@font-face {
			font-family: "fontTest";
			src: url('../../images/digital-7.TTF');
		}
		
		#time {
			font-family: "fontTest";
			font-size: 50pt;
			color: gold;
		}
	</style>
	<title> 축구 팀 맞추기 </title>
	
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	
	</head>
	
	<body style="width: 420; height: 700;">
	
		<%
			String userid = (String) session.getAttribute("userid");	
			
			if ( userid == null ) {	
				response.sendRedirect("loginform.jsp");
			} 
		%>
		<div style="width: 50%; height: 30%; float: left;">
			<img id='myimg' width='180' height='180'>
		</div>
	
	
		<div style="width: 50%; height: 30%; float: right;">
			<div>
				<label id='time'>0</label>
			</div>
			<br>
	
			<div>
				<img src='../../images/correct.png' id='myimg' width='20' height='20'> <label>정답</label>&nbsp;
				<input type="text" id="OCount" style='width: 24;' value='0'>개 <br> 
				<img src='../../images/incorrect.png' id='myimg' width='20' height='20'>	<label>오답</label>&nbsp; 
				<input type="text" id="XCount" 	style='width: 24;' value='0'>번 <br> 
				<img src='../../images/clock.png' id='myimg' width='20' height='20'> <label>시간</label>&nbsp;
				<input type="text" id="timeSum" style='width: 24;' value='0'>초
				<br>
				<br>
			</div>
		</div>
	
	
		<div>
			<input type="text" id=answer> &nbsp;&nbsp;
			<button id='btnTask'>정답확인</button>
			&nbsp;
			<button id='btnReset'>초기화</button>
			<br>
			<br>
		</div>
	
		<div>
			<label id='hintCheck' style="color: pink">틀리면 힌트 드립니다.</label> <br>
			<br> <label id='verify'>정답을 확인합니다.</label>
		</div>
		<br>
	
		<textarea style='width: 320; height: 80'></textarea>

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
		
		<script>
			var photo = [ '../../images/bvb.png', '../../images/mu.png', '../../images/rm.png', '../../images/bm.png', '../../images/chelsea.png',
					'../../images/barca.png', '../../images/psg.png', '../../images/monaco.png', '../../images/ajax.png' ];
			var check = [ '도르트문트', '맨체스터 유나이티드', '레알 마드리드', '바이에른 뮌헨', '첼시', '바르셀로나',
					'파리 생제르망', 'AS 모나코', '아약스' ];
			var hintArr = [ 'ㄷㄹㅌㅁㅌ', 'ㅁㅊㅅㅌ ㅇㄴㅇㅌㄷ', 'ㄹㅇ ㅁㄷㄹㄷ', 'ㅂㅇㅇㄹ ㅁㅎ', 'ㅊㅅ', 'ㅂㄹㅅㄹㄴ',
					'ㅍㄹ ㅅㅈㄹㅁ', 'AS ㅁㄴㅋ', 'ㅇㅇㅅ' ];
		
			var index = 0;
			var random = [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ];
		
			var ok = 0;
			var no = 0;
		
			// var time;
			var timeCheck = 0;
		
			$(document).ready(function() {
		
				setInterval(function() {
		
					// time = $('#time').text(parseInt($('#time').text()) + 1);
					$('#time').text(parseInt($('#time').text()) + 1);
		
				}, 1000);
		
				$('#answer').val('');
				$('#answer').focus();
		
				shuffle(random);
		
				$('#myimg').attr('src', photo[random[index]]);
		
				$('#btnTask').click(function() {
		
					if ($('#answer').val() == check[random[index]]) {
		
						$('#verify').html('<font color=green>정답입니다!</font>');
		
						$('#hintCheck').html('틀리면 힌트 드립니다.');
		
						index++;
						ok++;
		
						timeCheck += parseInt($('#time').html());
						// timeCheck += parseInt(time);
		
						$('#timeSum').val(timeCheck);
						$('#time').html('0');
		
						if (index == (random.length)) {
		
							alert('문제를 다 푸셨습니다!');
							alert(ok + "개 맞추셨습니다! \n" + no
									+ "번 틀리셨습니다. \n" + timeCheck
									+ '초 걸렸습니다.');
		
							if (timeCheck < 30) {
								alert('축잘알이시네요 대단해요!');
							} else {
								alert('근데 시간이 많이 걸리시네요 반성하세요');
							}
		
							$('#verify').html('문제를 다시 섞었습니다!');
		
							shuffle(random);
							index = 0;
		
							timeCheck = 0;
							ok = 0;
							no = 0;
		
							$('#myimg').attr('src',
									photo[random[index]]);
		
							$('#answer').val('');
							$('#answer').focus();
							$('#OCount').val('0');
							$('#XCount').val('0');
							$('#timeSum').val('0');
							$('#time').html('0');
							$('#hintCheck').html('틀리면 힌트 드립니다.');
		
						} else {
		
							$('#myimg').attr('src',
									photo[random[index]]);
		
							$('#OCount').val(ok);
							$('#answer').val('');
							$('#answer').focus();
		
						}
		
					} else {
		
						$('#verify').html('<font color=red>틀렸습니다!</font>');
		
						$('#hintCheck').html('<font color=pink>' + hintArr[random[index]] + '</font>');
		
						no++;
		
						$('#XCount').val(no);
		
						if (no == 7) {
		
							alert("당신은 축알못입니다. 처음부터 다시 하세요");
							shuffle(random);
							index = 0;
		
							timeCheck = 0;
							ok = 0;
							no = 0;
		
							$('#myimg').attr('src', photo[random[index]]);
		
							$('#answer').val('');
							$('#answer').focus();
							$('#OCount').val('0');
							$('#XCount').val('0');
							$('#time').html('0');
							$('#timeSum').val('0');
							$('#verify').html('처음부터 다시!');
							$('#hintCheck').html('틀리면 힌트 드립니다.');
		
						}
		
						$('#answer').val('');
						$('#answer').focus();
		
					}
		
				})
		
				$('#btnReset').click(function() {
		
					$('#verify').html('처음부터 다시!');
		
					shuffle(random);
					index = 0;
		
					timeCheck = 0;
					ok = 0;
					no = 0;
		
					$('#myimg').attr('src', photo[random[index]]);
		
					$('#OCount').val('0');
					$('#XCount').val('0');
					$('#time').html('0');
					$('#timeSum').val(0);
					$('#hintCheck').html('틀리면 힌트 드립니다.');
					$('#answer').val('');
					$('#answer').focus();
		
				});
		
			});
		</script>
	
	</body>

</html>

