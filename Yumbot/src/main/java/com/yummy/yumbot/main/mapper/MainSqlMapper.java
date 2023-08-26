package com.yummy.yumbot.main.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yummy.yumbot.dto.CategoryMainDto;
import com.yummy.yumbot.dto.CategorySubDto;
import com.yummy.yumbot.dto.HashtagCategoryDto;
import com.yummy.yumbot.dto.HashtagDto;
import com.yummy.yumbot.dto.RestaurantDto;
import com.yummy.yumbot.dto.RestaurantHashtagInfoDto;
import com.yummy.yumbot.dto.RestaurantLikesDto;
import com.yummy.yumbot.dto.ReviewDto;
import com.yummy.yumbot.dto.ReviewHashtagDto;
import com.yummy.yumbot.dto.ReviewImagesDto;
import com.yummy.yumbot.dto.ReviewLikesDto;
import com.yummy.yumbot.dto.SearchRestaurantDto;
	
public interface MainSqlMapper {

	public List<SearchRestaurantDto> getTop5RestaurantHasReview(String[] idList);

	public int countRestaurantHasReview(String[] idList);

	public int createRestaurantPk();

	public void createRestaurant(RestaurantDto restaurantDto);

	public CategoryMainDto getCategoryMainByName(String category_main_name);

	public int createCategoryMainPk();

	public void createCategoryMain(CategoryMainDto categoryMainDto);

	public CategorySubDto getCategorySubByName(String category_sub_name);

	public int createCategorySubPk();

	public void createCategorySub(CategorySubDto categorySubDto);

	public int countRestaurantById(String id);

	public ReviewDto getReviewByRestaurantPkAndMostReviewLikes(int restaurant_pk);

	public RestaurantDto getRestaurantByPk(int restaurant_pk);

	public List<ReviewDto> getReviewByRestaurantPkOrderByReviewLikesNum(int restaurant_pk);

	public int countReviewByRestaurantPk(int restaurant_pk);

	public int countRestaurantLikesByRestaurantPk(int restaurant_pk);

	public List<ReviewImagesDto> getReviewImagesByReviewPk(int review_pk);

	public int countReviewLikesByReviewPk(int review_pk);

	public CategorySubDto getCategorySubByPk(int restaurant_pk);

	public CategoryMainDto getCategoryMainByPk(int category_main_pk);

	public List<HashtagDto> getTop3HashtagByRestaurantPk(int restaurant_pk);

	public HashtagDto getHashtagByPk(int hashtag_pk);

	public List<ReviewHashtagDto> getReviewHashtagByReviewPk(int review_pk);

	public List<HashtagCategoryDto> getAllHashtagCategory();

	public List<RestaurantHashtagInfoDto> getRestaurantHashtagInfoByRestaurantPkAndHashtagCategoryPkOrderByReviewHashtagNum(
			@Param(value ="restaurant_pk") int restaurant_pk,
			@Param(value ="hashtag_category_pk") int hashtag_category_pk);

	public List<HashtagDto> getHashtagByCategoryPk(int hashtag_category_pk);

	public int createReviewPk();

	public void createReviewImages(ReviewImagesDto reviewImagesDto);

	public void createReviewHashtag(ReviewHashtagDto reviewHashtagDto);

	public void createReview(ReviewDto reviewDto);

	public void createHashtag(HashtagDto hashtagDto);

	public int createHashtagPk();

	public HashtagDto getHashtagByName(String hashtag_name);

	public List<CategorySubDto> getAllCategorySub();

	public List<SearchRestaurantDto> getTop5RestaurantHasReviewByCategorySubList(
			@Param(value="idList") String[] idList, 
			@Param(value="categorySubList") int[] categorySubList);

	public List<HashtagDto> getTop5Hashtag();

	public List<Map<String, Object>> get4RestaurantByHashtagPkAndRownum(
			@Param(value="hashtag_pk") int hashtag_pk,
			@Param(value="i") int i);

	public Map<String, Object> getAvgScoreByRestaurantPk(int restaurant_pk);

	public List<ReviewImagesDto> getReviewImagesByRestaurantPk(Object object);

	public List<Map<String, Object>> get4RestaurantByRownumOrderByPositiveScore(int i);

	public RestaurantLikesDto getRestaurantLikesByMemberPkAndRestaurantPk(RestaurantLikesDto params);

	public void createRestaurantLikes(RestaurantLikesDto params);

	public void deleteRestaurantLikes(RestaurantLikesDto params);

	public ReviewLikesDto getReviewLikesByMemberPkAndReviewPk(ReviewLikesDto params);

	public void createReviewLikes(ReviewLikesDto params);

	public void deleteReviewLikes(ReviewLikesDto params);


	
}
