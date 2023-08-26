package com.yummy.yumbot.dto;

public class HashtagDto {
	private int hashtag_pk;
	private int hashtag_category_pk ;
	private String hashtag_name ;
	public HashtagDto() {
		super();
	}
	public HashtagDto(int hashtag_pk, int hashtag_category_pk, String hashtag_name) {
		super();
		this.hashtag_pk = hashtag_pk;
		this.hashtag_category_pk = hashtag_category_pk;
		this.hashtag_name = hashtag_name;
	}
	public int getHashtag_pk() {
		return hashtag_pk;
	}
	public void setHashtag_pk(int hashtag_pk) {
		this.hashtag_pk = hashtag_pk;
	}
	public int getHashtag_category_pk() {
		return hashtag_category_pk;
	}
	public void setHashtag_category_pk(int hashtag_category_pk) {
		this.hashtag_category_pk = hashtag_category_pk;
	}
	public String getHashtag_name() {
		return hashtag_name;
	}
	public void setHashtag_name(String hashtag_name) {
		this.hashtag_name = hashtag_name;
	}
	@Override
	public String toString() {
		return "HashtagDto [hashtag_pk=" + hashtag_pk + ", hashtag_category_pk=" + hashtag_category_pk
				+ ", hashtag_name=" + hashtag_name + "]";
	}
	
	
	
}
