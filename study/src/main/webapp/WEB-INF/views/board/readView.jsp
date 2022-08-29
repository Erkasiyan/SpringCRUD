<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		// 수정
		$('#ubtn').click(function(){
			$('#frm').attr('action', '/board/updateView');
			$('#frm').submit();
		});
		
		// 삭제
		$('#dbtn').click(function(){
			var delYN = confirm("삭제하시겠습니까?");
			
			if(delYN == true){
				$('#frm').attr('action', '/board/delete');
				$('#frm').submit();
			};
		});
		
		// 목록
		$('#lbtn').click(function(){
			$(location).attr('href', '/board/list');
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
			<form id="frm" role="form" method="post">
				<input class="title" type="hidden" id="bno" name="bno" value="${read.bno}">
			</form>
				<table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label>
								<input type="text" id="title" name="title" value="${read.title}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="content">내용</label>
								<input type="text" id="content" name="content" value="${read.content}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label>
								<input type="text" id="writer" name="writer" value="${read.writer}" readonly="readonly"/>
							</td>
						<tr>
							<td>
								<label for=regdate>작성날짜</label>
		  				<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/>
							</td>	
						</tr>
					</tbody>
				</table>
				<div>
					<button id="ubtn">수정</button>
					<button id="dbtn">삭제</button>
					<button id="lbtn">목록</button>
				</div>
		</section>
	</div>
</body>
</html>