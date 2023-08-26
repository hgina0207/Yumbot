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
<style type="text/css">
#section {
	width: 1300px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div class="container" style="margin: 0 0;">

		<div class="row">
			<div class="col">
				<jsp:include page="./common/topNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row bg-light" id="searchResultBox" style="width: 1900px;">
			<div class="col-1 my-3 ms-auto me-3 bg-white rounded-4 px-0">
				<img class="w-100" src="/yumbot/resources/img/광고바.PNG">
			</div>
			<div class="col-4 my-3 me-auto ms-3 bg-white rounded-4">
				<div class="row">
					<div class="col">
						<form action="./reviewRegisterProcess" method="post"
							enctype="multipart/form-data">
							<div class="row py-3">
								<div class="col">
									<span class="fs-3">${restaurantDto.place_name }</span> <span>평가하기</span>
								</div>
							</div>
							<div class="row py-2 border-bottom">
								<div class="col-3 align-self-center">사진첨부</div>
								<div class="col">
									<input type="file" class="form-control" name="review_images"
										multiple="multiple" accept="image/*">
								</div>
							</div>
							<div class="row py-2 border-bottom">
								<div class="col">
									<div class="row py-2 border-bottom">
										<div class="col fs-5">음식점 키워드</div>
									</div>
									<div class="row py-1 border-bottom">
										<div class="col-3">방문목적</div>
										<div class="col">
											<div class="row">
												<div class="col">
													<input type="text"> <span
														class="btn btn-sm btn-dark"
														onclick="createHashtag(1,event)">추가하기</span>
												</div>
											</div>
											<div class="row">
												<div class="col" id="category1HashtagList">
													<c:forEach items="${category1HashtagDtoList }"
														var="category1HashtagDto">
														<label for="hashtag${category1HashtagDto.hashtag_pk }"
															class="btn border rounded-4 bg-light mx-1 my-1"
															style="font-size: 9px;"
															onclick="changeCheckboxColor(event)">${category1HashtagDto.hashtag_name }</label>
														<input type="checkbox" name="category1_hashtag"
															value="${category1HashtagDto.hashtag_pk }"
															id="hashtag${category1HashtagDto.hashtag_pk }"
															style="display: none;">
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
									<div class="row py-1 border-bottom">
										<div class="col-3">분위기</div>
										<div class="col">
											<div class="row">
												<div class="col">
													<input type="text"> <span
														class="btn btn-sm btn-dark"
														onclick="createHashtag(2,event)">추가하기</span>
												</div>
											</div>
											<div class="row">
												<div class="col" id="category2HashtagList">
													<c:forEach items="${category2HashtagDtoList }"
														var="category2HashtagDto">
														<label for="hashtag${category2HashtagDto.hashtag_pk }"
															class="btn border rounded-4 bg-light mx-1 my-1"
															style="font-size: 9px;"
															onclick="changeCheckboxColor(event)">${category2HashtagDto.hashtag_name }
														</label>
														<input type="checkbox" name="category2_hashtag"
															value="${category2HashtagDto.hashtag_pk }"
															id="hashtag${category2HashtagDto.hashtag_pk }"
															style="display: none;">
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
									<div class="row py-1 border-bottom">
										<div class="col-3">편의시설</div>
										<div class="col">
											<div class="row">
												<div class="col">
													<input type="text"> <span
														class="btn btn-sm btn-dark"
														onclick="createHashtag(3,event)">추가하기</span>
												</div>
											</div>
											<div class="row">
												<div class="col" id="category3HashtagList">
													<c:forEach items="${category3HashtagDtoList }"
														var="category3HashtagDto">
														<label for="hashtag${category3HashtagDto.hashtag_pk }"
															class="btn border rounded-4 bg-light mx-1 my-1"
															style="font-size: 9px;"
															onclick="changeCheckboxColor(event)">${category3HashtagDto.hashtag_name }
														</label>
														<input type="checkbox" name="category3_hashtag"
															value="${category3HashtagDto.hashtag_pk }"
															id="hashtag${category3HashtagDto.hashtag_pk }"
															style="display: none;">
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
									<div class="row py-1">
										<div class="col-3">메뉴</div>
										<div class="col">
											<div class="row">
												<div class="col">
													<input type="text"> <span
														class="btn btn-sm btn-dark"
														onclick="createHashtag(4,event)">추가하기</span>
												</div>
											</div>
											<div class="row">
												<div class="col my-1" id="category4HashtagList">
													<c:forEach items="${category4HashtagDtoList }"
														var="category4HashtagDto">
														<label for="hashtag${category4HashtagDto.hashtag_pk }"
															class="btn border rounded-4 bg-light mx-1 my-1"
															style="font-size: 9px;"
															onclick="changeCheckboxColor(event)">${category4HashtagDto.hashtag_name }
														</label>
														<input type="checkbox" name="category4_hashtag"
															value="${category4HashtagDto.hashtag_pk }"
															id="hashtag${category4HashtagDto.hashtag_pk }"
															style="display: none;">
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row py-2">
								<div class="col">
									<div class="row">
										<div class="col-3">방문후기</div>
										<div class="col">
											<textarea class="form-control" name="review_content"
												placeholder="음식, 서비스, 분위기, 위생상태 등 방문경험을 적어주세요."></textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="row pb-3">
								<div class="col text-end">
									<input type="hidden" name="restaurant_pk"
										value="${restaurantDto.restaurant_pk }">
									<button class="btn btn-primary" type="submit">등록하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		function createHashtag(hashtag_category_pk, event) {
			const hastagInput = event.target.closest('.col').querySelector(
					'input');
			if(hastagInput.value!=""){
				const xhr = new XMLHttpRequest();

				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						const response = JSON.parse(xhr.responseText);
						addCheckbox(response.hashtagDto);
					}
				}

				xhr.open("post", "./createHashtag");
				xhr.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
				xhr.send("hashtag_category_pk=" + hashtag_category_pk
						+ "&hashtag_name=" + hastagInput.value);
			}
			
		}

		function addCheckbox(hashtagDto) {
			const hashtagListBox = document.getElementById("category"
					+ hashtagDto.hashtag_category_pk + "HashtagList");
			const hashtagInput = hashtagListBox.closest('.row').closest('.col')
					.querySelector('input');
			hashtagInput.value = '';

			const label = document.createElement('label');
			label.setAttribute('for', 'hashtag' + hashtagDto.hashtag_pk);
			label.classList.add('btn', 'border', 'rounded-4', 'bg-primary',
					'text-white', 'mx-1', 'my-1');
			label.style.fontSize = '9px';
			label.textContent = hashtagDto.hashtag_name;
			label.addEventListener('click', function() {
				changeCheckboxColor(event);
			});
			hashtagListBox.appendChild(label);

			// input 요소 생성
			const input = document.createElement('input');
			input.type = 'checkbox';
			input.name = 'category4_hashtag';
			input.value = hashtagDto.hashtag_pk;
			input.id = 'hashtag' + hashtagDto.hashtag_pk;
			input.style.display = 'none';
			input.checked = true;

			hashtagListBox.appendChild(input);
		}

		function changeCheckboxColor(event) {
			const checkbox = event.target;
			if (!checkbox.classList.contains('bg-primary')) {
				checkbox.classList.add('bg-primary');
				checkbox.classList.remove('bg-light');
				checkbox.classList.add('text-white');
			} else {
				checkbox.classList.add('bg-light');
				checkbox.classList.remove('bg-primary');
				checkbox.classList.remove('text-white');
			}

		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>