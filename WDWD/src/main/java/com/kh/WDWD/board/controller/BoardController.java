package com.kh.WDWD.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.WDWD.board.model.exception.BoardException;
import com.kh.WDWD.board.model.service.BoardService;
import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.member.model.vo.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@RequestMapping("myReplyList.my")
	public ModelAndView myReplyListView(@RequestParam("userId") String userId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getMyReplyCount(userId);
		
		PageInfo pi = Pagination.getMyReplyPageInfo(currentPage, listCount);		
		ArrayList<Reply> rList = bService.selectMyReplyList(userId, pi);
		
		if(rList != null) {
			mv.addObject("rList", rList)
			  .addObject("pi", pi)
			  .addObject("userId", userId)
			  .setViewName("commentList");
		} else {
			throw new BoardException("내 댓글 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("list.bo")
	public String boardList() {
		return "board/boardlist";
	}
	@RequestMapping("freeDetail.bo")
	public String boardDetail() {
		return "board/boardDetail";
	}
	@RequestMapping("writing.bo")
	public String boardWriting() {
		return "board/boardwriting";
	}
	@RequestMapping("revis.bo")
	public String boardRevis() {
		return "board/boardrevis";
	}
	
	
	
	@RequestMapping(value = "imgUpload.bo", method = RequestMethod.POST) 
	public @ResponseBody void multipartUpload(MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception { 
		MultipartFile uploadFile = request.getFile("file");
		String renameFileName = "";
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			renameFileName = saveFile(uploadFile, request, userId);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(renameFileName, response.getWriter());
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request, String userId) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 웹 서버 contextPath를 불러와서 폴더의 경로 받아옴 (webapp 하위의 resources에 도달)
		
		String savePath = root + "/free_photo_upload/" + userId;
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName 
			= sdf.format(new Date(System.currentTimeMillis())) 
			+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return renameFileName;
	}
//	@RequestMapping(value = "freeWriting.bo", method = "POST")
	@RequestMapping("freeWriting.bo")
	public String boardWriting(HttpSession session, @RequestParam("freeBoardCategory") String category, @RequestParam("freeBoardTitle") String title,
								@RequestParam("fileRename") String[] reNamesArr, @RequestParam("fileOriginName") String[] originNamesArr,
								@RequestParam("writingContent") String wrtingConent, HttpServletRequest request) {
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		
		ArrayList<String> reNames = new ArrayList<>(Arrays.asList(reNamesArr));
		
		for(int i = 0; i < reNames.size(); i++) {
			if(reNames.get(i).equals("")) {
				reNames.remove("");
			}
		}
		// test ----------------
		for(int i = 0; i < reNames.size(); i++) {
			System.out.println(reNames.get(i));
		}
		// -------------------------
		ArrayList<String> originNames = new ArrayList<>(Arrays.asList(originNamesArr));
		
		for(int i = 0; i < originNames.size(); i++) {
			if(originNames.get(i).equals("")) {
				originNames.remove("");
			}
		}
		
		String check = FileMove(reNames, userId, request);
		if(check != null) {
			System.out.println("파일 이동 에러없이 완료! ");
		} else {
			throw new BoardException("아왜 파일이동 망했는데;;");
		}
		
		String root = request.getSession().getServletContext().getRealPath("resources");
        String beforePath = root + "/free_photo_upload/" + userId;
		
		deleteUserFolder(beforePath); // 임시 유저 아이디 폴더 삭제
		
		ArrayList<Contents> ContentArr = new ArrayList<Contents>();
		if(originNames.size() == reNames.size()) {
			for(int i = 0; i < reNames.size(); i++) {
				Contents content = new Contents();
				content.setConCop(reNames.get(i));
				content.setConOri(originNames.get(i));
				content.setConUrl(check);
				
				ContentArr.add(content);
			}
		} else {
			throw new BoardException("젠장 리스트 길이가 다르다..");
		}
		
		
		// 게시판 데이터부터 DB입력
		Board b = new Board();
		
		b.setBoCategory(category);
		b.setBoTitle(title);
		b.setBoWriter(userId);
		b.setBoGroup("1");
		b.setBoContent(wrtingConent);
		
		int result = bService.boardWriting(b);
		
		if(result>0) {
			int result2 = bService.insertContents(ContentArr);
			
			if(result2 >= reNames.size()) {
				return "redirect:actionList.ch";
			} else {
				throw new BoardException("콘텐츠 테이블 입력에 실패하였습니다.");
			}
			
		
		} else {
			throw new BoardException("게시판 테이블 입력에 실패하였습니다");
		}
		
		
	}
	
	
	
	public String FileMove(ArrayList<String> reNames, String userId, HttpServletRequest request) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
        
        String root = request.getSession().getServletContext().getRealPath("resources");
        String beforePath = root + "/free_photo_upload/" + userId;
        String afterPath = root + "/free_photo_upload/" + strToday;
        
        File folder = new File(afterPath);
        if (!folder.exists()) {
        	folder.mkdirs();
        }
        
        boolean check = true;
		for (int i = 0; i < reNames.size(); i++) {
			String beforeFileRoot = beforePath + "/" + reNames.get(i);
			String afterFileRoot = afterPath + "/" + reNames.get(i);
			
			File beforeFile = new File(beforeFileRoot);
			if(beforeFile.renameTo(new File(afterFileRoot))) {
				System.out.println(beforeFileRoot + "에서 " + afterFileRoot + "이동 성공!");
			} else {
				System.out.println(beforeFileRoot + "에서 " + afterFileRoot + "이동 실패 ㅠㅠ");
				check = false;
			}
		}
		
		if(check) {
			return afterPath;
		} else {
			return null;
		}
	}
	
	public void deleteUserFolder(String beforePath) {
		File file = new File(beforePath);
        
    	if( file.exists() ){ //파일존재여부확인
    		
    		if(file.isDirectory()){ //파일이 디렉토리인지 확인
    			File[] files = file.listFiles();
    			for( int i=0; i<files.length; i++){
    				if( files[i].delete() ){
    					System.out.println(files[i].getName()+" 삭제성공");
    				}else{
    					System.out.println(files[i].getName()+" 삭제실패");
    				}
    			}
    		}
    		if(file.delete()){
    			System.out.println("폴더삭제 성공");
    		}else{
    			System.out.println("폴더삭제 실패");
    		}
    		
    	}else{
    		System.out.println("파일이 존재하지 않습니다.");
    	}
	}
	
	@RequestMapping("detail.bo")
	public ModelAndView freeDetail(@RequestParam("boNum") int boNum, ModelAndView mv, HttpSession session) {
		Board b = bService.freeDetail(boNum);
		ArrayList<Contents> contentsArr = bService.getContents(boNum);
		
		ArrayList<String> entirDir = new ArrayList<String>();
		for(int i = 0; i < contentsArr.size(); i++) {
			String conUrl = contentsArr.get(i).getConUrl();
			String dir = conUrl.substring(conUrl.length()-8, conUrl.length());
			String entir = dir + "/" + contentsArr.get(i).getConCop();
			entirDir.add(entir);
		}
		
		if(session.getAttribute("loginUser") != null) {
			String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			
			HashMap scraptToggle = new HashMap();
			
			scraptToggle.put("boNum", boNum);
			scraptToggle.put("userId", userId);
			
			String scrapCondition = null;
			
			int checkScrap = bService.checkScrap(scraptToggle);
			if(checkScrap == 1) {
				scrapCondition = "스크랩 해제";
			} else {
				scrapCondition = "게시물 스크랩";
			}
			mv.addObject("scrapCondition", scrapCondition);
		} else {
			mv.addObject("scrapCondition", "게시물 스크랩");
		}
		
		ArrayList<Reply> ReplyArr = bService.getReplyList(boNum);
		ArrayList<Reply> ReplyArr2 = bService.getReplyList2(boNum);
		System.out.println(ReplyArr);
		System.out.println(ReplyArr2);
		
		mv.addObject("b", b);
		mv.addObject("contentsArr", contentsArr);
		mv.addObject("entirDir", entirDir);
		mv.addObject("ReplyArr", ReplyArr);
		mv.addObject("ReplyArr2", ReplyArr2);
		
		mv.setViewName("board/boardDetail");
		
		return mv;
	}
	
	@RequestMapping("addRecommend.bo")
	public void addRecommend(int boNum, String userId, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		HashMap recommendRequest = new HashMap();
		
		recommendRequest.put("boNum", boNum);
		recommendRequest.put("userId", userId);
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
			
			int checkRecommendExist = bService.checkRecommendExist(recommendRequest);
			
			if(checkRecommendExist < 1) {
				int insertRecommend = bService.insertRecommend(recommendRequest);
				int updateBoardRecommend = bService.updateBoardRecommend(boNum);
				if(insertRecommend == 1 && updateBoardRecommend == 1) {
					out.println("success");
				} else {
					out.println("업데이트나 인설트 실패");
				}
			} else {
				out.println("already");
			}
		} catch (IOException e) {
			throw new BoardException(e.getMessage());
		} finally {
			out.flush();
			out.close();
		}
	}
	
	@RequestMapping("scrapToggle.bo")
	public void scraptToggle(int boNum, String userId, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		HashMap scraptToggle = new HashMap();
		
		scraptToggle.put("boNum", boNum);
		scraptToggle.put("userId", userId);
		
		PrintWriter out = null;
		try {
			out  = response.getWriter();
			int checkScrap = bService.checkScrap(scraptToggle);
			
			if(checkScrap < 1) {
				int insertScrap = bService.insertScrap(scraptToggle);
//				System.out.println("insertScrap : " + insertScrap);
				if(insertScrap == 1) {
					out.println("insert");
				} else {
					out.println("인설트 실패");
				}
			} else {
				int deleteScrap = bService.deleteScrap(scraptToggle);
//				System.out.println("deleteScrap : " + deleteScrap);
				if(deleteScrap == 1) {
					out.println("delete");
				} else {
					out.println("삭제 실패");
				}
			}
		} catch (IOException e) {
			throw new BoardException(e.getMessage());
		} finally {
			out.flush();
			out.close();
		}
	}

}


	
