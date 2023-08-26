package com.yummy.yumbot.dto;

public class RestaurantDto {
	private int restaurant_pk ;
	private int category_sub_pk ;
	private String id ;
	private String address_name ;
	private String phone ;
	private String place_name ;
	private String x ;
	private String y ;
	public RestaurantDto() {
		super();
	}
	public RestaurantDto(int restaurant_pk, int category_sub_pk, String id, String address_name, String phone,
			String place_name, String x, String y) {
		super();
		this.restaurant_pk = restaurant_pk;
		this.category_sub_pk = category_sub_pk;
		this.id = id;
		this.address_name = address_name;
		this.phone = phone;
		this.place_name = place_name;
		this.x = x;
		this.y = y;
	}
	public int getRestaurant_pk() {
		return restaurant_pk;
	}
	public void setRestaurant_pk(int restaurant_pk) {
		this.restaurant_pk = restaurant_pk;
	}
	public int getCategory_sub_pk() {
		return category_sub_pk;
	}
	public void setCategory_sub_pk(int category_sub_pk) {
		this.category_sub_pk = category_sub_pk;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	@Override
	public String toString() {
		return "RetaurantDto [restaurant_pk=" + restaurant_pk + ", category_sub_pk=" + category_sub_pk + ", id=" + id
				+ ", address_name=" + address_name + ", phone=" + phone + ", place_name=" + place_name + ", x=" + x
				+ ", y=" + y + "]";
	}
	
	
}
