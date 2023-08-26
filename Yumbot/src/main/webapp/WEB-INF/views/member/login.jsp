<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col" style="height: 150px">
				<div class="d-none"></div>
			</div>
		</div>
		<div class="row">
			<div class="col"></div>
			<div class="col border text-center">
				<form action="./loginProcess" method="post">
					<div class="row py-2">
						<div class="col fs-2 fw-bold">YUMBOT</div>
					</div>
					<div class="row py-1">
						<div class="col">
							<input class="form-control" type="text" name="member_id"
								placeholder="아이디를 입력하세요">
						</div>
					</div>
					<div class="row py-1">
						<div class="col">
							<input class="form-control" type="text" name="member_pw"
								placeholder="비밀번호를 입력하세요">
						</div>
					</div>
					<div class="row py-1">
						<div class="col d-grid">
							<button class="btn btn-primary">로그인</button>
						</div>
					</div>
				</form>
				<div class="row py-2">
					<div class="col border-end align-self-center">아이디 찾기</div>
					<div class="col border-end align-self-center">비밀번호 찾기</div>
					<div class="col">
						<a class="btn px-0 py-0" href="./signUp">회원가입</a>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>