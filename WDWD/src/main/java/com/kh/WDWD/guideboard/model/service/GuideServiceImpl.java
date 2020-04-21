package com.kh.WDWD.guideboard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.WDWD.guideboard.model.dao.GuideDAO;
import com.kh.WDWD.guideboard.model.vo.Guideboard;

@Service("gService")
public class GuideServiceImpl implements GuideService {

	@Autowired
	private GuideDAO guideDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void create(Guideboard vo) {
		String title = vo.getTitle();
		String content = vo.getContent();
		String writer = vo.getWriter();
		
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace("<", "&gt;");
		
		title = title.replace("   ", "&nbsp;&nbsp;");
		writer = writer.replace(" 	", "&nbsp;&nbsp;");
		
		content = content.replace("\n", "<br>");
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		guideDao.create(sqlSession, vo);
	}
	
	// 게시글 상세보기
	@Override
	public Guideboard read(int bno) {
		return guideDao.read(sqlSession, bno);
	}

	// 게시글 수정
	@Override
	public void update(Guideboard vo) {
		guideDao.update(sqlSession, vo);
	}

	// 게시글 삭제
	@Override
	public void delete(int bno) {
		guideDao.delete(sqlSession, bno);
	}

	// 게시글 전체 목록
	@Override
	public List<Guideboard> listAll(){
		return guideDao.listAll(sqlSession);
	}

	// 게시글 조회수 증가
	@Override
	public void increaseViewcnt(int bno, HttpSession session) {
		long update_time = 0;
		
		
		if(session.getAttribute("update_time"+bno) != null) {
			
			update_time = (long)session.getAttribute("update_time_"+ bno);
			
		}
		
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5*1000) {
			guideDao.increaseViewcnt(sqlSession, bno);
			
			session.setAttribute("update_time_"+bno, current_time);
		}
	}
}
