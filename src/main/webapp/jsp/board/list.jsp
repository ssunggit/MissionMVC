<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/Mission-Web/assets/img/favicon.png" rel="icon">
  <link href="/Mission-Web/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/Mission-Web/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/Mission-Web/assets/css/main.css" rel="stylesheet">

<title>????????? ??????</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href = 'writeForm.jsp'
		})
	})

	function checkLogin(boardNo) {
		/* el??? jstl???????????? jstl(????????????)??? ????????? ????????????  */
		/* js?????? c:set????????? ????????????????????? ????????? */
		<c:choose>
			<c:when test="${ empty userVO }">	
				if(confirm('????????? ??? ?????????????????????\n????????? ???????????? ????????????????')){
					location.href = '/Mission-Web/jsp/login/login.jsp'
				}
			</c:when>	
			
			<c:otherwise>
				location.href = 'detail.jsp?no=' + boardNo
			</c:otherwise>
		</c:choose>
	}
</script>
</head>
<body>
	<header id="header" class="header fixed-top d-flex align-items-center">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	
	<section>
		<div align="center">
		<hr>
		<h2>??????????????? ??????</h2>
		<hr>
		<br>
		<table class="table">
		<tr>
			<th width="7%">??????</th>
			<th>??????</th>
			<th width="16%">?????????</th>
			<th width="20%">?????????</th>
		</tr>	
		
		<c:forEach items="${ list }" var="board" varStatus="loop">
			<tr <c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if>>
				<td>
					<c:out value="${ board.no }"/> 
				</td>
				<td>
					<!-- 
						??????????????? ????????? 
						? : ?????????????????? ????????? ????????? ????????? ?????? ??? ? ?????? ??????
					-->
					
					<!-- ????????? ?????? ????????? el??? ?????? ?????????  -->
					<!--  ?????? ????????? ?????? el ??? ?????? out ????????? ??????????????? -->
					<%-- 
					<a href="updateViewCnt.jsp?no=${board.no}">
						<c:out value="${ board.title }"/> 
					</a>
					 --%>
					 
					 <!-- href javascript??? ???????????????  -->
					 <a href="javascript:checkLogin(${ board.no })">
						<c:out value="${ board.title }"/> 
					</a>
				</td>
				<td>
					<c:out value="${ board.writer }"/> 
				</td>
				<td>${ board.regDate }</td>
			</tr>
		</c:forEach>
		</table>
		<br>
		<c:if test="${ not empty userVO }">
			<button id="addBtn" class="btn btn-outline-dark">????????????</button>
		</c:if>
	</div>
	</section>
	
	<footer id="footer" class="footer">
	<!-- xml include forward ????????? ????????? context-path ??? : http://localhost:9999/Mission-Web/ ??? -->
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>