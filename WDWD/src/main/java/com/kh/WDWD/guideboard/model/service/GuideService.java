package com.kh.WDWD.guideboard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.WDWD.guideboard.model.vo.Guideboard;

public interface GuideService {
	
	//  게시글 작성부분!!
	public void create(Guideboard vo);
	
	//  게시글 상세보기 !!
	public Guideboard read(int bno);
	
	// 	게시글 수정
	public void update(Guideboard vo);
	
	//  게시글 삭제
	public void delete(int bno);
	
	// 게시글 전체 목록
	public List<Guideboard> listAll();
	
	// 게시글 조회
	public void increaseViewcnt(int bno, HttpSession session);
	
		
	}
