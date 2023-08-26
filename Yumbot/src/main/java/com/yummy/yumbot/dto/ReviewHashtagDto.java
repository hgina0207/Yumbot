package com.yummy.yumbot.dto;

public class ReviewHashtagDto {
	private int review_hashtag_pk ;
	private int review_pk ;
	private int hashtag_pk ;
	public ReviewHashtagDto() {
		super();
	}
	public ReviewHashtagDto(int review_hashtag_pk, int review_pk, int hashtag_pk) {
		super();
		this.review_hashtag_pk = review_hashtag_pk;
		this.review_pk = review_pk;
		this.hashtag_pk = hashtag_pk;
	}
	public int getReview_hashtag_pk() {
		return review_hashtag_pk;
	}
	public void setReview_hashtag_pk(int review_hashtag_pk) {
		this.review_hashtag_pk = review_hashtag_pk;
	}
	public int getReview_pk() {
		return review_pk;
	}
	public void setReview_pk(int review_pk) {
		this.review_pk = review_pk;
	}
	public int getHashtag_pk() {
		return hashtag_pk;
	}
	public void setHashtag_pk(int hashtag_pk) {
		this.hashtag_pk = hashtag_pk;
	}
	@Override
	public String toString() {
		return "ReviewHashtagDto [review_hashtag_pk=" + review_hashtag_pk + ", review_pk=" + review_pk + ", hashtag_pk="
				+ hashtag_pk + "]";
	}
	
	
}
