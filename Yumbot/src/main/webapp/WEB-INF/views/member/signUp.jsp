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
		<div class="row" style="height: 150px;">
			<div class="col text-center fs-1 fw-bold align-self-center">
				YUMBOT</div>
		</div>
		<div class="row mb-5">
			<div class="col"></div>
			<div class="col border rounded-4 text-center">
				<div class="row py-2 text-start">
					<div class="col fs-5 fw-bold">신규 회원가입하기</div>
				</div>
				<form action="./signUpProcess" method="post"
					enctype="multipart/form-data">
					<div class="row my-2">
						<div class="col">
							<div class="form-floating">
								<input type="text" class="form-control" id="userIdInputValue"
									name="member_id"> <label for="userIdInputValue">아이디(name@example.com)</label>
							</div>
						</div>
					</div>
					<div class="row my-2">
						<div class="col">
							<div class="form-floating">
								<input type="password" class="form-control"
									id="userPwInputValue" name="member_pw"> <label
									for="userIdInputValue">비밀번호</label>
							</div>
						</div>
					</div>
					<div class="row my-2">
						<div class="col">
							<div class="form-floating">
								<input type="text" class="form-control"
									id="userNicknameInputValue" name="member_nickname"> <label
									for="userNicknameInputValue">닉네임</label>
							</div>
						</div>
					</div>
					<div class="row my-2">
						<div class="col">
							<div class="form-floating">
								<input type="text" class="form-control" id="userPhoneInputValue"
									name="member_phone"> <label for="userPhoneInputValue">핸드폰번호</label>
							</div>
						</div>
					</div>
					<div class="row my-2 text-start">
						<div class="col">
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="member_gender" id="Male" value="M" checked> <label
									class="form-check-label" for="Male"> 남자</label>
							</div>
						</div>
						<div class="col">
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="member_gender" id="Female" value="F"> <label
									class="form-check-label" for="Female"> 여자</label>
							</div>
						</div>
					</div>
					<div class="row my-2">
						<div class="col">
							<div class="input-group">
								<label class="input-group-text" for="userImageInputValue">프로필이미지</label>
								<input type="file" name="member_image" class="form-control" id="userImageInputValue">
							</div>
						</div>
					</div>
					<div class="row my-2">
						<div class="col">
							<div class="form-floating">
								<input type="date" class="form-control" id="userBirthInputValue"
									name="member_birth"> <label for="userBirthInputValue">생일</label>
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col d-grid">
							<button class="btn btn-primary">회원가입</button>
						</div>
					</div>
				</form>
				<div class="row my-2">
					<div class="col d-grid">
						<a class="btn btn-secondary" href="./login">로그인</a>
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