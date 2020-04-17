package com.kh.WDWD.member.model.service;

import com.kh.WDWD.member.model.vo.Member;

public interface MemberService {

	Member selectMember(String userId);
  
    Member loginMember(Member m);

	int insertMember(Member m);

}

