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
	
		<div class="row">
			<div class="col">
				<jsp:include page="./common/topNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row bg-light" id="searchResultBox">
			<div class="col-1 my-3 ms-auto me-3 rounded-4 px-0">
				<img class="w-100" src="/yumbot/resources/img/광고바.PNG">
			</div>
			<div class="col-6 my-3 me-auto ms-3 bg-white">
				<div class="row">
					<div class="col">
						<div class="row my-2">
							<div class="col">
								<div class="row">
									<div class="col fs-5 fw-bold">카테고리</div>
								</div>
								<div class="row">
									<div class="col" id="categorySubList">
										<%-- <c:forEach items="${categorySubDtoList }" var="categorySubDto">
											<label for="categorySub${categorySubDto.category_sub_pk }"
												class="btn border rounded-4 bg-light mx-1 my-1"
												style="font-size: 12px;">${categorySubDto.category_sub_name }
											</label>
											<input type="checkbox"
												value="${categorySubDto.category_sub_pk }"
												id="categorySub${categorySubDto.category_sub_pk }"
												style="display: none;" onclick="changeCheckboxColor(event)"> 
										</c:forEach> --%>
									</div>
								</div>
							</div>
						</div>
						<div class="row py-3 px-1 align-items-start">
							<div class="col">
								<span class="me-2 border-end pe-2">정렬 <i
									class="fas fa-sort-amount-down"></i></span> <span><button
										class="btn btn-sm border-dark text-dark">점수순</button></span> <span><button
										class="btn btn-sm border-secondary text-secondary">리뷰많은순</button></span>
								<span><button
										class="btn btn-sm border-secondary text-secondary">좋아요많은순</button></span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="row px-1">
							<div class="col fs-5 fw-bold" id="search_result"></div>
						</div>
						<div class="row">
							<div class="col my-2 text-center">
								<div id="search_map"
									style="width: 750px; height: 320px; margin: 0 auto;"></div>
							</div>
						</div>
						<div class="row">
							<div class="col" id="searchList"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e107ef579371d9ab56b5c6d71d557a&libraries=services"></script>


	<script src="/yumbot/resources/js/search.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>