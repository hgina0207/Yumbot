<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="row" style="width: 100%;">
		<div class="col">
			<div class="row my-4">
				<div class="col-2 my-3 ms-auto me-3 px-0 text-end">
					<a class="btn fs-1 fw-bold px-0" href="./main">YUMBOT</a>
				</div>
				<div class="col-3 my-3 ms-3 align-self-center">
					<form action="./search" method="get">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="지역,음식 또는 식당명 입력" name="query">
							<button class="btn border" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</form>
				</div>
				<c:choose>
					<c:when test="${empty memberUser }">
						<div class="col-1 align-self-center text-end ms-3">
							<a class="btn" href="./member/login">로그인</a>
						</div>
						<div class="col-1 align-self-center text-start me-auto">
							<a class="btn" href="./member/signUp">회원가입</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col-1 me-auto ms-3 align-self-center text-center">
							<div class="dropdown">
								<button class="btn dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									${memberUser.member_nickname }</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">마이페이지</a></li>
									<li><a class="dropdown-item" href="./member/logoutProcess">로그아웃</a></li>
								</ul>
							</div>
						</div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
</body>
</html>