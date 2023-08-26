package com.yummy.yumbot.member.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yummy.yumbot.dto.MemberDto;
import com.yummy.yumbot.member.mapper.MemberSqlMapper;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private MemberSqlMapper memberSqlMapper;
	
	public void createMember(MemberDto memberDto, MultipartFile member_image) {
		if(member_image!=null) {
			String rootFolder="C:/yumbotFiles/member_images/";
			//날짜별 폴더 생성 로직
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
			String today=sdf.format(new Date());
			
			File targetFolder=new File(rootFolder+today);
			if(!targetFolder.exists()) {
				targetFolder.mkdirs();
			}
			//저장파일명 만들기. 핵심은 파일명 충돌 방지=랜덤값+시간
			String fileName=UUID.randomUUID().toString();
			fileName+="_"+System.currentTimeMillis();
			
			//확장자 추출
			String originalFileName=member_image.getOriginalFilename();
			String ext=originalFileName.substring(originalFileName.lastIndexOf("."));
			
			String saveFileName=today+"/"+fileName+ext;
			try {
				member_image.transferTo(new File(rootFolder+saveFileName));	
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			memberDto.setMember_image_link(saveFileName);
			
		}
		memberSqlMapper.createMember(memberDto);
	}

	public MemberDto getMemberByIdAndPw(MemberDto memberDto) {
		return memberSqlMapper.getMemberByIdAndPw(memberDto);
	}

}
