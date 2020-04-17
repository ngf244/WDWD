package com.kh.WDWD.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.member.model.vo.Member;

@Repository("uDAO")
public class MemberDAO {

	public Member selectMember(SqlSessionTemplate sqlSession, String userId) {
		return (Member)sqlSession.selectOne("memberMapper.selectMember", userId);
	}

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
}
