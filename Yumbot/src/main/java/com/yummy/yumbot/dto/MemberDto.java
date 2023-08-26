package com.yummy.yumbot.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberDto {
	private int member_pk;
	private String member_id ;
	private String member_pw ;
	private String member_nickname;
	private String member_phone ;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date member_birth ;
	private String member_gender ;
	private String member_image_link;
	private Date member_reg_date ;
	public MemberDto() {
		super();
	}
	public MemberDto(int member_pk, String member_id, String member_pw, String member_nickname, String member_phone,
			Date member_birth, String member_gender, String member_image_link, Date member_reg_date) {
		super();
		this.member_pk = member_pk;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_nickname = member_nickname;
		this.member_phone = member_phone;
		this.member_birth = member_birth;
		this.member_gender = member_gender;
		this.member_image_link = member_image_link;
		this.member_reg_date = member_reg_date;
	}
	public int getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public Date getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_image_link() {
		return member_image_link;
	}
	public void setMember_image_link(String member_image_link) {
		this.member_image_link = member_image_link;
	}
	public Date getMember_reg_date() {
		return member_reg_date;
	}
	public void setMember_reg_date(Date member_reg_date) {
		this.member_reg_date = member_reg_date;
	}
	@Override
	public String toString() {
		return "MemberDto [member_pk=" + member_pk + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_nickname=" + member_nickname + ", member_phone=" + member_phone + ", member_birth="
				+ member_birth + ", member_gender=" + member_gender + ", member_image_link=" + member_image_link
				+ ", member_reg_date=" + member_reg_date + "]";
	}
	
	
	
}
