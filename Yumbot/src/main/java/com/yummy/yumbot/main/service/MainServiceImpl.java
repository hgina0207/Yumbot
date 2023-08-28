package com.yummy.yumbot.main.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yummy.yumbot.dto.CategoryMainDto;
import com.yummy.yumbot.dto.CategorySubDto;
import com.yummy.yumbot.dto.HashtagCategoryDto;
import com.yummy.yumbot.dto.HashtagDto;
import com.yummy.yumbot.dto.MemberDto;
import com.yummy.yumbot.dto.RestaurantDto;
import com.yummy.yumbot.dto.RestaurantHashtagInfoDto;
import com.yummy.yumbot.dto.RestaurantLikesDto;
import com.yummy.yumbot.dto.ReviewDto;
import com.yummy.yumbot.dto.ReviewHashtagDto;
import com.yummy.yumbot.dto.ReviewImagesDto;
import com.yummy.yumbot.dto.ReviewLikesDto;
import com.yummy.yumbot.dto.SearchRestaurantDto;
import com.yummy.yumbot.main.mapper.MainSqlMapper;
import com.yummy.yumbot.member.mapper.MemberSqlMapper;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.comprehend.ComprehendClient;
import software.amazon.awssdk.services.comprehend.model.DetectSentimentRequest;
import software.amazon.awssdk.services.comprehend.model.DetectSentimentResponse;

@Service
public class MainServiceImpl {

	@Autowired
	private AWSKeyManager awsKeyManager;

	@Autowired
	private MainSqlMapper mainSqlMapper;
	@Autowired
	private MemberSqlMapper memberSqlMapper;

