package com.yummy.yumbot.dto;

import java.util.Date;

public class ReviewLikesDto {
	private int review_likes_pk ;
	private int member_pk ;
	private int review_pk ;
	private Date review_likes_date ;
	public ReviewLikesDto() {
		super();
	}
	public ReviewLikesDto(int review_likes_pk, int member_pk, int review_pk, Date review_likes_date) {
		super();
		this.review_likes_pk = review_likes_pk;
		this.member_pk = member_pk;
		this.review_pk = review_pk;
		this.review_likes_date = review_likes_date;
	}
	public int getReview_likes_pk() {
		return review_likes_pk;
	}
	public void setReview_likes_pk(int review_likes_pk) {
		this.review_likes_pk = review_likes_pk;
	}
	public int getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}
	public int getReview_pk() {
		return review_pk;
	}
	public void setReview_pk(int review_pk) {
		this.review_pk = review_pk;
	}
	public Date getReview_likes_date() {
		return review_likes_date;
	}
	public void setReview_likes_date(Date review_likes_date) {
		this.review_likes_date = review_likes_date;
	}
	@Override
	public String toString() {
		return "ReviewLikesDto [review_likes_pk=" + review_likes_pk + ", member_pk=" + member_pk + ", review_pk="
				+ review_pk + ", review_likes_date=" + review_likes_date + "]";
	}
	
	
}
