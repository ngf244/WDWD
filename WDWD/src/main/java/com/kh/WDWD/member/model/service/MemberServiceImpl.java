package com.kh.WDWD.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.member.model.dao.MemberDAO;
import com.kh.WDWD.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired	
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectMember(String userId) {
		return mDAO.selectMember(sqlSession, userId);
	}
	
	@Override
	public Member loginMember(Member m) {
		return mDAO.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}	

}
