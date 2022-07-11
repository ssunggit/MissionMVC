<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%
	MemberDAO dao = new MemberDAO();
	List<MemberVO> list = dao.selectAll(); 
	
	pageContext.setAttribute("list", list);
%> 
  
<!DOCTYPE html>
<html>
<head><meta charset="utf-8">
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
<meta charset="UTF-8">
<title>Member List</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<!-- <link rel="stylesheet" href="/Mission-Web/resources/css/table.css"> -->
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addMemberBtn').click(function() {
			location.href= 'addMemberForm.jsp'
		})
	})	
</script>
</head>
<body>
<header id="header" class="header fixed-top d-flex align-items-center">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	
	<section>
	<div align="center">
		<hr>
		<h2>회원 리스트</h2>
		<hr>
		<br>
		<table class="table">
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입날짜</th>
			</tr>	
		<c:forEach items="${ list }" var="list">
			<tr>
				<td><c:out value="${ list.id }"/></td>
				<td><c:out value="${ list.name }"/></td>
				<td>
					<c:out value="${ list.emailId }@${ list.emailDomain }"/>
				</td>
				<td>
					<c:out value="${ list.tel1 }-${ list.tel2 }-${ list.tel3 }"/>
				</td>					
				<td>
					<c:out value="${ list.basicAddr } ${ list.detailAddr }"/>
				</td>				
				<td><c:out value="${ list.regDate }"></c:out></td>			
			</tr>	
		</c:forEach>	
		</table>
		<br>
		<button id="addMemberBtn" class="btn btn-outline-dark">새로운 회원 등록</button>
	</div>
	</section>
	<footer id="footer" class="footer">
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>