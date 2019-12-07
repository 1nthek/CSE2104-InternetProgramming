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
	const checkValue = () => {
	    if(!document.userInfo.name.value){
	        alert("상품명을 입력하세요.");
	        return false;
	    }
	    
	    if(!document.userInfo.price.value){
	        alert("가격을 입력하세요.");
	        return false;
	    }
	    if(!document.userInfo.material.value){
	        alert("소재를 입력하세요.");
	        return false;
	    }
	    if(!document.userInfo.imgUrl.value){
	        alert("이미지 링크를 입력하세요.");
	        return false;
	    }
	    if(!document.userInfo.size.value){
	        alert("사이즈를 입력하세요.");
	        return false;
	    }
	    if(!document.userInfo.category.value){
	        alert("품목을 입력하세요.");
	        return false;
	    }
	    if(!document.userInfo.content.value){
	        alert("설명을 입력하세요.");
	        return false;
	    }
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
	<div class="contents upload">
		<div class="flex-cont">
			<div>
				<h3>상품 올리기</h3>
				<form action="detail?type=upload" method="post" onsubmit="return checkValue()" name="userInfo">
					<div style="display:flex;padding-bottom: 4px;">
						<div class="title">상품명</div>
						<input type="text" id="name" name="name" style="width: 700px;padding: 0 6px;" placeholder="STITCHED MINIMAL KNIT"/>
					</div>
					<div style="display:flex;padding-bottom: 4px;">
						<div class="title">가격</div>
						<input type="text" id="price" name="price" style="width: 120px;padding: 0 6px;" placeholder="999000"/>
					</div>
					<div style="display:flex;padding-bottom: 4px;">
						<div class="title">소재</div>
						<input type="text" id="material" name="material" style="width: 700px;padding: 0 6px;" placeholder="면 100%"/>
					</div>
					<div style="display:flex;padding-bottom: 4px;">
						<div class="title">이미지 링크</div>
						<input type="text" id="imgUrl" name="imgUrl" style="width: 700px;padding: 0 6px;" placeholder="https://pixabay.com/ko/illustrations/..."/>
					</div>
					<div style="display:flex;padding-bottom: 4px;">
						<div class="title">사이즈</div>
						<input type="text" id="size" name="size" style="width: 700px;padding: 0 6px;" placeholder="어깨 50 , 가슴단면 54.5 , 팔길이 62 , 총길이 68.5"/>
					</div>
					<div style="display:flex;padding-bottom: 4px;">
						<div class="title">품목</div>
						<input type="text" id="category" name="category" style="width: 700px;padding: 0 6px;" placeholder="top"/>
					</div>
					<div style="display:flex;">
						<div class="title">설명</div>
						<textarea rows="12" id="content" name="content" style="width: 700px;padding: 0 6px;" placeholder="기분 좋게 입을 수 있는 미니멀한 감도의 스웨트 셔츠 입니다."></textarea>
					</div>
					<% if(session.getAttribute("is_admin")!=null && session.getAttribute("is_admin").equals("true")) {%>
						<div class="flex-cont" style="justify-content: flex-end;">
						  	<input class="button-1" type="submit" value="상품 등록" style="height: 28px;width: 100px;font-size: 14px;" />
						</div>
					<% } %>
				</form>
			</div>
		</div>
	</div>
</body>

</html>