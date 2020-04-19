package com.kh.WDWD.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.contents.model.vo.Contents;
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

	public int updateProfileImg(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateProfileImg", m);
	}

	public int insertContents(SqlSessionTemplate sqlSession, Contents c) {
		return sqlSession.insert("memberMapper.insertContents", c);
	}
	
}
