const url = new URLSearchParams(window.location.search);
		const query = url.get("query");

		// 마커를 담을 배열입니다
		var markers = [];
		const search_map = document.getElementById("search_map");
		 
		let map;

		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
		
		var restaurants = [];
		var idList=[];
		let pageMaxNum=0;
		
		getAllMap();
		
		function getAllMap() {
			const xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					const response = JSON.parse(xhr.responseText);
					console.log(response);
					if(response.meta.total_count==0){
						response['restaurantNum']=0;
						reloadRestaurantList(response);
					}else{
						if (Math.ceil(response.meta.total_count / 15) > 3) {
							pageMaxNum = 3;
						} else {
							pageMaxNum = Math.ceil(response.meta.total_count / 15);
						}
					}
					
					
					
					/* const promises=[];
					for (var pageNum = 1; pageNum <= pageMaxNum; pageNum++) {
						promises.push(getRestaurantByPage(pageNum));
					}
					Promise.all(promises)
					.then(function(){
						getRestaurantHasReview();
					})
					.catch(function(error){
						console.log(error);
					}); */
					
					
					getRestaurantByPage(1);

				}
			}

			xhr
					.open(
							"get",
							"https://dapi.kakao.com/v2/local/search/keyword.json?query="
									+ query
									+ "&category_group_code=FD6&category_group_code=CE7");
			xhr.setRequestHeader("Authorization",
					"KakaoAK fad7e37c5c434c1803f491a720302db0");
			xhr.send();
		}

		function getRestaurantByPage(pageNum) {
				const xhr = new XMLHttpRequest();

				xhr.onreadystatechange = function() {

					if (xhr.readyState == 4 && xhr.status == 200) {
						const response = JSON.parse(xhr.responseText);
						
						for(doc of response.documents){
							idList.push(doc.id);
						}
						
						getSubcategoryListByIdList();
						insertRestaurant(response,pageNum);
						
						
					}
				}
				xhr
						.open(
								"get",
								"https://dapi.kakao.com/v2/local/search/keyword.json?query="
										+ query
										+ "&category_group_code=FD6&category_group_code=CE7&page="
										+ pageNum);
				xhr.setRequestHeader("Authorization",
						"KakaoAK fad7e37c5c434c1803f491a720302db0");
				xhr.send();

	
			
		}
		
		/* function getRestaurantByPage(pageNum) {
			return new Promise(function(resolve,reject){
				const xhr = new XMLHttpRequest();

				xhr.onreadystatechange = function() {

					if (xhr.readyState == 4 && xhr.status == 200) {
						const response = JSON.parse(xhr.responseText);
						for(doc of response.documents){
							idList.push(doc.id);
						}
						resolve();
					}
				}
				xhr
						.open(
								"get",
								"https://dapi.kakao.com/v2/local/search/keyword.json?query="
										+ query
										+ "&category_group_code=FD6&category_group_code=CE7&page="
										+ pageNum);
				xhr.setRequestHeader("Authorization",
						"KakaoAK fad7e37c5c434c1803f491a720302db0");
				xhr.send();

	
			});
		} */
		
		function insertRestaurant(doc,pageNum){
			const xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					console.log("curPage:"+pageNum);
					console.log("pageMaxNum:"+pageMaxNum);
					if(pageNum<pageMaxNum){
						getRestaurantByPage(pageNum+1);
					}else{
						getRestaurantHasReview();
					}
					
				}
			}
			
			var requestParam=[];
			for(restaurant of doc.documents){
				searchRestaurantDto={};
				searchRestaurantDto['restaurantDto']=restaurant;
				searchRestaurantDto['category_main_name']=restaurant.category_name.split(">")[0].trim();
				searchRestaurantDto['category_sub_name']=restaurant.category_name.split(">")[1].trim();
				
				requestParam.push(searchRestaurantDto);
			}
			
			
			console.log(JSON.stringify(requestParam));
			xhr.open("post", "./insertRestaurant");
			xhr.setRequestHeader("Content-Type", "application/json");
			xhr.send(JSON.stringify(requestParam));
		}

		function getRestaurantHasReview() {
			
			const xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					const response = JSON.parse(xhr.responseText);
					reloadRestaurantList(response);
				}
			}
			
			
			
			xhr.open("post", "./getRestaurantHasReview");
			xhr.setRequestHeader("Content-Type", "application/json");
			xhr.send(JSON.stringify(idList));
		} 
		function reloadRestaurantList(response){
			const categorySubList=document.getElementById('categorySubList');
			const checkboxList=categorySubList.querySelectorAll('input[type="checkbox"]:checked');
			
			var selectedCategoryName="";
			if(checkboxList!=null){
				for(checkbox of checkboxList){
					const checkboxLabel=document.querySelector('label[for="categorySub'+checkbox.value+'"]');
					selectedCategoryName+=checkboxLabel.innerText+", ";
				}
				selectedCategoryName=selectedCategoryName.substring(0,selectedCategoryName.length-2);
				console.log(selectedCategoryName);
			}
			
			console.log("restaurantNum: "+response.restaurantNum);
			if(response.restaurantNum == 0){
				const searchResultBox=document.getElementById("searchResultBox");
				searchResultBox.innerHTML='';
				
				searchResultBox.style.padding="80px 0"
				const container = document.createElement('div');
				container.classList.add('col', 'text-center');

				const row1 = document.createElement('div');
				row1.classList.add('row', 'py-5');
				const col1 = document.createElement('div');
				col1.classList.add('col');
				const icon = document.createElement('i');
				icon.classList.add('fas', 'fa-exclamation-triangle');
				icon.style.fontSize = '100px';
				col1.appendChild(icon);
				row1.appendChild(col1);
				container.appendChild(row1);

				const row2 = document.createElement('div');
				row2.classList.add('row');
				const col2 = document.createElement('div');
				col2.classList.add('col');
				if(checkboxList==""){
					col2.textContent = query+", "+selectedCategoryName+" 카테고리에 대한 검색 결과가 없습니다.";
				}else{
					col2.textContent = "'"+query+"에 대한 검색 결과가 없습니다.";
				}
				
				row2.appendChild(col2);
				container.appendChild(row2);
				
				searchResultBox.appendChild(container);
				
			}else{
				const search_result = document.getElementById("search_result");
				search_result.innerHTML='';
				
				const span1 = document.createElement("span");
				span1.innerText = query + ' 맛집(';
				search_result.appendChild(span1);
		
				const span2 = document.createElement("span");
				span2.classList.add('text-info');
				span2.innerText = response.restaurantNum;
				search_result.appendChild(span2);
		
				const span3 = document.createElement("span");
				span3.innerText = ')곳';
				search_result.appendChild(span3);
				
				const searchList=document.getElementById('searchList');
				searchList.innerHTML='';
				
				var i=0;
				for(restaurant of response.restaurantList){
					i++;
					const row = document.createElement('div');
					row.classList.add('row', 'border-bottom');
		
					const col = document.createElement('div');
					col.classList.add('col', 'btn', 'btn-light', 'px-4', 'bg-white');
					
					(function(col, restaurant) {
						col.addEventListener('click',function(){
							moveRestaurantDetail(restaurant.searchRestaurantDto.restaurantDto.restaurant_pk);
						});
					})(col, restaurant);
					
					const innerRow1 = document.createElement('div');
					innerRow1.classList.add('row', 'py-1');
		
					const imgCol = document.createElement('div');
					imgCol.classList.add('col-2', 'fs-1', 'align-self-center','me-2','pe-0','py-2');
					imgCol.style.height='128px';
					const img = document.createElement('img');
					if(restaurant.reviewImagesDtoList.length==0){
						img.src = '/yumbot/resources/img/noimage.gif';	
					}else{
						img.src = '/yumbotFiles/review_images/'+restaurant.reviewImagesDtoList[0].review_images_link;
					}
					
					img.classList.add('border','rounded-4','w-100','align-self-center');
					img.style.setProperty('object-fit', 'cover');
					img.style.height='115px';
					imgCol.appendChild(img);
					innerRow1.appendChild(imgCol);
		
					const textCol = document.createElement('div');
					textCol.classList.add('col', 'text-start');
		
					const innerRow2 = document.createElement('div');
					innerRow2.classList.add('row');
					const textColInner = document.createElement('div');
					textColInner.classList.add('col', 'fs-5', 'px-2', 'py-2','fw-bold');
					textColInner.innerHTML = '<span>'+i+'.</span> <span>'+restaurant.searchRestaurantDto.restaurantDto.place_name+'</span>';
					innerRow2.appendChild(textColInner);
					textCol.appendChild(innerRow2);
		
					const innerRow3 = document.createElement('div');
					innerRow3.classList.add('row');
					const textColInner2 = document.createElement('div');
					textColInner2.classList.add('col', 'px-2', 'py-2');
					textColInner2.style.fontSize = '15px';
					textColInner2.innerHTML = '<span class="border-end pe-2">'+restaurant.searchRestaurantDto.category_main_name+'</span> <span>'+restaurant.searchRestaurantDto.category_sub_name+'</span>';
					innerRow3.appendChild(textColInner2);
					textCol.appendChild(innerRow3);
		
					const innerRow4 = document.createElement('div');
					innerRow4.classList.add('row');
					const textColInner3 = document.createElement('div');
					textColInner3.classList.add('col', 'px-2', 'py-2');
					textColInner3.style.fontSize = '15px';
					textColInner3.innerHTML = '<span><i class="far fa-heart"></i></span> <span>'+restaurant.searchRestaurantDto.restaurant_likes_num+'</span>';
					innerRow4.appendChild(textColInner3);
					textCol.appendChild(innerRow4);
		
					innerRow1.appendChild(textCol);
					
					const AIScoreCol=document.createElement('div');
					AIScoreCol.classList.add('col-4','py-2');
					
					// 부모 요소 생성
					const AIScoreTitleRow = document.createElement("div");
					AIScoreTitleRow.classList.add("row", "justify-content-start");

					// 자식 요소 생성 및 추가
					const AIScoreTitleCol = document.createElement("div");
					AIScoreTitleCol.classList.add("col");
					AIScoreTitleRow.appendChild(AIScoreTitleCol);

					const aiIcon = document.createElement("span");
					aiIcon.classList.add("fs-5","fw-bold");
					aiIcon.style.color = "RGB(0, 128, 128)";
					AIScoreTitleCol.appendChild(aiIcon);

					const robotIcon = document.createElement("i");
					robotIcon.classList.add("fas", "fa-robot");
					aiIcon.appendChild(robotIcon);

					const aiText1 = document.createTextNode("AI");
					aiIcon.appendChild(aiText1);

					const aiText2 = document.createElement("span");
					aiText2.classList.add("fs-5", "fw-bold");
					aiText2.style.color = "RGB(0, 128, 128)";
					AIScoreTitleCol.appendChild(aiText2);

					const aiText2Content = document.createTextNode("평가 점수");
					aiText2.appendChild(aiText2Content);

					// 부모 요소를 해당 컨테이너에 추가
					AIScoreCol.appendChild(AIScoreTitleRow);
					
					
					// 부모 요소 생성
					const scoreRow = document.createElement("div");
					scoreRow.classList.add("row", "text-center");

					// 중립 점수 요소 생성
					const neutralCol = document.createElement("div");
					neutralCol.classList.add("col","px-0");
					scoreRow.appendChild(neutralCol);

					const neutralIconRow = document.createElement("div");
					neutralIconRow.classList.add("row");
					neutralCol.appendChild(neutralIconRow);

					const neutralIconCol = document.createElement("div");
					neutralIconCol.classList.add("col", "fs-4", "text-warning");
					neutralIconRow.appendChild(neutralIconCol);
					const neutralIcon = document.createElement("i");
					neutralIcon.classList.add("far", "fa-smile");
					neutralIconCol.appendChild(neutralIcon);

					const neutralTextRow = document.createElement("div");
					neutralTextRow.classList.add("row");
					neutralCol.appendChild(neutralTextRow);

					const neutralTextCol = document.createElement("div");
					neutralTextCol.classList.add("col","text-warning");
					neutralTextRow.appendChild(neutralTextCol);
					const neutralText = document.createTextNode("중립");
					neutralTextCol.appendChild(neutralText);

					const neutralScoreRow = document.createElement("div");
					neutralScoreRow.classList.add("row");
					neutralCol.appendChild(neutralScoreRow);

					const neutralScoreCol = document.createElement("div");
					neutralScoreCol.classList.add("col");
					neutralScoreRow.appendChild(neutralScoreCol);
					const neutralScore = document.createTextNode(restaurant.score.NEUTRAL_SCORE_AVG+"%");
					neutralScoreCol.appendChild(neutralScore);

					
					// 긍정 점수 요소 생성
					const positiveCol = document.createElement("div");
					positiveCol.classList.add("col","px-0");
					scoreRow.appendChild(positiveCol);

					const positiveIconRow = document.createElement("div");
					positiveIconRow.classList.add("row");
					positiveCol.appendChild(positiveIconRow);

					const positiveIconCol = document.createElement("div");
					positiveIconCol.classList.add("col", "fs-4", "text-info");
					positiveIconRow.appendChild(positiveIconCol);
					const positiveIcon = document.createElement("i");
					positiveIcon.classList.add("far", "fa-laugh-squint");
					positiveIconCol.appendChild(positiveIcon);

					const positiveTextRow = document.createElement("div");
					positiveTextRow.classList.add("row");
					positiveCol.appendChild(positiveTextRow);

					const positiveTextCol = document.createElement("div");
					positiveTextCol.classList.add("col", "text-info");
					positiveTextRow.appendChild(positiveTextCol);
					const positiveText = document.createTextNode("긍정");
					positiveTextCol.appendChild(positiveText);

					const positiveScoreRow = document.createElement("div");
					positiveScoreRow.classList.add("row");
					positiveCol.appendChild(positiveScoreRow);

					const positiveScoreCol = document.createElement("div");
					positiveScoreCol.classList.add("col");
					positiveScoreRow.appendChild(positiveScoreCol);
					const positiveScore = document.createTextNode(restaurant.score.POSITIVE_SCORE_AVG+"%");
					positiveScoreCol.appendChild(positiveScore);
					
					//부정
					const negativeCol = document.createElement("div");
					negativeCol.classList.add("col","px-0");
					scoreRow.appendChild(negativeCol);

					const negativeIconRow = document.createElement("div");
					negativeIconRow.classList.add("row");
					negativeCol.appendChild(negativeIconRow);

					const negativeIconCol = document.createElement("div");
					negativeIconCol.classList.add("col", "fs-4", "text-danger");
					negativeIconRow.appendChild(negativeIconCol);
					const negativeIcon = document.createElement("i");
					negativeIcon.classList.add("far", "fa-angry");
					negativeIconCol.appendChild(negativeIcon);

					const negativeTextRow = document.createElement("div");
					negativeTextRow.classList.add("row");
					negativeCol.appendChild(negativeTextRow);

					const negativeTextCol = document.createElement("div");
					negativeTextCol.classList.add("col", "text-danger");
					negativeTextRow.appendChild(negativeTextCol);
					const negativeText = document.createTextNode("부정");
					negativeTextCol.appendChild(negativeText);

					const negativeScoreRow = document.createElement("div");
					negativeScoreRow.classList.add("row");
					negativeCol.appendChild(negativeScoreRow);

					const negativeScoreCol = document.createElement("div");
					negativeScoreCol.classList.add("col");
					negativeScoreRow.appendChild(negativeScoreCol);
					const negativeScore = document.createTextNode(restaurant.score.NEGATIVE_SCORE_AVG+"%");
					negativeScoreCol.appendChild(negativeScore);
					
					
					//혼합
					const mixedCol = document.createElement("div");
					mixedCol.classList.add("col","px-0");
					scoreRow.appendChild(mixedCol);
					
					const mixedIconRow = document.createElement("div");
					mixedIconRow.classList.add("row");
					mixedCol.appendChild(mixedIconRow);
					
					const mixedIconCol = document.createElement("div");
					mixedIconCol.classList.add("col", "fs-4");
					mixedIconCol.style.color = "rgb(160, 32, 240)";
					mixedIconRow.appendChild(mixedIconCol);
					const mixedIcon = document.createElement("i");
					mixedIcon.classList.add("far", "fa-meh");
					mixedIconCol.appendChild(mixedIcon);
					
					const mixedTextRow = document.createElement("div");
					mixedTextRow.classList.add("row");
					mixedCol.appendChild(mixedTextRow);
					
					const mixedTextCol = document.createElement("div");
					mixedTextCol.classList.add("col");
					mixedTextRow.appendChild(mixedTextCol);
                    mixedTextCol.style.color = "rgb(160, 32, 240)";
					const mixedText = document.createTextNode("혼합");
					mixedTextCol.appendChild(mixedText);
					
					const mixedScoreRow = document.createElement("div");
					mixedScoreRow.classList.add("row");
					mixedCol.appendChild(mixedScoreRow);
					
					const mixedScoreCol = document.createElement("div");
					mixedScoreCol.classList.add("col");
					mixedScoreRow.appendChild(mixedScoreCol);
					const mixedScore = document.createTextNode(restaurant.score.MIXED_SCORE_AVG+"%");
					mixedScoreCol.appendChild(mixedScore);
					
					// 중립, 긍정, 부정, 혼합 요소들도 위와 동일한 방식으로 생성하고 부모 요소에 추가하면 됩니다.

					// 부모 요소를 해당 컨테이너에 추가
					
					AIScoreCol.appendChild(scoreRow);
					innerRow1.appendChild(AIScoreCol);
						
					col.appendChild(innerRow1);
		
					const innerRow5 = document.createElement('div');
					innerRow5.classList.add('row', 'py-1');
		
					const innerCol = document.createElement('div');
					innerCol.classList.add('col');
		
					const innerRow6 = document.createElement('div');
					innerRow6.classList.add('row');
					const innerColInner = document.createElement('div');
					innerColInner.classList.add('col', 'text-truncate', 'text-start', 'text-nowrap', 'overflow-hidden', 'text-secondary');
					innerColInner.innerText = '"'+restaurant.reviewDto.review_content+'"';
					innerRow6.appendChild(innerColInner);
					innerCol.appendChild(innerRow6);
		
					const innerRow7 = document.createElement('div');
					innerRow7.classList.add('row');
					const innerColInner2 = document.createElement('div');
					innerColInner2.classList.add('col', 'text-end');
					innerColInner2.textContent = 'by.'+restaurant.memberDto.member_nickname;
					innerRow7.appendChild(innerColInner2);
					innerCol.appendChild(innerRow7);
		
					innerRow5.appendChild(innerCol);
					col.appendChild(innerRow5);
		
					row.appendChild(col);
		
					// 해당 요소를 원하는 곳에 추가하면 됩니다.
					searchList.appendChild(row);
				}
				
				writeMap(response);
			}
		}
		function writeMap(response) {
		
				var restaurantList=response.restaurantList;
				
				
				var mapOption = {
				        center: new kakao.maps.LatLng(restaurantList[0].searchRestaurantDto.restaurantDto.y,restaurantList[0].searchRestaurantDto.restaurantDto.x), // 지도의 중심좌표
				    }; 
				map = new kakao.maps.Map(search_map,mapOption);
				
				var restaurantMaxNum=0;
				if(response.restaurantNum<5){
					restaurantMaxNum=response.restaurantNum;
				}else{
					restaurantMaxNum=5;
				}
				
				for (var i = 0; i < restaurantMaxNum; i++) {
		
					var marker = addMarker(restaurantList[i].searchRestaurantDto.restaurantDto, i);
		
					(function(marker, restaurant) {
		
						kakao.maps.event.addListener(marker, 'mouseover',
								function() {
									displayInfowindow(marker,
											restaurant.searchRestaurantDto.restaurantDto.place_name);
								});
		
						kakao.maps.event.addListener(marker, 'mouseout',
								function() {
									infowindow.close();
								});
		
						kakao.maps.event.addListener(marker, 'click',
								function() {
									moveRestaurantDetail(restaurant.searchRestaurantDto.restaurantDto);
								});
					})(marker, restaurantList[i]);
		
				}
		
				// 마커들이 표시된 영역을 기준으로 지도의 확대/축소 수준을 자동 조정
				var bounds = new kakao.maps.LatLngBounds();
				for (var i = 0; i < markers.length; i++) {
					bounds.extend(markers[i]);
				}
				map.setBounds(bounds);
				
			
		}

		function addMarker(doc, idx) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(parseFloat(doc.y),
						parseFloat(doc.x)), // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(new kakao.maps.LatLng(parseFloat(doc.y),
					parseFloat(doc.x))); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';
			
			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		function moveRestaurantDetail(restaurant_pk) {
			window.location.href = "./restaurantDetail?restaurant_pk=" + restaurant_pk;
		}
		
		function changeCheckboxColor(event) {
			const checkbox = event.target;
			const checkboxLabel=document.querySelector('label[for="categorySub'+checkbox.value+'"]');
			
			if (!checkboxLabel.classList.contains('bg-primary')) {
				checkboxLabel.classList.add('bg-primary');
				checkboxLabel.classList.remove('bg-light');
				checkboxLabel.classList.add('text-white');
				checkbox.checked =true;
			} else {
				checkboxLabel.classList.add('bg-light');
				checkboxLabel.classList.remove('bg-primary');
				checkboxLabel.classList.remove('text-white');
				checkbox.checked =false;
			}
			
			getRestaurantListByCategorySubPk();
		}
		
		function getRestaurantListByCategorySubPk() {
			const categorySubList=document.getElementById('categorySubList');
			const checkboxList=categorySubList.querySelectorAll('input[type="checkbox"]:checked');
			
			
			var category_sub_pk=[];
			for(checkbox of checkboxList){
				category_sub_pk.push(parseInt(checkbox.value));
			}
			
			
			console.log("category_sub_pk: "+category_sub_pk);
			if(category_sub_pk.length === 0){
				console.log("category_sub_pk is []");
				getRestaurantHasReview();
			}
			else{
				const xhr = new XMLHttpRequest();
	
				xhr.onreadystatechange = function() {
	
					if (xhr.readyState == 4 && xhr.status == 200) {
						const response = JSON.parse(xhr.responseText);
						reloadRestaurantList(response);
						
					}
				}
				
				
				
				
				xhr.open("post", "./getRestaurantListByCategorySubPkAndIdList");
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhr.send("idList="+idList+"&categorySubList="+category_sub_pk);
			}
		}
		
		
		function getSubcategoryListByIdList() {
			const categorySubList=document.getElementById('categorySubList');
			categorySubList.innerHTML='';
		
			const xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					const response = JSON.parse(xhr.responseText);
					console.log("categorySubList: "+response.categorySubList);
					const parentDiv = document.getElementById("categorySubList");

					for (const categorySubDto of response.categorySubList) {
					    const label = document.createElement("label");
					    label.htmlFor = "categorySub" + categorySubDto.category_sub_pk;
					    label.className = "btn border rounded-4 bg-light mx-1 my-1";
					    label.style.fontSize = "12px";
					    label.innerText = categorySubDto.category_sub_name;
					
					    const checkbox = document.createElement("input");
					    checkbox.type = "checkbox";
					    checkbox.value = categorySubDto.category_sub_pk;
					    checkbox.id = "categorySub" + categorySubDto.category_sub_pk;
					    checkbox.style.display = "none";
					    checkbox.addEventListener("click", function(event) {
					        changeCheckboxColor(event);
					    });
					
					    // Append label and checkbox to the parentDiv
					    parentDiv.appendChild(label);
					    parentDiv.appendChild(checkbox);
					}
					
				}
			}
			
			
			
			
			xhr.open("post", "./getCategorySubListByIdList");
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("idList="+idList);
			
		}