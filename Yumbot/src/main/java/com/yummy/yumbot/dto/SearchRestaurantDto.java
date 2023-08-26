package com.yummy.yumbot.dto;

public class SearchRestaurantDto {
	private RestaurantDto restaurantDto;
	private String category_main_name;
	private String category_sub_name;
	private int review_num;
	private int restaurant_likes_num;
	public SearchRestaurantDto() {
		super();
	}
	public SearchRestaurantDto(RestaurantDto restaurantDto, String category_main_name, String category_sub_name,
			int review_num, int restaurant_likes_num) {
		super();
		this.restaurantDto = restaurantDto;
		this.category_main_name = category_main_name;
		this.category_sub_name = category_sub_name;
		this.review_num = review_num;
		this.restaurant_likes_num = restaurant_likes_num;
	}
	public RestaurantDto getRestaurantDto() {
		return restaurantDto;
	}
	public void setRestaurantDto(RestaurantDto restaurantDto) {
		this.restaurantDto = restaurantDto;
	}
	public String getCategory_main_name() {
		return category_main_name;
	}
	public void setCategory_main_name(String category_main_name) {
		this.category_main_name = category_main_name;
	}
	public String getCategory_sub_name() {
		return category_sub_name;
	}
	public void setCategory_sub_name(String category_sub_name) {
		this.category_sub_name = category_sub_name;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getRestaurant_likes_num() {
		return restaurant_likes_num;
	}
	public void setRestaurant_likes_num(int restaurant_likes_num) {
		this.restaurant_likes_num = restaurant_likes_num;
	}
	@Override
	public String toString() {
		return "SearchRestaurantDto [restaurantDto=" + restaurantDto + ", category_main_name=" + category_main_name
				+ ", category_sub_name=" + category_sub_name + ", review_num=" + review_num + ", restaurant_likes_num="
				+ restaurant_likes_num + "]";
	}
	
	
	
	
}
