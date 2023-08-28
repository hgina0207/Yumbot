const url = new URLSearchParams(window.location.search);
		const restaurant_pk=url.get('restaurant_pk');
		
		drawMap();
		loadRestaurantLikes();
		initializeReviewLikes();
		
		function drawMap() {
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(restaurantData.restaurantDto.y, restaurantData.restaurantDto.x), //지도의 중심좌표.
				level : 3
			
			//지도의 레벨(확대, 축소 정도)
			};

			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			var markerPosition  = new kakao.maps.LatLng(restaurantData.restaurantDto.y, restaurantData.restaurantDto.x); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		}
		
		
		function toggleReviewLike(review_pk){
			if(memberUser!=null){
				
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
			if(memberUser!=null){
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