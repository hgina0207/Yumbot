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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/yumbot/resources/css/main.css?after">
</head>
<body>

	<div class="row">
		<div class="col">
			<jsp:include page="./common/topNavi.jsp"></jsp:include>
		</div>
	</div>
	<div class="row">
		<div class="col px-0">
			<div id="carouselExampleInterval" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<img src="/yumbot/resources/img/banner1.png" class="d-block w-100"
							style="height: 560px; object-fit: cover;" alt="...">
					</div>
					<div class="carousel-item" data-bs-interval="10000">
						<img src="/yumbot/resources/img/banner2.png" class="d-block w-100"
							style="height: 560px; object-fit: cover;" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</div>
	<div class="row bg-light">
		<div class="col-2 px-0"></div>
		<div class="col px-0">
			<div class="row my-5 px-3 bg-white rounded-4">
				<div class="col px-0">
					<div class="row pt-4">
						<div class="col fs-3 fw-bold mx-5">
							<span style="color: RGB(0, 128, 128)"><i
								class="fas fa-robot"></i></span> <span>AI</span> <span>선정</span> <span
								style="color: RGB(255, 140, 0);">맛집</span><span>랭킹</span>
						</div>
					</div>
					<div class="row my-3 mx-3">
						<div class="col px-0">
							<div class="row">
								<div class="col px-0">
									<div id="carouselAIRanking" class="carousel slide"
										data-bs-touch="false">
										<button
											class="carousel-control-prev rounded-circle bg-dark my-auto"
											style="width: 50px; height: 50px;" type="button"
											data-bs-target="#carouselAIRanking" data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button
											class="carousel-control-next rounded-circle bg-dark my-auto"
											style="width: 50px; height: 50px;" type="button"
											data-bs-target="#carouselAIRanking" data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
										<div class="carousel-inner px-0">
											<c:forEach items="${restaurantRankingDataList }"
												var="restaurantRankingDataListPer4" varStatus="i">
												<c:choose>
													<c:when test="${i.count eq 1 }">
														<div class="carousel-item active mt-4 px-0">
															<div class="row mx-auto" style="width: 90%">
																<c:forEach items="${restaurantRankingDataListPer4}"
																	var="restaurantDatas" varStatus="j">

																	<div class="col mx-3 btn px-0"
																		onclick="location.href='./restaurantDetail?restaurant_pk=${restaurantDatas.restaurantData.RESTAURANT_PK}'">
																		<div class="row">
																			<div class="col position-relative px-2">
																				<img class="w-100 rounded-5"
																					style="height: 212px; object-fit: cover;"
																					src="/yumbotFiles/review_images/${restaurantDatas.reviewImagesDto.review_images_link }">
																				<div
																					class="position-absolute rounded-5 px-2 py-2 fw-bold"
																					style="left: 50%; top: 85%; transform: translate(-50%, -50%); width: 75%; background-color: rgba(0, 0, 0, 0.7);">
																					<span class="text-white"
																						style="opacity: 1; display: inline-block; text-align: center;">AI
																						긍정점수</span> <span class="text-info">${restaurantDatas.restaurantData.POSITIVE_AVG}</span>
																				</div>
																			</div>
																		</div>
																		<div class="row py-2 text-start">
																			<div class="col fw-bold fs-5">
																				<span style="color: #FFA500;">${i.count*j.count }.</span>
																				<span>${restaurantDatas.restaurantData.PLACE_NAME }</span>
																			</div>
																		</div>
																	</div>
																</c:forEach>
															</div>
														</div>
													</c:when>
													<c:otherwise>
														<div class="carousel-item mt-4 px-0">
															<div class="row mx-auto" style="width: 90%">
																<c:forEach items="${restaurantRankingDataListPer4}"
																	var="restaurantDatas" varStatus="j">

																	<div class="col mx-3 btn px-0"
																		onclick="location.href='./restaurantDetail?restaurant_pk=${restaurantDatas.restaurantData.RESTAURANT_PK}'">
																		<div class="row">
																			<div class="col position-relative px-2">
																				<img class="w-100 rounded-5"
																					style="height: 212px; object-fit: cover;"
																					src="/yumbotFiles/review_images/${restaurantDatas.reviewImagesDto.review_images_link }">
																				<div
																					class="position-absolute rounded-5 px-2 py-2 fw-bold"
																					style="left: 50%; top: 85%; transform: translate(-50%, -50%); width: 75%; background-color: rgba(0, 0, 0, 0.7);">
																					<span class="text-white"
																						style="opacity: 1; display: inline-block; text-align: center;">AI
																						긍정점수</span> <span class="text-info">${restaurantDatas.restaurantData.POSITIVE_AVG}</span>
																				</div>
																			</div>
																		</div>
																		<div class="row py-2 text-start">
																			<div class="col fw-bold fs-5">
																				<span style="color: #FFA500;">${4*(i.count-1)+j.count }.</span>
																				<span>${restaurantDatas.restaurantData.PLACE_NAME }</span>
																			</div>
																		</div>
																	</div>
																</c:forEach>
															</div>
														</div>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="row my-5 px-3 bg-white rounded-4">
				<div class="col px-0">
					<div class="row pt-4">
						<div class="col fs-3 fw-bold mx-5">인기 #해시태그</div>
					</div>
					<c:forEach items="${restaurantPerTop5Hashtag }"
						var="restaurantPerHashtag">
						<div class="row my-3 mx-3">
							<div class="col px-0">
								<div class="row mx-5 mt-5">
									<div class="col px-4 fs-5 fw-bold">#${restaurantPerHashtag.hashtagDto.hashtag_name
										}</div>
								</div>
								<div class="row">
									<div class="col px-0">
										<div
											id="carouselTopHashtag${restaurantPerHashtag.hashtagDto.hashtag_pk}"
											class="carousel slide" data-bs-touch="false">
											<button
												class="carousel-control-prev rounded-circle bg-dark my-auto"
												style="width: 50px; height: 50px;" type="button"
												data-bs-target="#carouselTopHashtag${restaurantPerHashtag.hashtagDto.hashtag_pk}"
												data-bs-slide="prev">
												<span class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Previous</span>
											</button>
											<button
												class="carousel-control-next rounded-circle bg-dark my-auto"
												style="width: 50px; height: 50px;" type="button"
												data-bs-target="#carouselTopHashtag${restaurantPerHashtag.hashtagDto.hashtag_pk}"
												data-bs-slide="next">
												<span class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Next</span>
											</button>
											<div class="carousel-inner px-0">
												<c:forEach items="${restaurantPerHashtag.restaurant20 }"
													var="restaurant20" varStatus="i">
													<c:choose>
														<c:when test="${i.count eq 1 }">
															<div class="carousel-item active mt-4 px-0">
																<div class="row mx-auto" style="width: 90%">
																	<c:forEach items="${restaurant20 }"
																		var="restaurantDatas">
																		<div class="col mx-3 btn px-0"
																			onclick="location.href='./restaurantDetail?restaurant_pk=${restaurantDatas.restaurantData.RESTAURANT_PK}'">
																			<div class="row">
																				<div class="col position-relative px-2">
																					<img class="w-100 rounded-5"
																						style="height: 212px; object-fit: cover;"
																						src="/yumbotFiles/review_images/${restaurantDatas.reviewImagesDto.review_images_link }">
																					<div
																						class="position-absolute rounded-5 px-2 py-2 fw-bold"
																						style="left:50%; top: 85%; transform: translate(-50%, -50%); width:75%; background-color: rgba(0, 0, 0, 0.7);"><span
																						class="text-white" style="opacity: 1; display: inline-block; text-align: center;">AI
																							긍정점수</span> <span class="text-info">${restaurantDatas.restaurantData.POSITIVE_AVG}</span></div>
																				</div>
																			</div>
																			<div class="row py-2 text-start">
																				<div class="col fw-bold fs-5">
																					<span>${restaurantDatas.restaurantData.PLACE_NAME }</span>
																				</div>
																			</div>
																		</div>
																	</c:forEach>
																</div>
															</div>
														</c:when>
														<c:otherwise>
															<div class="carousel-item mt-4 px-0">
																<div class="row mx-auto" style="width: 90%">
																	<c:forEach items="${restaurant20 }"
																		var="restaurantDatas">
																		<div class="col mx-3 btn px-0"
																			onclick="location.href='./restaurantDetail?restaurant_pk=${restaurantDatas.restaurantData.RESTAURANT_PK}'">
																			<div class="row">
																				<div class="col position-relative px-2">
																					<img class="w-100 rounded-5"
																						style="height: 212px; object-fit: cover;"
																						src="/yumbotFiles/review_images/${restaurantDatas.reviewImagesDto.review_images_link }">
																					<div
																						class="position-absolute rounded-5 px-2 py-2 fw-bold"
																						style="left:50%; top: 85%; transform: translate(-50%, -50%); width:75%; background-color: rgba(0, 0, 0, 0.7);"><span
																						class="text-white" style="opacity: 1; display: inline-block; text-align: center;">AI
																							긍정점수</span> <span class="text-info">${restaurantDatas.restaurantData.POSITIVE_AVG}</span></div>
																				</div>
																			</div>
																			<div class="row py-2 text-start">
																				<div class="col fw-bold fs-5">
																					<span>${restaurantDatas.restaurantData.PLACE_NAME }</span>
																				</div>
																			</div>
																		</div>
																	</c:forEach>
																</div>
															</div>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="col-2 px-0"></div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>