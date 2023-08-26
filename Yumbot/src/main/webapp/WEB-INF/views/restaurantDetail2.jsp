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
			<div class="col-1 my-3 ms-auto me-3 rounded-4 px-0">
				<img class="w-100" src="/yumbot/resources/img/광고바.PNG">
			</div>
			<div class="col-4 my-3 me-auto ms-3">
				<div class="row py-3 px-3 bg-white">
					<div class="col">
						<div class="row">
							<c:forEach items="${restaurantData.reviewDataList }"
								var="reviewDataList" varStatus="i">
								<c:forEach items="${reviewDataList.reviewImagesDtoList }"
									var="reviewImagesDto" varStatus="j">
									<c:choose>
										<c:when test="${i.count*j.count < 6 }">
											<div class="col px-0">
												<img class="w-100" style="height: 130px; object-fit: cover;"
													src="/yumbotFiles/review_images/${reviewImagesDto.review_images_link }">
											</div>
										</c:when>
										<c:when test="${i.count*j.count eq 6  }">
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
							</c:forEach>

						</div>
						<div class="row">
							<div class="col">
								<div class="row pt-2">
									<div class="col fs-1 fw-bold">
										<span>${restaurantData.restaurantDto.place_name }</span> <span
											class="text-end btn border rounded-4"
											style="font-size: 15px;"><i class="far fa-heart"></i>
											좋아요(${restaurantData.restaurant_likes_num })</span> <a
											class="text-end btn btn-primary" style="font-size: 15px;"
											href="./writeReview?restaurant_pk=${restaurantData.restaurantDto.restaurant_pk }"><i
											class="fas fa-pencil-alt"></i> 리뷰쓰기</a>
									</div>
								</div>
								<div class="row py-2">
									<div class="col text-secondary text-start">
										<span class="border-end pe-2">${restaurantData.categoryMainDto.category_main_name }</span>
										<span>${restaurantData.categorySubDto.category_sub_name }</span>
									</div>
								</div>
								<div class="row justify-content-start">
									<div class="col">
										<span class="fs-1 fw-bold" style="color: RGB(0, 128, 128)"><i
											class="fas fa-robot"></i>AI</span> <span class="fs-2 fw-bold"
											style="color: RGB(0, 128, 128)">평가 점수</span><span
											class="col text-secondary text-start align-self-center"
											style="font-size: 13px;">(${restaurantData.review_num }명의
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
											<div class="col">중립</div>
										</div>
										<div class="row">
											<div class="col">${restaurantData.reviewScoreAvg.NEUTRAL_SCORE_AVG}%</div>
										</div>
									</div>
									<div class="col">
										<div class="row">
											<div class="col fs-4 text-info">
												<i class="far fa-laugh-squint"></i>
											</div>
										</div>
										<div class="row">
											<div class="col">긍정</div>
										</div>
										<div class="row">
											<div class="col">${restaurantData.reviewScoreAvg.POSITIVE_SCORE_AVG}%</div>
										</div>
									</div>
									<div class="col">
										<div class="row">
											<div class="col fs-4 text-danger">
												<i class="far fa-angry"></i>
											</div>
										</div>
										<div class="row">
											<div class="col">부정</div>
										</div>
										<div class="row">
											<div class="col">${restaurantData.reviewScoreAvg.NEGATIVE_SCORE_AVG}%</div>
										</div>
									</div>
									<div class="col">
										<div class="row">
											<div class="col fs-4" style="color: rgb(160, 32, 240)">
												<i class="far fa-meh"></i>
											</div>
										</div>
										<div class="row">
											<div class="col">혼합</div>
										</div>
										<div class="row">
											<div class="col">${restaurantData.reviewScoreAvg.MIXED_SCORE_AVG}%</div>
										</div>
									</div>
									<div class="col-4"></div>
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
									${hashtagDto.hashtag_name}
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
									<div class="col-3">방문목적</div>
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
									<div class="col-3">분위기</div>
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
									<div class="col-3">편의시설</div>
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
							<div class="col-4 text-center"></div>
						</div>
						<div class="row py-2">
							<div class="col">
								<c:forEach items="${restaurantData.reviewDataList }"
									var="reviewData">
									<div class="row border my-2 py-2">
										<div class="col">
											<div class="row px-3 py-3">
												<div class="col-2 align-self-center">
													<img class="w-100 rounded-circle my-2"
														src="/yumbotFiles/member_images/${reviewData.memberDto.member_image_link}">
												</div>
												<div class="col-4 align-self-center">
													<div class="row">
														<div class="col fw-bold">${reviewData.memberDto.member_nickname}</div>
													</div>
													<div class="row">
														<div class="col">${reviewData.reviewDto.review_reg_date}</div>
													</div>
												</div>
												<div class="col align-self-center text-center border">
													<div class="row">
														<div class="col fw-bold fs-4" style="color: RGB(0, 128, 128)"><i
											class="fas fa-robot"></i>AI 평가 점수</div>
													</div>
													<div class="row">
														<div class="col">
															<div class="row">
																<div class="col fs-4 text-warning">
																	<i class="far fa-smile"></i>
																</div>
															</div>
															<div class="row">
																<div class="col">중립</div>
															</div>
															<div class="row">
																<div class="col">${reviewData.reviewDto.review_neutral_score}%</div>
															</div>
														</div>
														<div class="col">
															<div class="row">
																<div class="col fs-4 text-info">
																	<i class="far fa-laugh-squint"></i>
																</div>
															</div>
															<div class="row">
																<div class="col">긍정</div>
															</div>
															<div class="row">
																<div class="col">${reviewData.reviewDto.review_positive_score}%</div>
															</div>
														</div>
														<div class="col">
															<div class="row">
																<div class="col fs-4 text-danger">
																	<i class="far fa-angry"></i>
																</div>
															</div>
															<div class="row">
																<div class="col">부정</div>
															</div>
															<div class="row">
																<div class="col">${reviewData.reviewDto.review_negative_score}%</div>
															</div>
														</div>
														<div class="col">
															<div class="row">
																<div class="col fs-4" style="color: rgb(160, 32, 240)">
																	<i class="far fa-meh"></i>
																</div>
															</div>
															<div class="row">
																<div class="col">혼합</div>
															</div>
															<div class="row">
																<div class="col">${reviewData.reviewDto.review_mixed_score}%</div>
															</div>
														</div>
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
													<button class="btn border">
														<i class="far fa-heart"></i> ${reviewData.review_likes_num }
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
	<!-- <script src="https://d3js.org/d3.v6.min.js"></script>
	<script
		src="https://unpkg.com/d3-cloud-layout@1.2.1/build/d3.layout.cloud.js"></script>
 -->
	<script type="text/javascript">
		drawMap();
        /* createWordCloud(${restaurantData.wordFrequency}); */
        
        
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
		
		
		function createWordCloud(data) {
            const containerWidth = 600; // 워드클라우드가 표시될 컨테이너의 가로 너비
            const containerHeight = 400; // 워드클라우드가 표시될 컨테이너의 세로 높이

            // 워드클라우드 레이아웃 생성
            const layout = d3.layout.cloud()
                .size([containerWidth, containerHeight])
                .words(Object.keys(data).map(word => ({ text: word, size: data[word] * 10 }))) // size를 조절하여 워드 크기 조정
                .padding(5)
                .rotate(() => (~~(Math.random() * 2) * 90)) // 단어 회전 각도 조절
                .fontSize(d => d.size)
                .on("end", draw);

            // 워드클라우드 레이아웃 실행
            layout.start();

            // 워드클라우드 그리기
            function draw(words) {
                d3.select("#wordCloud")
                    .append("svg")
                    .attr("width", containerWidth)
                    .attr("height", containerHeight)
                    .append("g")
                    .attr("transform", `translate(${containerWidth / 2},${containerHeight / 2})`)
                    .selectAll("text")
                    .data(words)
                    .enter().append("text")
                    .style("font-size", d => `${d.size}px`)
                    .style("fill", "steelblue")
                    .attr("text-anchor", "middle")
                    .attr("transform", d => `translate(${d.x},${d.y})rotate(${d.rotate})`)
                    .text(d => d.text);
            }
        }

        
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>