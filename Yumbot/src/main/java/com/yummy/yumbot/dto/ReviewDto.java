package com.yummy.yumbot.dto;

import java.sql.Date;

public class ReviewDto {
	private int review_pk ;
	private int member_pk ;
	private int restaurant_pk ;
	private String review_content ;
	private double review_neutral_score ;
	private double review_positive_score ;
	private double review_negative_score ;
	private double review_mixed_score ;
	private Date review_reg_date ;
	public ReviewDto() {
		super();
	}
	public ReviewDto(int review_pk, int member_pk, int restaurant_pk, String review_content,
			double review_neutral_score, double review_positive_score, double review_negative_score,
			double review_mixed_score, Date review_reg_date) {
		super();
		this.review_pk = review_pk;
		this.member_pk = member_pk;
		this.restaurant_pk = restaurant_pk;
		this.review_content = review_content;
		this.review_neutral_score = review_neutral_score;
		this.review_positive_score = review_positive_score;
		this.review_negative_score = review_negative_score;
		this.review_mixed_score = review_mixed_score;
		this.review_reg_date = review_reg_date;
	}
	public int getReview_pk() {
		return review_pk;
	}
	public void setReview_pk(int review_pk) {
		this.review_pk = review_pk;
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
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public double getReview_neutral_score() {
		return review_neutral_score;
	}
	public void setReview_neutral_score(double review_neutral_score) {
		this.review_neutral_score = review_neutral_score;
	}
	public double getReview_positive_score() {
		return review_positive_score;
	}
	public void setReview_positive_score(double review_positive_score) {
		this.review_positive_score = review_positive_score;
	}
	public double getReview_negative_score() {
		return review_negative_score;
	}
	public void setReview_negative_score(double review_negative_score) {
		this.review_negative_score = review_negative_score;
	}
	public double getReview_mixed_score() {
		return review_mixed_score;
	}
	public void setReview_mixed_score(double review_mixed_score) {
		this.review_mixed_score = review_mixed_score;
	}
	public Date getReview_reg_date() {
		return review_reg_date;
	}
	public void setReview_reg_date(Date review_reg_date) {
		this.review_reg_date = review_reg_date;
	}
	@Override
	public String toString() {
		return "ReviewDto [review_pk=" + review_pk + ", member_pk=" + member_pk + ", restaurant_pk=" + restaurant_pk
				+ ", review_content=" + review_content + ", review_neutral_score=" + review_neutral_score
				+ ", review_positive_score=" + review_positive_score + ", review_negative_score="
				+ review_negative_score + ", review_mixed_score=" + review_mixed_score + ", review_reg_date="
				+ review_reg_date + "]";
	}
	
	
}
