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
        alert("받으시는 분을 입력하세요.");
        return false;
    }
    
    if(!document.userInfo.address.value){
        alert("주소를 입력하세요.");
        return false;
    }
    
    if(!document.userInfo.phone.value){
        alert("휴대전화를 입력하세요.");
        return false;
    }
    if(!document.userInfo.email.value){
        alert("이메일을 입력하세요.");
        return false;
    }
}
	const goHome = () => {
		  location.href = "products";
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
	<div class="contents">
		<div class="flex-cont">
			<div>
				<h3>주문서작성</h3>
				<h5>배송상품 주문내역</h5>
				<table border="0" style="border-spacing: 0px;" class="cart">
					<colgroup>
						<col style="width:140px;">
						<col style="width:350px;">
						<col style="width:120px;">
						<col style="width:100px;">
						<col style="width:100px;">
						<col style="width:120px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">이미지</th>
							<th scope="col">상품정보</th>
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col">배송비</th>
							<th scope="col">합계</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="7" style="text-align: right;font-size: 14px;background: aliceblue;border-bottom: 1px solid #e7e7e7;padding: 16px 18px;">상품구매금액 <%= request.getAttribute("totalPrice") %> + 배송비 0 (무료) = 합계 : <%= request.getAttribute("totalPrice") %>원</td>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="u" items="${page.list}">
							<tr style="font-size: 14px;">
								<td><img src="${u.imgUrl}" height="130"></td>
								<td style="font-weight: bold;">${u.name}</td>
								<td style="font-weight: bold;">${u.price}</td>
								<td>${u.cnt}</td>
								<td>[무료배송]</td>
								<td><c:out value="${u.price*u.cnt}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<h5>배송정보</h5>
				<% if(request.getAttribute("product_no")==null) {%>
					<form action="complete" method="post" name="userInfo" onsubmit="return checkValue()">
				<%} else{%>
					<form action="complete?product_no=${product_no}" method="post" name="userInfo" onsubmit="return checkValue()">
				<%}%>
				
					<table border="0" style="border-spacing: 0px;width: 930px;" class="order">
						<colgroup>
							<col style="width:140px;">
							<col style="width:auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" id="nameTitle">받으시는 분</th>
								<td>
									<input type="text" name="name" id="name" maxlength="20">
								</td>
							</tr>
							<tr class="">
								<th scope="row">주소</th>
								<td>
									<input id="address" name="address" value="" type="text" style="width: 100%;">
								</td>
							</tr>
							<tr>
								<th scope="row">휴대전화</th>
								<td>
									<input type="text" name="phone" id="phone" maxlength="20">
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
									<input id="email" name="email" value="" type="text">
								</td>
							</tr>
						</tbody>
					</table>
					<div class="flex-cont">
						<input class="button-2" type="submit" value="전체상품주문" />
						<input class="button-1" type="button" value="취소" onclick="goHome()" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>