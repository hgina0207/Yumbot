package com.yummy.yumbot.main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.yummy.yumbot.dto.CategorySubDto;
import com.yummy.yumbot.dto.HashtagDto;
import com.yummy.yumbot.dto.MemberDto;
import com.yummy.yumbot.dto.RestaurantDto;
import com.yummy.yumbot.dto.ReviewDto;
import com.yummy.yumbot.main.service.MainServiceImpl;

@Controller
@RequestMapping("/*")
public class MainController {
	
	
	
	
	@Autowired
	private MainServiceImpl mainService;
	
	@RequestMapping("main")
	public String main(Model model) {
		List<List<Map<String, Object>>> restaurantRankingDataList=mainService.getTop20PositiveScoreRestaurant();
		List<Map<String,Object>> restaurantPerTop5Hashtag=mainService.getTop20RestaurantListByTop5HashtagNum();
		
		model.addAttribute("restaurantRankingDataList", restaurantRankingDataList);
		model.addAttribute("restaurantPerTop5Hashtag", restaurantPerTop5Hashtag);
		return "main";
	}
	
	@RequestMapping("restaurantMap")
	public String restaurantMap() {
		return "restaurantMap";
	}
	
	@RequestMapping("search")
	public String search(Model model) {
		List<CategorySubDto> categorySubDtoList=mainService.getAllCategorySub();
		model.addAttribute("categorySubDtoList", categorySubDtoList);
		return "search";
	}
	
	@RequestMapping("restaurantDetail")
	public String restaurantDetail(int restaurant_pk,Model model) {
		Map<String,Object> restaurantData=mainService.getRestaurantDataByPk(restaurant_pk);
		
		model.addAttribute("restaurantData", restaurantData);
		return "restaurantDetail";
	}
	
	@RequestMapping("writeReview")
	public String writeReview(int restaurant_pk,Model model) {
		RestaurantDto restaurantDto=mainService.getRestaurantByPk(restaurant_pk);
		List<HashtagDto> category1HashtagDtoList=mainService.getHashtagByCategoryPk(1);
		List<HashtagDto> category2HashtagDtoList=mainService.getHashtagByCategoryPk(2);
		List<HashtagDto> category3HashtagDtoList=mainService.getHashtagByCategoryPk(3);
		
		model.addAttribute("restaurantDto", restaurantDto);
		model.addAttribute("category1HashtagDtoList", category1HashtagDtoList);
		model.addAttribute("category2HashtagDtoList", category2HashtagDtoList);
		model.addAttribute("category3HashtagDtoList", category3HashtagDtoList);
		
		return "writeReview";
	}
	
	@RequestMapping("reviewRegisterProcess")
	public String reviewRegisterProcess(
			HttpSession session,
			MultipartFile[] review_images,ReviewDto reviewDto,
			int[] category1_hashtag,int[] category2_hashtag,int[] category3_hashtag,int[] category4_hashtag) {
	
		MemberDto memberUser=(MemberDto) session.getAttribute("memberUser");
		reviewDto.setMember_pk(memberUser.getMember_pk());
		mainService.createReview(reviewDto,review_images,category1_hashtag,category2_hashtag,category3_hashtag,category4_hashtag);
		
		return "redirect:./restaurantDetail?restaurant_pk="+reviewDto.getRestaurant_pk();
	}
}
