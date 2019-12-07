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
				<h3>Q & A</h3>
				<h5>상품 Q&A입니다.</h5>
				<form action="help?type=<% if( request.getParameter("type")!= null && request.getParameter("type").equals("edit")){  %>edit&no=<%=request.getParameter("no")%><%}else{ %>upload<%} %>" method="post">
					<div style="display:flex;padding-bottom: 4px;">
						<div style="padding: 0px 10px 2px 0px;">제목</div>
						<input type="text" id="title" name="title" style="width: 700px;" value="${title}"/>
					</div>
					<div style="display:flex;">
						<div style="padding: 0px 10px 2px 0px;">내용</div>
						<textarea rows="12" id="content" name="content" style="width: 700px;">${content}</textarea>
					</div>
					<% if(session.getAttribute("user_id")!=null) {%>
						<% if(request.getParameter("type")!= null && request.getParameter("type").equals("edit")){ %>
							<div class="flex-cont" style="justify-content: flex-end;">
							  	<input class="button-1" type="submit" value="수정" style="height: 28px;width: 100px;font-size: 14px;" />
							</div>
						<%} else{%>
							<div class="flex-cont" style="justify-content: flex-end;">
							  	<input class="button-1" type="submit" value="등록" style="height: 28px;width: 100px;font-size: 14px;" />
							</div>
						<%} %>
					<% } %>
				</form>
			</div>
		</div>
	</div>
</body>

</html>