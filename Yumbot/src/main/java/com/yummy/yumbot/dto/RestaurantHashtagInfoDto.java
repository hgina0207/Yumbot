package com.yummy.yumbot.dto;

public class RestaurantHashtagInfoDto {
	private HashtagDto hashtagDto;
	private int review_hashtag_num;
	
	public RestaurantHashtagInfoDto() {
		super();
	}

	public RestaurantHashtagInfoDto(HashtagDto hashtagDto, int review_hashtag_num) {
		super();
		this.hashtagDto = hashtagDto;
		this.review_hashtag_num = review_hashtag_num;
	}

	public HashtagDto getHashtagDto() {
		return hashtagDto;
	}

	public void setHashtagDto(HashtagDto hashtagDto) {
		this.hashtagDto = hashtagDto;
	}

	public int getReview_hashtag_num() {
		return review_hashtag_num;
	}

	public void setReview_hashtag_num(int review_hashtag_num) {
		this.review_hashtag_num = review_hashtag_num;
	}

	@Override
	public String toString() {
		return "RestaurantHashtagInfoDto [hashtagDto=" + hashtagDto + ", review_hashtag_num=" + review_hashtag_num
				+ "]";
	}

	
	
	
	
}
