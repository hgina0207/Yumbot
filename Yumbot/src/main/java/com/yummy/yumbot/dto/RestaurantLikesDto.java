package com.yummy.yumbot.dto;

import java.util.Date;

public class RestaurantLikesDto {
	private int restaurant_likes_pk ;
	private int member_pk ;
	private int restaurant_pk ;
	private Date restaurant_likes_date ;
	public RestaurantLikesDto() {
		super();
	}
	public RestaurantLikesDto(int restaurant_likes_pk, int member_pk, int restaurant_pk, Date restaurant_likes_date) {
		super();
		this.restaurant_likes_pk = restaurant_likes_pk;
		this.member_pk = member_pk;
		this.restaurant_pk = restaurant_pk;
		this.restaurant_likes_date = restaurant_likes_date;
	}
	public int getRestaurant_likes_pk() {
		return restaurant_likes_pk;
	}
	public void setRestaurant_likes_pk(int restaurant_likes_pk) {
		this.restaurant_likes_pk = restaurant_likes_pk;
	}
	public int getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}
	public int getRestaurant_pk() {
		return restaurant_pk;
	}
	public void setRestaurant_pk(int restaurant_pk) {
		this.restaurant_pk = restaurant_pk;
	}
	public Date getRestaurant_likes_date() {
		return restaurant_likes_date;
	}
	public void setRestaurant_likes_date(Date restaurant_likes_date) {
		this.restaurant_likes_date = restaurant_likes_date;
	}
	@Override
	public String toString() {
		return "RestaurantLikesDto [restaurant_likes_pk=" + restaurant_likes_pk + ", member_pk=" + member_pk
				+ ", restaurant_pk=" + restaurant_pk + ", restaurant_likes_date=" + restaurant_likes_date + "]";
	}
	
	
}
