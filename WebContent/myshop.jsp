<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nanum+Gothic|Oleo+Script&display=swap" rel=stylesheet>
<script>
</script>
</head>

<body>
	<div class="header">
		<div style="display:flex;margin-left: 120px;">
			<% if(session.getAttribute("user_id")==null) {%>
				<a href="join" style="text-decoration: none;" class="header-title">회원가입</a>
				<a href="login" style="text-decoration: none;" class="header-title">로그인</a>
			<%} else{%>
				<% if(session.getAttribute("is_admin").equals("true")) {%>
					<div style="font-weight: bold;margin-right: 10px;">[관리자]</div>
				<%}%>
				<a href="logout.jsp" style="text-decoration: none;" class="header-title">로그아웃</a>
				<% if(session.getAttribute("is_admin").equals("true")) {%>
					<a href="myshop?type=all" style="text-decoration: none;" class="header-title">전체주문조회</a>
				<%}%>
				<a href="myshop" style="text-decoration: none;" class="header-title">주문조회</a>
				<% if(session.getAttribute("is_admin").equals("true")) {%>
					<a href="upload" style="text-decoration: none;" class="header-title">상품올리기</a>
				<%}%>		
			<%}%>
			<a href="cart" style="text-decoration: none;" class="header-title">장바구니</a>
			<a href="help" style="text-decoration: none;" class="header-title">Q&A</a>
		</div>
		<hr>
		<div class="flex-cont" style="flex-direction: column;margin-bottom: 30px;">
			<h1>INHA MALL</h1>
			<h3 style="margin: 0;">since 2019</h3>
		</div>
		<hr>
		<div class="flex-cont">
			<div style="display: flex;justify-content: space-around;max-width: 1180px;">
				<div class="menu-title not-work">ABOUT US</div>
				<div class="menu-title not-work">LOOK BOOK</div>
				<div class="menu-title not-work">PRESS</div>
				<a href="products" style="text-decoration: none;" class="menu-title">NEW ARRIVALS</a>
				<a href="products?type=top" style="text-decoration: none;" class="menu-title">TOP</a>
				<a href="products?type=bottom" style="text-decoration: none;" class="menu-title">BOTTOM</a>
			</div>
		</div>
		<hr>
	</div>
	<div class="contents cart">
		<div class="flex-cont">
			<div>
				<h3>주문조회</h3>
				<h5>주문 상품 정보</h5>
				<table border="0" style="border-spacing: 0px;">
					<colgroup>
						<col style="width:100px;">
						<col style="width:100px;">
						<col style="width:350px;">
						<col style="width:100px;">
						<col style="width:120px;">
						<col style="width:100px;">
						<col style="width:160px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">주문번호</th>
							<th scope="col">이미지</th>
							<th scope="col">상품정보</th>
							<th scope="col">수량</th>
							<th scope="col">상품구매금액</th>
							<th scope="col">수령인</th>
							<th scope="col">수령인 연락처</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="u" items="${page.list}">
							<tr style="font-size: 14px;">
								<td style="font-weight: bold;">${u.no}</td>
								<td><img src="${u.imgUrl}" height="100"></td>
								<td style="font-weight: bold;">${u.pname}</td>
								<td>${u.cnt}</td>
								<td><c:out value="${u.price*u.cnt}"/></td>
								<td>${u.name}</td>
								<td><div>${u.phone}</div><div>${u.email}</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>

</html>