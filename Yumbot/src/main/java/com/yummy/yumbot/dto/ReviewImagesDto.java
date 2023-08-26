package com.yummy.yumbot.dto;

public class ReviewImagesDto {
	private int review_images_pk;
	private int review_pk ;
	private String review_images_link ;
	public ReviewImagesDto() {
		super();
	}
	public ReviewImagesDto(int review_images_pk, int review_pk, String review_images_link) {
		super();
		this.review_images_pk = review_images_pk;
		this.review_pk = review_pk;
		this.review_images_link = review_images_link;
	}
	public int getReview_images_pk() {
		return review_images_pk;
	}
	public void setReview_images_pk(int review_images_pk) {
		this.review_images_pk = review_images_pk;
	}
	public int getReview_pk() {
		return review_pk;
	}
	public void setReview_pk(int review_pk) {
		this.review_pk = review_pk;
	}
	public String getReview_images_link() {
		return review_images_link;
	}
	public void setReview_images_link(String review_images_link) {
		this.review_images_link = review_images_link;
	}
	@Override
	public String toString() {
		return "ReviewImagesDto [review_images_pk=" + review_images_pk + ", review_pk=" + review_pk
				+ ", review_images_link=" + review_images_link + "]";
	}
	
	
}
