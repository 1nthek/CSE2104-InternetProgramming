<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="style.css">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Nanum+Gothic|Oleo+Script&display=swap" rel=stylesheet>
	<script>
	  const checkValue = () => {
	      if(!document.userInfo.id.value){
	          alert("아이디를 입력하세요.");
	          return false;
	      }
	      
	      if(!document.userInfo.pw.value){
	          alert("비밀번호를 입력하세요.");
	          return false;
	      }
	  }
	  const join = () => {
		  location.href = "join";
	  }
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
<div class="flex-cont flex-col">
	<div>
		<h3>로그인</h3>
		<div class="" style="border: 1px solid #e8e8e8;width: 428px;margin: 10px auto 7px;padding: 27px 0 30px 0;color: #111;border-radius: 16px;">
			<form action="login?type=auth" method="post" name="userInfo" onsubmit="return checkValue()">
				<div class="flex-cont" style="flex-direction: column;">
					<div style="display:flex;margin-bottom: 2px;margin-top: 16px;">
						<div style="width:90px;text-align:right;margin-right:10px;">ID</div>
						<input id="id" name="id" value="" type="text" style="width: 205px;">
					</div>
					<div style="display:flex">
						<div style="width:90px;text-align:right;margin-right:10px;">PASSWORD</div>
						<input id="pw" name="pw" value="" type="password" style="width: 205px;">
					</div>
				</div>
				<div class="flex-cont">
					<input class="button-2" type="submit" value="로그인" style="width: 310px;margin-top: 30px;margin-bottom: 32px;"/>
				</div>
				<div class="flex-cont" style="border-top: 1px solid #e8e8e8;">
					<input class="button-1" type="button" value="회원가입" style="width: 310px;margin-top: 30px;" onclick="join()" />
				</div>
			</form>
		</div>
	</div>
	
</div>

</body>

</html>