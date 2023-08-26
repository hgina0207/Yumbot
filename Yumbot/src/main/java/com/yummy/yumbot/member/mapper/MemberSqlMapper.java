package com.yummy.yumbot.member.mapper;

import com.yummy.yumbot.dto.MemberDto;

public interface MemberSqlMapper {

	public void createMember(MemberDto memberDto);

	public MemberDto getMemberByIdAndPw(MemberDto memberDto);

	public MemberDto getMemberByPk(int member_pk);

}