	public List<Map<String, Object>> getTop5RestaurantHasReview(String[] idList) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		List<SearchRestaurantDto> searchRestaurantDtoList = mainSqlMapper.getTop5RestaurantHasReview(idList);
		for (SearchRestaurantDto searchRestaurantDto : searchRestaurantDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			ReviewDto reviewDto = mainSqlMapper.getReviewByRestaurantPkAndMostReviewLikes(
					searchRestaurantDto.getRestaurantDto().getRestaurant_pk());
			MemberDto memberDto = memberSqlMapper.getMemberByPk(reviewDto.getMember_pk());
			List<ReviewImagesDto> reviewImagesDtoList = mainSqlMapper
					.getReviewImagesByReviewPk(reviewDto.getReview_pk());

			Map<String, Object> score = mainSqlMapper
					.getAvgScoreByRestaurantPk(searchRestaurantDto.getRestaurantDto().getRestaurant_pk());

			map.put("score", score);
			map.put("searchRestaurantDto", searchRestaurantDto);
			map.put("reviewDto", reviewDto);
			map.put("reviewImagesDtoList", reviewImagesDtoList);
			map.put("memberDto", memberDto);

			list.add(map);
		}
		return list;
	}

	public int countRestaurantHasReview(String[] idList) {
		return mainSqlMapper.countRestaurantHasReview(idList);
	}

	public void createRestaurant(List<SearchRestaurantDto> searchRestaurantDtoList) {

		for (SearchRestaurantDto searchRestaurantDto : searchRestaurantDtoList) {
			int isRestaurantExist = mainSqlMapper.countRestaurantById(searchRestaurantDto.getRestaurantDto().getId());

			int restaurant_pk = 0;
			if (isRestaurantExist == 0) {
				RestaurantDto restaurantDto = new RestaurantDto();
				restaurant_pk = mainSqlMapper.createRestaurantPk();

				restaurantDto = searchRestaurantDto.getRestaurantDto();
				restaurantDto.setRestaurant_pk(restaurant_pk);

				int category_main_pk = 0;
				CategoryMainDto categoryMainDto = mainSqlMapper
						.getCategoryMainByName(searchRestaurantDto.getCategory_main_name());
				if (categoryMainDto == null) {
					category_main_pk = mainSqlMapper.createCategoryMainPk();

					categoryMainDto = new CategoryMainDto();
					categoryMainDto.setCategory_main_name(searchRestaurantDto.getCategory_main_name());
					categoryMainDto.setCategory_main_pk(category_main_pk);
					mainSqlMapper.createCategoryMain(categoryMainDto);
				} else {
					category_main_pk = categoryMainDto.getCategory_main_pk();
				}

				int category_sub_pk = 0;
				CategorySubDto categorySubDto = mainSqlMapper
						.getCategorySubByName(searchRestaurantDto.getCategory_sub_name());
				if (categorySubDto == null) {
					category_sub_pk = mainSqlMapper.createCategorySubPk();

					categorySubDto = new CategorySubDto();
					categorySubDto.setCategory_main_pk(category_main_pk);
					categorySubDto.setCategory_sub_pk(category_sub_pk);
					categorySubDto.setCategory_sub_name(searchRestaurantDto.getCategory_sub_name());

					mainSqlMapper.createCategorySub(categorySubDto);
				} else {
					category_sub_pk = categorySubDto.getCategory_sub_pk();
				}

				restaurantDto.setCategory_sub_pk(category_sub_pk);
				mainSqlMapper.createRestaurant(restaurantDto);
			}

		}

	}

	public Map<String, Object> getRestaurantDataByPk(int restaurant_pk) {
		Map<String, Object> result = new HashMap<String, Object>();

		RestaurantDto restaurantDto = mainSqlMapper.getRestaurantByPk(restaurant_pk);
		int review_num = mainSqlMapper.countReviewByRestaurantPk(restaurant_pk);
		int restaurant_likes_num = mainSqlMapper.countRestaurantLikesByRestaurantPk(restaurant_pk);
		CategorySubDto categorySubDto = mainSqlMapper.getCategorySubByPk(restaurantDto.getCategory_sub_pk());
		CategoryMainDto categoryMainDto = mainSqlMapper.getCategoryMainByPk(categorySubDto.getCategory_main_pk());

		// top3해시태그
		List<HashtagDto> top3HashtagDtoList = mainSqlMapper.getTop3HashtagByRestaurantPk(restaurant_pk);

		// 카테고리별 해시태그
		List<RestaurantHashtagInfoDto> category1HashtagInfoDtoList = mainSqlMapper
				.getRestaurantHashtagInfoByRestaurantPkAndHashtagCategoryPkOrderByReviewHashtagNum(restaurant_pk, 1);
		List<RestaurantHashtagInfoDto> category2HashtagInfoDtoList = mainSqlMapper
				.getRestaurantHashtagInfoByRestaurantPkAndHashtagCategoryPkOrderByReviewHashtagNum(restaurant_pk, 2);
		List<RestaurantHashtagInfoDto> category3HashtagInfoDtoList = mainSqlMapper
				.getRestaurantHashtagInfoByRestaurantPkAndHashtagCategoryPkOrderByReviewHashtagNum(restaurant_pk, 3);

		List<ReviewDto> reviewDtoList = mainSqlMapper.getReviewByRestaurantPkOrderByReviewLikesNum(restaurant_pk);
		List<Map<String, Object>> reviewDataList = new ArrayList<Map<String, Object>>();
		List<ReviewImagesDto> reviewImages6List = new ArrayList<>();
		for (ReviewDto reviewDto : reviewDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();

			List<ReviewImagesDto> reviewImagesDtoList = mainSqlMapper
					.getReviewImagesByReviewPk(reviewDto.getReview_pk());
			if (reviewImages6List.size() < 6) {
				for (var i = 0; i < reviewImagesDtoList.size(); i++) {
					if (reviewImages6List.size() < 6) {
						reviewImages6List.add(reviewImagesDtoList.get(i));
					}
				}
			}

			int review_likes_num = mainSqlMapper.countReviewLikesByReviewPk(reviewDto.getReview_pk());

			List<HashtagDto> hashtagDtoList = new ArrayList<HashtagDto>();
			List<ReviewHashtagDto> reviewHashtagDtoList = mainSqlMapper
					.getReviewHashtagByReviewPk(reviewDto.getReview_pk());
			for (ReviewHashtagDto reviewHashtagDto : reviewHashtagDtoList) {
				HashtagDto hashtagDto = mainSqlMapper.getHashtagByPk(reviewHashtagDto.getHashtag_pk());
				hashtagDtoList.add(hashtagDto);
			}

			MemberDto memberDto = memberSqlMapper.getMemberByPk(reviewDto.getMember_pk());

			map.put("reviewDto", reviewDto);
			map.put("reviewImagesDtoList", reviewImagesDtoList);
			map.put("review_likes_num", review_likes_num);
			map.put("hashtagDtoList", hashtagDtoList);
			map.put("memberDto", memberDto);

			reviewDataList.add(map);

		}
		Map<String, Object> reviewScoreAvg = mainSqlMapper.getAvgScoreByRestaurantPk(restaurant_pk);

		result.put("reviewImages6List", reviewImages6List);
		result.put("reviewScoreAvg", reviewScoreAvg);
		result.put("restaurantDto", restaurantDto);
		result.put("review_num", review_num);
		result.put("restaurant_likes_num", restaurant_likes_num);
		result.put("reviewDataList", reviewDataList);
		result.put("categorySubDto", categorySubDto);
		result.put("categoryMainDto", categoryMainDto);
		result.put("top3HashtagDtoList", top3HashtagDtoList);
		result.put("category1HashtagInfoDtoList", category1HashtagInfoDtoList);
		result.put("category2HashtagInfoDtoList", category2HashtagInfoDtoList);
		result.put("category3HashtagInfoDtoList", category3HashtagInfoDtoList);
		
		ObjectMapper objectMapper=new ObjectMapper();
		String json;
		try {
			json = objectMapper.writeValueAsString(result);
			result.put("jsonData", json);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public RestaurantDto getRestaurantByPk(int restaurant_pk) {
		return mainSqlMapper.getRestaurantByPk(restaurant_pk);
	}

	public List<HashtagDto> getHashtagByCategoryPk(int hashtag_category_pk) {
		return mainSqlMapper.getHashtagByCategoryPk(hashtag_category_pk);
	}

	public void createReview(ReviewDto reviewDto, MultipartFile[] review_images, int[] category1_hashtag,
			int[] category2_hashtag, int[] category3_hashtag, int[] category4_hashtag) {

		System.out.println("==================== ComprehendClient start ========================");

		ComprehendClient comClient = ComprehendClient.builder().region(Region.AP_NORTHEAST_2)
				.credentialsProvider(StaticCredentialsProvider
						.create(AwsBasicCredentials.create(awsKeyManager.getAccessKey(), awsKeyManager.getSecretKey())))
				.build();

		DetectSentimentRequest detectSentimentRequest = DetectSentimentRequest.builder()
				.text(reviewDto.getReview_content()).languageCode("ko").build();

		DetectSentimentResponse detectSentimentResult = comClient.detectSentiment(detectSentimentRequest);
		System.out.println("The Neutral value is " + detectSentimentResult.sentimentScore().neutral());
		System.out.println("The Positive value is " + detectSentimentResult.sentimentScore().positive());
		System.out.println("The Negative value is " + detectSentimentResult.sentimentScore().negative());
		System.out.println("The Mixed value is " + detectSentimentResult.sentimentScore().mixed());

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("==================== ComprehendClient end ========================");

		int reviewPk = mainSqlMapper.createReviewPk();
		reviewDto.setReview_pk(reviewPk);
		System.out.println(Math.round(detectSentimentResult.sentimentScore().mixed() * 100 * 1000));
		reviewDto.setReview_neutral_score(
				Math.round(detectSentimentResult.sentimentScore().neutral() * 100 * 1000) / 1000);
		reviewDto.setReview_mixed_score(Math.round(detectSentimentResult.sentimentScore().mixed() * 100 * 1000) / 1000);
		reviewDto.setReview_negative_score(
				Math.round(detectSentimentResult.sentimentScore().negative() * 100 * 1000) / 1000);
		reviewDto.setReview_positive_score(
				Math.round(detectSentimentResult.sentimentScore().positive() * 100 * 1000) / 1000);

		mainSqlMapper.createReview(reviewDto);

		if (review_images != null) {
			for (MultipartFile multipartFile : review_images) {
				if (multipartFile.isEmpty()) {
					continue;
				}

				String rootFolder = "C:/yumbotFiles/review_images/";
				// 날짜별 폴더 생성 로직
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());

				File targetFolder = new File(rootFolder + today);
				if (!targetFolder.exists()) {
					targetFolder.mkdirs();
				}
				// 저장파일명 만들기. 핵심은 파일명 충돌 방지=랜덤값+시간
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();

				// 확장자 추출
				String originalFileName = multipartFile.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

				String saveFileName = today + "/" + fileName + ext;
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}

				ReviewImagesDto reviewImagesDto = new ReviewImagesDto();
				reviewImagesDto.setReview_images_link(saveFileName);
				reviewImagesDto.setReview_pk(reviewPk);

				mainSqlMapper.createReviewImages(reviewImagesDto);
			}
		}
		if (category1_hashtag != null) {
			for (int hashtag_pk : category1_hashtag) {
				ReviewHashtagDto reviewHashtagDto = new ReviewHashtagDto();
				reviewHashtagDto.setHashtag_pk(hashtag_pk);
				reviewHashtagDto.setReview_pk(reviewPk);

				mainSqlMapper.createReviewHashtag(reviewHashtagDto);
			}
		}
		if (category2_hashtag != null) {
			for (int hashtag_pk : category2_hashtag) {
				ReviewHashtagDto reviewHashtagDto = new ReviewHashtagDto();
				reviewHashtagDto.setHashtag_pk(hashtag_pk);
				reviewHashtagDto.setReview_pk(reviewPk);

				mainSqlMapper.createReviewHashtag(reviewHashtagDto);
			}
		}
		if (category3_hashtag != null) {
			for (int hashtag_pk : category3_hashtag) {
				ReviewHashtagDto reviewHashtagDto = new ReviewHashtagDto();
				reviewHashtagDto.setHashtag_pk(hashtag_pk);
				reviewHashtagDto.setReview_pk(reviewPk);

				mainSqlMapper.createReviewHashtag(reviewHashtagDto);
			}
		}
		if (category4_hashtag != null) {
			for (int hashtag_pk : category4_hashtag) {
				ReviewHashtagDto reviewHashtagDto = new ReviewHashtagDto();
				reviewHashtagDto.setHashtag_pk(hashtag_pk);
				reviewHashtagDto.setReview_pk(reviewPk);

				mainSqlMapper.createReviewHashtag(reviewHashtagDto);
			}
		}

	}

	public HashtagDto createHashtagAndReturn(HashtagDto params) {
		HashtagDto hashtagDto = mainSqlMapper.getHashtagByName(params.getHashtag_name());
		if (hashtagDto == null) {
			int hashtagPk = mainSqlMapper.createHashtagPk();
			params.setHashtag_pk(hashtagPk);
			mainSqlMapper.createHashtag(params);
			return params;
		} else {
			return hashtagDto;
		}

	}

	public List<CategorySubDto> getAllCategorySub() {

		return mainSqlMapper.getAllCategorySub();
	}

	public List<Map<String, Object>> getRestaurantListByCategorySubPkAndIdList(String[] idList, int[] categorySubList) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<SearchRestaurantDto> searchRestaurantDtoList = mainSqlMapper
				.getTop5RestaurantHasReviewByCategorySubList(idList, categorySubList);
		for (SearchRestaurantDto searchRestaurantDto : searchRestaurantDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			Map<String, Object> score = mainSqlMapper
					.getAvgScoreByRestaurantPk(searchRestaurantDto.getRestaurantDto().getRestaurant_pk());

			ReviewDto reviewDto = mainSqlMapper.getReviewByRestaurantPkAndMostReviewLikes(
					searchRestaurantDto.getRestaurantDto().getRestaurant_pk());
			MemberDto memberDto = memberSqlMapper.getMemberByPk(reviewDto.getMember_pk());
			List<ReviewImagesDto> reviewImagesDtoList = mainSqlMapper
					.getReviewImagesByReviewPk(reviewDto.getReview_pk());

			map.put("score", score);
			map.put("searchRestaurantDto", searchRestaurantDto);
			map.put("reviewDto", reviewDto);
			map.put("reviewImagesDtoList", reviewImagesDtoList);
			map.put("memberDto", memberDto);

			list.add(map);
		}
		return list;
	}

	public List<List<Map<String, Object>>> getTop20PositiveScoreRestaurant() {
		List<List<Map<String, Object>>> restaurantRankingDataList = new ArrayList<>();

		for (int i = 1; i <= 5; i++) {
			List<Map<String, Object>> restaurantDatas = new ArrayList<>();
			List<Map<String, Object>> restaurant4Data = mainSqlMapper.get4RestaurantByRownumOrderByPositiveScore(i);

			if (restaurant4Data.size() != 0) {
				for (Map<String, Object> restaurantData : restaurant4Data) {
					Map<String, Object> map = new HashMap<>();

					List<ReviewImagesDto> reviewImagesDtoList = mainSqlMapper
							.getReviewImagesByRestaurantPk(restaurantData.get("RESTAURANT_PK"));

					map.put("restaurantData", restaurantData);
					map.put("reviewImagesDto", reviewImagesDtoList.get(0));

					restaurantDatas.add(map);
				}
				restaurantRankingDataList.add(restaurantDatas);
			} else {
				break;
			}
		}

		return restaurantRankingDataList;
	}

	public void toggleRestaurantLike(RestaurantLikesDto params) {
		RestaurantLikesDto restaurantLikesDto = mainSqlMapper.getRestaurantLikesByMemberPkAndRestaurantPk(params);
		if (restaurantLikesDto == null) {
			mainSqlMapper.createRestaurantLikes(params);
		} else {
			mainSqlMapper.deleteRestaurantLikes(params);
		}

	}

	public int getRestaurantLikesByRestaurantPk(int restaurant_pk) {
		return mainSqlMapper.countRestaurantLikesByRestaurantPk(restaurant_pk);
	}

	public int getRestaurantlikedStatus(RestaurantLikesDto params) {
		RestaurantLikesDto restaurantLikesDto = mainSqlMapper.getRestaurantLikesByMemberPkAndRestaurantPk(params);
		if (restaurantLikesDto == null) {
			return 0;
		} else {
			return 1;
		}
	}

	public void toggleReviewLike(ReviewLikesDto params) {
		ReviewLikesDto reviewLikesDto = mainSqlMapper.getReviewLikesByMemberPkAndReviewPk(params);
		if (reviewLikesDto == null) {
			mainSqlMapper.createReviewLikes(params);
		} else {
			mainSqlMapper.deleteReviewLikes(params);
		}

	}

	public int getReviewLikesByReviewPk(int review_pk) {
		return mainSqlMapper.countReviewLikesByReviewPk(review_pk);
	}

	public int getReviewlikedStatus(ReviewLikesDto params) {
		ReviewLikesDto reviewLikesDto = mainSqlMapper.getReviewLikesByMemberPkAndReviewPk(params);
		if (reviewLikesDto == null) {
			return 0;
		} else {
			return 1;
		}
	}

	public List<Map<String, Object>> getTop20RestaurantListByTop5HashtagNum() {
		List<Map<String, Object>> result = new ArrayList<>();

		List<HashtagDto> hashtagDtoList = mainSqlMapper.getTop5Hashtag();

		for (HashtagDto hashtagDto : hashtagDtoList) {
			Map<String, Object> restaurantPerHashtag = new HashMap<>();
			List<List<Map<String, Object>>> restaurant20 = new ArrayList<>();
			for (int i = 1; i <= 5; i++) {
				List<Map<String, Object>> restaurantDatas = new ArrayList<>();
				List<Map<String, Object>> restaurant4Data = mainSqlMapper
						.get4RestaurantByHashtagPkAndRownum(hashtagDto.getHashtag_pk(), i);
				if (restaurant4Data.size() != 0) {
					for (Map<String, Object> restaurantData : restaurant4Data) {
						Map<String, Object> map = new HashMap<>();

						List<ReviewImagesDto> reviewImagesDtoList = mainSqlMapper
								.getReviewImagesByRestaurantPk(restaurantData.get("RESTAURANT_PK"));

						map.put("restaurantData", restaurantData);
						map.put("reviewImagesDto", reviewImagesDtoList.get(0));

						restaurantDatas.add(map);
					}

					restaurant20.add(restaurantDatas);
					System.out.println(restaurant20.get(i - 1));

				} else {
					break;
				}
			}
			restaurantPerHashtag.put("restaurant20", restaurant20);
			restaurantPerHashtag.put("hashtagDto", hashtagDto);

			System.out.println(hashtagDto.toString());

			System.out.println("restaurant20:" + restaurant20.toString());

			result.add(restaurantPerHashtag);
		}

		return result;
	}

	public List<CategorySubDto> getCategorySubListByIdList(String[] idList) {
		return mainSqlMapper.getCategorySubListByIdList(idList);
	}

}
