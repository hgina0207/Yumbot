package com.yummy.yumbot.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.yummy.yumbot.dto.MemberDto;
import com.yummy.yumbot.member.service.MemberServiceImpl;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session,MemberDto memberDto) {
		MemberDto memberUser=memberService.getMemberByIdAndPw(memberDto);
		if(memberUser==null) {
			return "redirect:./login?result=loginFail";
		}else {
			session.setAttribute("memberUser", memberUser);
			return "redirect:../main";
		}
	}
	
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session,HttpServletRequest request ) {
		session.invalidate();
		
		String redirectUrl=request.getHeader("Referer");
		System.out.println(redirectUrl);
		
		return "redirect:"+redirectUrl;
	}
	@RequestMapping("signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	@RequestMapping("signUpProcess")
	public String signUpProcess(MemberDto memberDto,MultipartFile member_image) {
		memberService.createMember(memberDto,member_image);
		
		return "redirect:./signUpComplete";
	}
	
	@RequestMapping("signUpComplete")
	public String signUpComplete() {
		return "member/signUpComplete";
	}
}
