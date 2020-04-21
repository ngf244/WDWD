package com.kh.WDWD.guideboard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.WDWD.guideboard.model.vo.Guideboard;

@Repository("guideDao")
public class GuideDAO {
	
	// 게시글 작성
	public void create(SqlSessionTemplate sqlSession, Guideboard vo) {
	//	SqlSession.insert("board.insert", vo);
	}
	
	
	// 게시글 상세보기
	public Guideboard read(SqlSessionTemplate sqlSession, int bno) {
	//	return SqlSession.selectOne("board.view", bno);
		return null;

		
	}
	
	// 게시글 수정
	public void update(SqlSessionTemplate sqlSession, Guideboard vo) {
	//	SqlSession.update("board.updateArticle", vo);
		
	}
	
	// 게시글 삭제
	public void delete(SqlSessionTemplate sqlSession, int bno) {
	//	SqlSession.delete("board.deleteArticel", bno);
		
	}
	
	// 게시글 전체 목록
	public List<Guideboard> listAll(SqlSessionTemplate sqlSession){
		return sqlSession.selectList("guideboardMapper.listAll");
	}
	
	// 게시글 조회수 증가
	public void increaseViewcnt(SqlSessionTemplate sqlSession, int bno){
	//		SqlSession.update("board.increaseViewcnt", bno);
			
	}
}
