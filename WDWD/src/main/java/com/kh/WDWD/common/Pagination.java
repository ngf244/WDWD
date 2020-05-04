package com.kh.WDWD.common;

import com.kh.WDWD.board.model.vo.PageInfo;

public class Pagination {

	public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;
		
		int pageLimit = 10; // 한 페이지에서 보일 페이징 수
		int maxPage;	// 전체 페이지 중 마지막 페이지
		int startPage;	// 현재 페이지에서 보일 페이징 버튼의 시작 페이지
		int endPage;	// 현재 페이지에서 보일 페이징 버튼의 마지막 페이지
		int boardLimit = 10;	// 한 페이지에 보일 게시글 수
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = (((int)((double)currentPage/pageLimit + 0.9)) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}

	public static PageInfo getMyReplyPageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;
		
		int pageLimit = 8; // 한 페이지에서 보일 페이징 수
		int maxPage;	// 전체 페이지 중 마지막 페이지
		int startPage;	// 현재 페이지에서 보일 페이징 버튼의 시작 페이지
		int endPage;	// 현재 페이지에서 보일 페이징 버튼의 마지막 페이지
		int boardLimit = 15;	// 한 페이지에 보일 게시글 수
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = (((int)((double)currentPage/pageLimit + 0.9)) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}	

	public static PageInfo getMyCashChangePageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;
		
		int pageLimit = 8; // 한 페이지에서 보일 페이징 수
		int maxPage;	// 전체 페이지 중 마지막 페이지
		int startPage;	// 현재 페이지에서 보일 페이징 버튼의 시작 페이지
		int endPage;	// 현재 페이지에서 보일 페이징 버튼의 마지막 페이지
		int boardLimit = 10;	// 한 페이지에 보일 게시글 수
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = (((int)((double)currentPage/pageLimit + 0.9)) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}		
	
	
	public static PageInfo getCBoardPageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;
		
		int pageLimit = 10; // 한 페이지에서 보일 페이징 수
		int maxPage;	// 전체 페이지 중 마지막 페이지
		int startPage;	// 현재 페이지에서 보일 페이징 버튼의 시작 페이지
		int endPage;	// 현재 페이지에서 보일 페이징 버튼의 마지막 페이지
		int boardLimit = 10;	// 한 페이지에 보일 게시글 수
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = (((int)((double)currentPage/pageLimit + 0.9)) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}

	public static PageInfo getReqWorkListPageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;
		
		int pageLimit = 8; // 한 페이지에서 보일 페이징 수
		int maxPage;	// 전체 페이지 중 마지막 페이지
		int startPage;	// 현재 페이지에서 보일 페이징 버튼의 시작 페이지
		int endPage;	// 현재 페이지에서 보일 페이징 버튼의 마지막 페이지
		int boardLimit = 6;	// 한 페이지에 보일 게시글 수
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = (((int)((double)currentPage/pageLimit + 0.9)) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}
	
	public static com.kh.WDWD.guideboard.model.vo.PageInfo Pagination(int currentPage, int listCount) {
		return null;
	}
	
	public static PageInfo getPortpolioListPageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;
		
		int pageLimit = 8; // 한 페이지에서 보일 페이징 수
		int maxPage;	// 전체 페이지 중 마지막 페이지
		int startPage;	// 현재 페이지에서 보일 페이징 버튼의 시작 페이지
		int endPage;	// 현재 페이지에서 보일 페이징 버튼의 마지막 페이지
		int boardLimit = 16;	// 한 페이지에 보일 게시글 수
		
		maxPage = (int)((double)listCount/boardLimit + 0.9375);
		startPage = (((int)((double)currentPage/pageLimit + 0.9)) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}
	
	public static PageInfo getMypageMainPortListPageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;
		
		int pageLimit = 8; // 한 페이지에서 보일 페이징 수
		int maxPage;	// 전체 페이지 중 마지막 페이지
		int startPage;	// 현재 페이지에서 보일 페이징 버튼의 시작 페이지
		int endPage;	// 현재 페이지에서 보일 페이징 버튼의 마지막 페이지
		int boardLimit = 8;	// 한 페이지에 보일 게시글 수
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = (((int)((double)currentPage/pageLimit + 0.9)) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}
	
	
	
	public static PageInfo getCashBoardEternalPageInfo(int currentPage, int listCount) {
		
		PageInfo piCash = null;
		
		int pageLimit = 1; // 한 페이지에서 보일 페이징 수
		int maxPage;	// 전체 페이지 중 마지막 페이지
		int startPage;	// 현재 페이지에서 보일 페이징 버튼의 시작 페이지
		int endPage;	// 현재 페이지에서 보일 페이징 버튼의 마지막 페이지
		int boardLimit = 5;	// 한 페이지에 보일 게시글 수
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = (((int)((double)currentPage/pageLimit + 0.9)) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		piCash = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return piCash;
	}
	
	
}
