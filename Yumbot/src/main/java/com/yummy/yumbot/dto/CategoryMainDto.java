package com.yummy.yumbot.dto;

public class CategoryMainDto {
	private int category_main_pk ;
	private String category_main_name ;
	public CategoryMainDto() {
		super();
	}
	public CategoryMainDto(int category_main_pk, String category_main_name) {
		super();
		this.category_main_pk = category_main_pk;
		this.category_main_name = category_main_name;
	}
	public int getCategory_main_pk() {
		return category_main_pk;
	}
	public void setCategory_main_pk(int category_main_pk) {
		this.category_main_pk = category_main_pk;
	}
	public String getCategory_main_name() {
		return category_main_name;
	}
	public void setCategory_main_name(String category_main_name) {
		this.category_main_name = category_main_name;
	}
	@Override
	public String toString() {
		return "CategoryMainDto [category_main_pk=" + category_main_pk + ", category_main_name=" + category_main_name
				+ "]";
	}
	
	
}
