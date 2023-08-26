package com.yummy.yumbot.dto;

public class CategorySubDto {
	private int category_sub_pk ;
	private int category_main_pk ;
	private String category_sub_name ;
	public CategorySubDto() {
		super();
	}
	public CategorySubDto(int category_sub_pk, int category_main_pk, String category_sub_name) {
		super();
		this.category_sub_pk = category_sub_pk;
		this.category_main_pk = category_main_pk;
		this.category_sub_name = category_sub_name;
	}
	public int getCategory_sub_pk() {
		return category_sub_pk;
	}
	public void setCategory_sub_pk(int category_sub_pk) {
		this.category_sub_pk = category_sub_pk;
	}
	public int getCategory_main_pk() {
		return category_main_pk;
	}
	public void setCategory_main_pk(int category_main_pk) {
		this.category_main_pk = category_main_pk;
	}
	public String getCategory_sub_name() {
		return category_sub_name;
	}
	public void setCategory_sub_name(String category_sub_name) {
		this.category_sub_name = category_sub_name;
	}
	@Override
	public String toString() {
		return "CategorySubDto [category_sub_pk=" + category_sub_pk + ", category_main_pk=" + category_main_pk
				+ ", category_sub_name=" + category_sub_name + "]";
	}
	
	
}
