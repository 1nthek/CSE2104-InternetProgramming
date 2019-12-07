<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nanum+Gothic|Oleo+Script&display=swap" rel=stylesheet>
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
	<div class="menu">
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
<div class="flex-cont" style="align-items: end;margin-top: 20px;">
	<c:forEach var="u" items="${page.list}">
		<div style="margin-right: 100px;">
			<img src="${u.imgUrl}" width=400>
		</div>
		<div style="border-top: 2px solid #a9a9a9;width: 500px;padding: 0 14px;">
			<div style="font-size: 18px;font-weight: bold;padding: 14px;border-bottom: 1px solid #e8e8e8;">${u.name}</div>
			<div style="font-size: 14px;border-bottom: 1px solid #e8e8e8;padding: 14px;color: dimgray;">소재 : ${u.material}</div>
			<div style="font-size: 14px;border-bottom: 1px solid #e8e8e8;padding: 14px;color: dimgray;">판매가 : ${u.price}</div>
			<div style="font-size: 14px;border-bottom: 1px solid #e8e8e8;padding: 14px;color: dimgray;">${u.content}</div>
			<div style="font-size: 14px;border-bottom: 1px solid #e8e8e8;padding: 14px;color: dimgray;">Free Size : ${u.size}</div>
			<div class="flex-cont" style="justify-content: left;">
				<form action="order?product_no=${u.no}" method="post" name="userInfo">
					<input class="button-2" type="submit" value="바로구매"/>
				</form>
				<form action="cart?product_no=${u.no}" method="post" name="userInfo">
					<input class="button-1" type="submit" value="장바구니"/>
				</form>
				<% if(session.getAttribute("is_admin")!=null && session.getAttribute("is_admin").equals("true")) {%>
					<div class="flex-cont" style="justify-content: left;">
						<form action="detail?product_no=${u.no}&type=delete" method="post">
						  	<input class="button-2" type="submit" value="상품내리기" style="height: 28px;width: 100px;font-size: 14px;background: #e12323;" />
						</form>
					</div>
				<%}%>
			</div>
		</div>
	</c:forEach>
</div>

</body>

</html>