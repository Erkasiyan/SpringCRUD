<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$('#cbtn').click(function(){
			$(location).attr('href', '/board/list');
		});
		
		$('#ubtn').click(function(){
			var el = $('#frm .chk').length;
			for(var i = 0; i < el; i++){
				var txt = $('.chk').eq(i).attr('title');
				
				if(!txt){
					alert($('.chk').eq(i).attr('title'));
					return ture;
				}
			}
			
			$('#frm').attr('action', '/board/update');
			$('#frm').submit();
		});
	});
</script>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />
		
		<div>
			<%@include file="nav.jsp" %>
		</div>
		<hr />
		
		<section id="container">
			<form id="frm" name="updateForm" method="post" >
				<input type="hidden" name="bno" value="${update.bno}" readonly="readonly" />
				<table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label>
								<input type="text" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요.">
							</td>
						</tr>
						<tr>
							<td>
								<label for="cotent">내용</label>
								<input type="text" id="content" name="content" value="${update.content}" class="chk" title="내용을 입력하세요.">
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label>
								<input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>
								<label for="regdate">작성날짜</label>
								<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div>
				<button id="ubtn">저장</button>
				<button id="cbtn">취소</button>
			</div>
		</section>
	</div>
</body>
</html>