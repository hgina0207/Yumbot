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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
	rel="stylesheet">



<style type="text/css">
#section {
	width: 1300px;
	margin: 0 auto;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
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
			<div class="col-1 my-3 ms-auto me-3 rounded-4 px-0">
				<img class="w-100" src="/yumbot/resources/img/광고바.PNG">
			</div>
			<div class="col-4 my-3 me-auto ms-3">
				<div class="row py-3 px-3 bg-white">
					<div class="col">
						<div class="row">
							<c:forEach items="${restaurantData.reviewImages6List }"
								var="reviewImagesDto" varStatus="i">
								<c:choose>
									<c:when test="${i.count < 6 }">
										<div class="col px-0">
											<img class="w-100" style="height: 130px; object-fit: cover;"
												src="/yumbotFiles/review_images/${reviewImagesDto.review_images_link }">
										</div>
									</c:when>
									<c:when test="${i.count eq 6  }">
										<div class="col px-0">
											<div class="position-relative"
												style="height: 130px; object-fit: cover;">
												<img class="w-100 opacity-25"
													style="height: 130px; object-fit: cover;"
													src="/yumbotFiles/review_images/${reviewImagesDto.review_images_link }">
												<span
													class="position-absolute top-50 start-50 translate-middle fw-bold"
													style="font-size: 13px;">더보기</span>
											</div>
										</div>

									</c:when>
								</c:choose>
							</c:forEach>

						</div>
						<div class="row">
							<div class="col">
								<div class="row pt-2">
									<div class="col fs-1 fw-bold">
										<span>${restaurantData.restaurantDto.place_name }</span> <span
											id="likesSpan" class="text-end btn border rounded-4"
											style="font-size: 15px;" onclick="toggleRestaurantLike()">
											<span><i class="far fa-heart"></i></span> <span id="likesNum">좋아요(${restaurantData.restaurant_likes_num })</span>
										</span> <a class="text-end btn btn-primary" style="font-size: 15px;"
											href="./writeReview?restaurant_pk=${restaurantData.restaurantDto.restaurant_pk }"><i
											class="fas fa-pencil-alt"></i> 리뷰쓰기</a>
									</div>
								</div>
								<div class="row py-0">
									<div class="col text-secondary text-start">
										<span class="border-end pe-2">${restaurantData.categoryMainDto.category_main_name }</span>
										<span> ${restaurantData.categorySubDto.category_sub_name }</span>
									</div>
								</div>
								<div class="row justify-content-start mt-4 mb-2">
									<div class="col fs-4">
										<span class="fw-bold" style="color: RGB(0, 128, 128)"><i
											class="fas fa-robot"></i> AI</span><span class="fw-bold"
											style="color: RGB(0, 128, 128)">평가점수</span><span
											class="col text-secondary text-start align-self-center"
											style="font-size: 14px;">(${restaurantData.review_num }명의
											평가)</span>
									</div>
								</div>
								<div class="row text-center">
									<div class="col">
										<div class="row">
											<div class="col fs-4 text-warning">
												<i class="far fa-smile"></i>
											</div>
										</div>
										<div class="row">
											<div class="col text-warning">중립</div>
										</div>
										<div class="row">
											<div class="col" style="color: rgb(55, 55, 55);">${restaurantData.reviewScoreAvg.NEUTRAL_SCORE_AVG}%</div>
										</div>
									</div>
									<div class="col">
										<div class="row">
											<div class="col fs-4 text-info">
												<i class="far fa-laugh-squint"></i>
											</div>
										</div>
										<div class="row">
											<div class="col text-info">긍정</div>
										</div>
										<div class="row">
											<div class="col" style="color: rgb(55, 55, 55);">${restaurantData.reviewScoreAvg.POSITIVE_SCORE_AVG}%</div>
										</div>
									</div>
									<div class="col">
										<div class="row">
											<div class="col fs-4 text-danger">
												<i class="far fa-angry"></i>
											</div>
										</div>
										<div class="row">
											<div class="col text-danger">부정</div>
										</div>
										<div class="row">
											<div class="col" style="color: rgb(55, 55, 55);">${restaurantData.reviewScoreAvg.NEGATIVE_SCORE_AVG}%</div>
										</div>
									</div>
									<div class="col">
										<div class="row">
											<div class="col fs-4" style="color: rgb(160, 32, 240)">
												<i class="far fa-meh"></i>
											</div>
										</div>
										<div class="row">
											<div class="col" style="color: rgb(160, 32, 240)">혼합</div>
										</div>
										<div class="row">
											<div class="col" style="color: rgb(55, 55, 55);">${restaurantData.reviewScoreAvg.MIXED_SCORE_AVG}%</div>
										</div>
									</div>
									<div class="col-5"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row bg-white my-3 px-3 py-3">
					<div class="col">
						<div class="row py-1">
							<div class="col">
								<span class="me-2"><i class="fas fa-map-marker-alt"></i></span>
								<span>${restaurantData.restaurantDto.address_name }</span>
							</div>
						</div>
						<div class="row py-1">
							<div class="col">
								<span class="me-2"><i class="fas fa-phone-alt"></i></span> <span>${restaurantData.restaurantDto.phone }</span>
							</div>
						</div>
						<div class="row py-1">
							<div class="col">
								<span class="me-2"><i class="fas fa-tag"></i></span>
								<c:forEach items="${restaurantData.top3HashtagDtoList }"
									var="hashtagDto" varStatus="i">
									<c:choose>
										<c:when test="${!i.last }">
											<span>${hashtagDto.hashtag_name},</span>
										</c:when>
										<c:otherwise>
											<span>${hashtagDto.hashtag_name}</span>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="row bg-white my-3">
					<div class="col px-0">
						<div class="w-100" id="map" style="height: 400px;"></div>
					</div>
				</div>
				<div class="row bg-white my-3 px-3 py-3">
					<div class="col">
						<div class="row">
							<div class="col fs-4 fw-bold">맛집태그</div>
						</div>
						<div class="row">
							<div class="col" id="wordCloud">워드클라우드</div>
						</div>
					</div>
				</div>
				<div class="row bg-white my-3 px-3 py-3">
					<div class="col">
						<div class="row">
							<div class="col fw-bold fs-4"></div>
						</div>

						<div class="row py-2">
							<div class="col fs-4 fw-bold">${restaurantData.review_num }건의
								방문자평가</div>
						</div>
						<div class="row py-2">
							<div class="col">
								<div class="row justify-content-start py-1"
									style="font-size: 15px;">
									<div class="col-2">방문목적</div>
									<div class="col">
										<c:forEach
											items="${restaurantData.category1HashtagInfoDtoList }"
											var="category1HashtagInfoDto">
											<span class="mx-1 rounded-5 px-2"
												style="background-color: rgb(230, 230, 235)">${category1HashtagInfoDto.hashtagDto.hashtag_name }(${category1HashtagInfoDto.review_hashtag_num })</span>
										</c:forEach>
									</div>
								</div>
								<div class="row justify-content-start py-1"
									style="font-size: 15px;">
									<div class="col-2">분위기</div>
									<div class="col">
										<c:forEach
											items="${restaurantData.category2HashtagInfoDtoList }"
											var="category2HashtagInfoDto">
											<span class="mx-1 rounded-5 px-2"
												style="background-color: rgb(230, 230, 235)">${category2HashtagInfoDto.hashtagDto.hashtag_name }(${category2HashtagInfoDto.review_hashtag_num })</span>
										</c:forEach>
									</div>
								</div>
								<div class="row justify-content-start py-1"
									style="font-size: 15px;">
									<div class="col-2">편의시설</div>
									<div class="col">
										<c:forEach
											items="${restaurantData.category3HashtagInfoDtoList }"
											var="category3HashtagInfoDto">
											<span class="mx-1 rounded-5 px-2"
												style="background-color: rgb(230, 230, 235)">${category3HashtagInfoDto.hashtagDto.hashtag_name }(${category3HashtagInfoDto.review_hashtag_num })</span>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div class="row py-2">
							<div class="col">
								<c:forEach items="${restaurantData.reviewDataList }"
									var="reviewData">
									<div class="row border my-2 py-2">
										<div class="col">
											<div class="row px-3 py-2 text-center">
												<div class="col fw-bold fs-5 px-1"
													style="color: RGB(0, 128, 128)">
													<i class="fas fa-robot"></i> AI점수
												</div>
												<div class="col px-1 align-self-center">
													<span class="text-warning"><i class="far fa-smile">
															중립 </i> </span><span>
														${reviewData.reviewDto.review_neutral_score}%</span>
												</div>
												<div class="col px-1 align-self-center">
													<span class="text-info"><i
														class="far fa-laugh-squint"></i> 긍정 </span><span>${reviewData.reviewDto.review_positive_score}%</span>
												</div>
												<div class="col px-1 align-self-center">
													<span class="text-danger"><i class="far fa-angry">
															부정 </i> </span><span>${reviewData.reviewDto.review_negative_score}%</span>
												</div>
												<div class="col px-1 align-self-center">
													<span style="color: rgb(160, 32, 240)"><i
														class="far fa-meh"></i> 혼합 </span><span>${reviewData.reviewDto.review_mixed_score}%</span>
												</div>
											</div>
											<div class="row px-3 py-2">
												<div class="col-2 align-self-center">
													<img class="w-100 rounded-circle my-2"
														src="/yumbotFiles/member_images/${reviewData.memberDto.member_image_link}">
												</div>
												<div class="col-3 align-self-center">
													<div class="row">
														<div class="col fw-bold">${reviewData.memberDto.member_nickname}</div>
													</div>
													<div class="row">
														<div class="col">${reviewData.reviewDto.review_reg_date}</div>
													</div>

												</div>

											</div>

											<div class="row px-3">
												<div class="col text-start">${reviewData.reviewDto.review_content}</div>
											</div>

											<div class="row px-3 pt-3">
												<div class="col">
													<c:forEach items="${reviewData.reviewImagesDtoList }"
														var="reviewImagesDto">
														<img
															style="width: 140px; height: 90px; object-fit: cover;"
															src="/yumbotFiles/review_images/${reviewImagesDto.review_images_link }">
													</c:forEach>
												</div>
											</div>
											<div class="row px-3 py-2">
												<div class="col">
													<c:forEach items="${reviewData.hashtagDtoList }"
														var="hashtagDto">
														<span class="rounded-5 mx-1 px-2 py-1"
															style="background-color: rgb(230, 230, 235); font-size: 12px;">
															${hashtagDto.hashtag_name }</span>
													</c:forEach>
												</div>
											</div>

											<div class="row px-3 py-2">
												<div class="col">
													<button class="btn border"
														id="reviewLikeButton-${reviewData.reviewDto.review_pk }"
														onclick="toggleReviewLike(${reviewData.reviewDto.review_pk })">
														<span><i class="far fa-heart"></i> </span> <span
															class="reviewLikesNum">${reviewData.review_likes_num }</span>
													</button>
												</div>
											</div>

										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e107ef579371d9ab56b5c6d71d557a&libraries=services"></script>

	<script type="text/javascript">
		const url = new URLSearchParams(window.location.search);
		const restaurant_pk=url.get('restaurant_pk');
		
		drawMap();
		loadRestaurantLikes();
		initializeReviewLikes();
		
		function drawMap() {
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(${restaurantData.restaurantDto.y}, ${restaurantData.restaurantDto.x}), //지도의 중심좌표.
				level : 3
			//지도의 레벨(확대, 축소 정도)
			};

			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			var markerPosition  = new kakao.maps.LatLng(${restaurantData.restaurantDto.y}, ${restaurantData.restaurantDto.x}); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		}
		
		
		function toggleReviewLike(review_pk){
			if(${!empty memberUser}){
				
				const xhr = new XMLHttpRequest();

				xhr.onreadystatechange = function() {

					if (xhr.readyState == 4 && xhr.status == 200) {
						loadReviewLikes(review_pk);
					}
				}
				
				
				
				xhr.open("get", "./toggleReviewLike?review_pk="+review_pk);
				xhr.send();
			}
		}
		
		function initializeReviewLikes(){
			const reviewLikeButtons=document.querySelectorAll('[id^="reviewLikeButton-"]');
			reviewLikeButtons.forEach(button=>{
				var review_pk=button.id.split('-')[1];
				loadReviewLikes(review_pk);
			});
		}
		
		function loadReviewLikes(review_pk){
			const reviewLikeButton=document.getElementById("reviewLikeButton-"+review_pk);
			const xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					const response = JSON.parse(xhr.responseText);
					console.log(response);
					
					if(response.likedStatus!=null){
						const likeIcon=reviewLikeButton.querySelector('i');
						if(response.likedStatus==0){
							if(!likeIcon.classList.contains('far')){
								likeIcon.classList.add('far');
								likeIcon.classList.remove('fas');
								reviewLikeButton.classList.remove('border-danger','text-danger');
								reviewLikeButton.classList.add('border');
							}
							
						}else{
							console.log('1');
							if(likeIcon.classList.contains('far')){
								likeIcon.classList.remove('far');
								likeIcon.classList.add('fas');
								reviewLikeButton.classList.remove('border');
								reviewLikeButton.classList.add('border-danger','text-danger');
							}
						}
					}
					
					
					const reviewLikesNum=reviewLikeButton.querySelector('.reviewLikesNum');
					reviewLikesNum.innerHTML='';
					reviewLikesNum.innerText=response.likesNum;
				}
			}
			
			
			
			xhr.open("get", "./getReviewLikes?review_pk="+review_pk);
			xhr.send();
		}
		
		
		function loadRestaurantLikes(){
			const likesSpan=document.getElementById("likesSpan");
			
			
			const xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					const response = JSON.parse(xhr.responseText);
					console.log(response);
					const likeIcon=likesSpan.querySelector('i');
					
					if(response.likedStatus!=null){
						if(response.likedStatus==0){
							if(!likeIcon.classList.contains('far')){
								likeIcon.classList.add('far');
								likeIcon.classList.remove('fas');
								likesSpan.classList.remove('border-danger','text-danger');
							}
							
						}else{
							if(likeIcon.classList.contains('far')){
								likeIcon.classList.remove('far');
								likeIcon.classList.add('fas');
								likesSpan.classList.add('border-danger','text-danger');
							}
						}
					}
					
					
					const likesNum=document.getElementById("likesNum");
					likesNum.innerHTML='';
					likesNum.innerText='좋아요('+response.likesNum+')';
				}
			}
			
			
			
			xhr.open("get", "./getRestaurantLikes?restaurant_pk="+restaurant_pk);
			xhr.send();
		}
		
		function toggleRestaurantLike(){
			if(${!empty memberUser}){
				const likesSpan=document.getElementById("likesSpan");
				
				
				const xhr = new XMLHttpRequest();

				xhr.onreadystatechange = function() {

					if (xhr.readyState == 4 && xhr.status == 200) {
						loadRestaurantLikes();
					}
				}
				
				
				
				xhr.open("get", "./toggleRestaurantLike?restaurant_pk="+restaurant_pk);
				xhr.send();
			}
			
		}
		
		
        
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>