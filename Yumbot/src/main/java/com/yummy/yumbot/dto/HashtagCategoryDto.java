package com.yummy.yumbot.dto;

public class HashtagCategoryDto {
	private int hashtag_category_pk ;
	private String hashtag_category_name ;
	public HashtagCategoryDto() {
		super();
	}
	public HashtagCategoryDto(int hashtag_category_pk, String hashtag_category_name) {
		super();
		this.hashtag_category_pk = hashtag_category_pk;
		this.hashtag_category_name = hashtag_category_name;
	}
	public int getHashtag_category_pk() {
		return hashtag_category_pk;
	}
	public void setHashtag_category_pk(int hashtag_category_pk) {
		this.hashtag_category_pk = hashtag_category_pk;
	}
	public String getHashtag_category_name() {
		return hashtag_category_name;
	}
	public void setHashtag_category_name(String hashtag_category_name) {
		this.hashtag_category_name = hashtag_category_name;
	}
	@Override
	public String toString() {
		return "HashtagCategoryDto [hashtag_category_pk=" + hashtag_category_pk + ", hashtag_category_name="
				+ hashtag_category_name + "]";
	}
	
	
	
	
	
}
