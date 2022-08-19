<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$('#wbtn').click(function(){		
			var el = $("#frm .chk").length;
			for(var i = 0; i < el; i++){
				var txt = $('.chk').eq(i).val()
				if(!txt){
					alert($('.chk').eq(i).attr('title'));
					return true;
				}
			}
			
			$('#frm').attr('action', '/board/write');
			$('#frm').submit();
		});
	});
</script>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr/>
		
		<div>
			<%@include file="nav.jsp" %>
		</div>
		<hr />
		
		<section id="container">
			<form id="frm" method="post" action="/board/write">
				<table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label>
								<input type="text" id="title" name="title" class="chk" title="제목을 입력하세요."/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="content">내용</label>
								<textarea id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label>
								<input type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요."/>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div>
				<button id="wbtn" type="submit">작성</button>
			</div>
		</section>
		<hr />
	</div>
</body>
</html>