package com.yummy.yumbot.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yummy.yumbot.dto.CategorySubDto;
import com.yummy.yumbot.dto.HashtagDto;
import com.yummy.yumbot.dto.MemberDto;
import com.yummy.yumbot.dto.RestaurantDto;
import com.yummy.yumbot.dto.RestaurantLikesDto;
import com.yummy.yumbot.dto.ReviewLikesDto;
import com.yummy.yumbot.dto.SearchRestaurantDto;
import com.yummy.yumbot.main.service.MainServiceImpl;

@RestController
@RequestMapping("/*")
public class MainRestController {

	@Autowired
	private MainServiceImpl mainService;

	@RequestMapping("getRestaurantHasReview")
	public Map<String, Object> getRestaurantHasReview(@RequestBody String[] idList) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Map<String, Object>> restaurantList = mainService.getTop5RestaurantHasReview(idList);
		int restaurantNum = mainService.countRestaurantHasReview(idList);

		map.put("restaurantList", restaurantList);
		map.put("restaurantNum", restaurantNum);
		return map;
	}

	@RequestMapping("insertRestaurant")
	public void insertRestaurant(@RequestBody List<SearchRestaurantDto> searchRestaurantDtoList) {

		mainService.createRestaurant(searchRestaurantDtoList);
	}

	@RequestMapping("createHashtag")
	public Map<String, Object> createHashtag(HashtagDto hashtagDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hashtagDto", mainService.createHashtagAndReturn(hashtagDto));
		return map;
	}

	@RequestMapping("getRestaurantListByCategorySubPkAndIdList")
	public Map<String, Object> getRestaurantListByCategorySubPkAndIdList(String[] idList, int[] categorySubList) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Map<String, Object>> restaurantList = mainService.getRestaurantListByCategorySubPkAndIdList(idList,
				categorySubList);
		System.out.println(restaurantList.toString());
		int restaurantNum = restaurantList.size();

		map.put("restaurantList", restaurantList);
		map.put("restaurantNum", restaurantNum);

		return map;
	}

	@RequestMapping("toggleRestaurantLike")
	public void toggleRestaurantLike(HttpSession session, int restaurant_pk) {

		MemberDto memberUser = (MemberDto) session.getAttribute("memberUser");
		RestaurantLikesDto restaurantLikesDto = new RestaurantLikesDto();
		restaurantLikesDto.setMember_pk(memberUser.getMember_pk());
		restaurantLikesDto.setRestaurant_pk(restaurant_pk);

		mainService.toggleRestaurantLike(restaurantLikesDto);

	}

	@RequestMapping("getRestaurantLikes")
	public Map<String, Object> getRestaurantLikes(HttpSession session, int restaurant_pk) {
		Map<String, Object> map = new HashMap<>();

		MemberDto memberUser = (MemberDto) session.getAttribute("memberUser");
		if (memberUser != null) {
			RestaurantLikesDto restaurantLikesDto = new RestaurantLikesDto();
			restaurantLikesDto.setMember_pk(memberUser.getMember_pk());
			restaurantLikesDto.setRestaurant_pk(restaurant_pk);

			int likedStatus = mainService.getRestaurantlikedStatus(restaurantLikesDto);

			map.put("likedStatus", likedStatus);
		}

		int likesNum = mainService.getRestaurantLikesByRestaurantPk(restaurant_pk);

		map.put("likesNum", likesNum);

		return map;
	}

	@RequestMapping("toggleReviewLike")
	public void toggleReviewLike(HttpSession session, int review_pk) {

		MemberDto memberUser = (MemberDto) session.getAttribute("memberUser");
		ReviewLikesDto reviewLikesDto = new ReviewLikesDto();
		reviewLikesDto.setMember_pk(memberUser.getMember_pk());
		reviewLikesDto.setReview_pk(review_pk);

		mainService.toggleReviewLike(reviewLikesDto);

	}

	@RequestMapping("getCategorySubListByIdList")
	public Map<String,Object> getCategorySubListByIdList(String[] idList) {
		Map<String, Object> map = new HashMap<>();
		List<CategorySubDto> categorySubList=mainService.getCategorySubListByIdList(idList);
		
		map.put("categorySubList", categorySubList);
		return map;
	}
	
	@RequestMapping("getReviewLikes")
	public Map<String, Object> getReviewLikes(HttpSession session, int review_pk) {
		Map<String, Object> map = new HashMap<>();

		MemberDto memberUser = (MemberDto) session.getAttribute("memberUser");
		if (memberUser != null) {
			ReviewLikesDto reviewLikesDto = new ReviewLikesDto();
			reviewLikesDto.setMember_pk(memberUser.getMember_pk());
			reviewLikesDto.setReview_pk(review_pk);

			int likedStatus = mainService.getReviewlikedStatus(reviewLikesDto);

			map.put("likedStatus", likedStatus);
		}

		int likesNum = mainService.getReviewLikesByReviewPk(review_pk);

		map.put("likesNum", likesNum);

		return map;

	}
}
