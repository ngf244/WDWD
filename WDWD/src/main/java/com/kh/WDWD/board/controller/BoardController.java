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
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.WDWD.board.model.exception.BoardException;
import com.kh.WDWD.board.model.service.BoardService;
import com.kh.WDWD.board.model.vo.Board;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.board.model.vo.Reply;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.contents.model.vo.Contents;
import com.kh.WDWD.member.model.service.MemberService;
import com.kh.WDWD.member.model.vo.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@Autowired
	private MemberService mService;
	
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
	public void multipartUpload(MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception { 
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
								@RequestParam(value = "fileRename", required = false) String[] reNamesArr, 
								@RequestParam(value = "fileOriginName", required = false) String[] originNamesArr,
								@RequestParam("writingContent") String wrtingConent, HttpServletRequest request) {
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<String> reNames = new ArrayList<String>();
		ArrayList<String> originNames = new ArrayList<String>();
		
		if(reNamesArr != null) {
			reNames = new ArrayList<>(Arrays.asList(reNamesArr));
			while(reNames.remove(""));
		}
		if(originNamesArr != null) {
			originNames = new ArrayList<>(Arrays.asList(originNamesArr));
			while(originNames.remove(""));
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
			System.out.println("insertboardContentArr : " + ContentArr);
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
		if(b == null) {
			throw new BoardException("지워지거나 없는 게시글입니다");
		}
		
		ArrayList<Contents> contentsArr = bService.getContents(boNum);
		
		ArrayList<String> entirDir = new ArrayList<String>();
		for(int i = 0; i < contentsArr.size(); i++) {
			String conUrl = contentsArr.get(i).getConUrl();
			String dir = conUrl.substring(conUrl.length()-8, conUrl.length());
			String entir = dir + "/" + contentsArr.get(i).getConCop();
			entirDir.add(entir);
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		if(m != null) {
			if(boNum != m.getRecent1()) {
				if(boNum != m.getRecent2()) {
					if(boNum == m.getRecent3()) {
						m.setRecent3(m.getRecent2());
					} else if(boNum == m.getRecent4()) {
						m.setRecent4(m.getRecent3());
						m.setRecent3(m.getRecent2());
					} else {
						m.setRecent5(m.getRecent4());
						m.setRecent4(m.getRecent3());
						m.setRecent3(m.getRecent2());
					}
				}
				m.setRecent2(m.getRecent1());
				m.setRecent1(boNum);
			}
			
			mService.recentlyBoard(m); // 최근 글 보기 멤버 업데이트
			
			String userId = m.getUserId();
			
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
		
		ArrayList<Contents> ReplyContents = bService.getReplyContents(ReplyArr);
		ArrayList<Contents> Reply2Contents = bService.getReply2Contents(ReplyArr2);
		
		
		while (ReplyContents.remove(null));
		
		while (Reply2Contents.remove(null));
		
		
		for(int i = 0; i < ReplyContents.size(); i++) {
			String conUrl = ReplyContents.get(i).getConUrl();
			String dir = conUrl.substring(conUrl.length()-8, conUrl.length());
			String entir = dir + "/" + ReplyContents.get(i).getConCop();
			ReplyContents.get(i).setConUrl(entir);
		}
		
		for(int i = 0; i < Reply2Contents.size(); i++) {
			String conUrl = Reply2Contents.get(i).getConUrl();
			String dir = conUrl.substring(conUrl.length()-8, conUrl.length());
			String entir = dir + "/" + Reply2Contents.get(i).getConCop();
			Reply2Contents.get(i).setConUrl(entir);
		}
		
		int plusViewCount = bService.plusViewCount(boNum);
		
		if(plusViewCount < 1) {
			throw new BoardException("조회수 증가에 실패했슴..");
		}
		
		mv.addObject("b", b);
		mv.addObject("contentsArr", contentsArr);
		mv.addObject("entirDir", entirDir);
		mv.addObject("ReplyArr", ReplyArr);
		mv.addObject("ReplyArr2", ReplyArr2);
		mv.addObject("ReplyContents", ReplyContents);
		mv.addObject("Reply2Contents", Reply2Contents);
		
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
				if(insertScrap == 1) {
					out.println("insert");
				} else {
					out.println("인설트 실패");
				}
			} else {
				int deleteScrap = bService.deleteScrap(scraptToggle);
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
	
	@RequestMapping(value = "insertReply.bo", method = RequestMethod.POST)
	public void insertReply(MultipartHttpServletRequest request,
		      					String userId, String replyContent, int boNum, int rprp, HttpServletResponse response) {
		MultipartFile uploadFile = request.getFile("file");
		HashMap<String, String> map = new HashMap<String, String>();
		
		int result = 0;
		int result2 = 0;
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			map = saveReplyFile(uploadFile, request);
			Contents c = new Contents();
			c.setConOri(map.get("originFileName"));
			c.setConCop(map.get("renameFileName"));
			c.setConUrl(map.get("savePath"));
			
			result = bService.insertOneContent(c);
			
			if(result < 1) {
				throw new BoardException("댓글 이미지 넣기 실패");
			}
		}
		
		Reply r = new Reply();
		r.setRpContent(replyContent);
		r.setRefNum(boNum);
		r.setRpWriter(userId);
		r.setRpConNum(result);
		r.setRpRp(rprp);
		
		result2 = bService.insertReply(r);
		
		int plusReplyCount = bService.plusReplyCount(boNum);
		
		if(plusReplyCount < 1) {
			throw new BoardException("댓글 갯수 업데이트 실패..");
		}
		
		if(result2 < 1) {
			throw new BoardException("댓글 넣기 실패");
		} else {
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().println("성공");
				
				response.getWriter().flush();
				response.getWriter().close();;
			} catch (IOException e) {
				throw new BoardException("여기까지와서 댓글 입력 아작스가 실패라고??\n" + e.getMessage());
			}
		}
	}
	
	public HashMap<String, String> saveReplyFile(MultipartFile file, HttpServletRequest request) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "/free_photo_upload/" + strToday;
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat SDF = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName 
			= SDF.format(new Date(System.currentTimeMillis())) 
			+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("savePath", savePath);
		map.put("renameFileName",renameFileName);
		map.put("originFileName", originFileName);
		
		return map;
	}
	
	@RequestMapping("deleteReply.bo")
	public void deleteReply(@RequestParam int reNum, @RequestParam String conCop, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		int result = bService.deleteReply(reNum);
		int result2 = 0;
		if(!conCop.equals("")) {
			result2 = bService.deleteContent(conCop);
		}
		
		if(result2 > 0) {
			// 파일 지울지 말지 고민중.. 지우려면 conCop 가져가서 객체 가져온 다음 파일 경로 넣고 삭제해주면 됨.
			// 근데 나중에 지운거 리스트 정리해줄때 같이 지워주는 메소드 만들어서 관리하는게 나을듯;
			
//			File file = new File("C:/123.txt");
//			if( file.exists() ){ 
//				if(file.delete()){ 
//					System.out.println("파일삭제 성공"); 
//				}else{
//					System.out.println("파일삭제 실패"); 
//				}
//			}else{ 
//				System.out.println("파일이 존재하지 않습니다."); 
//			}
		}
		
		if(result > 0) {
			try {
				response.getWriter().println("성공");
			} catch (IOException e) {
				throw new BoardException("여기까지와서 실패라니?");
			}
		} else {
			throw new BoardException("아작스 실패");
		}
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(@RequestParam int boNum) {
		int result = bService.deleteBoard(boNum);
		int result2 = bService.deleteContents(boNum);
		
		if(result2 > 0) {
			// 파일 지울지 말지 고민중.. 지우려면 boNum 가져가서 객체배열 가져온 다음 파일 경로 넣고 삭제해주면 됨.
			// 근데 나중에 지운거 리스트 정리해줄때 같이 지워주는 메소드 만들어서 관리하는게 나을듯;
			
//			File file = new File("C:/123.txt");
//			if( file.exists() ){ 
//				if(file.delete()){ 
//					System.out.println("파일삭제 성공"); 
//				}else{
//					System.out.println("파일삭제 실패"); 
//				}
//			}else{ 
//				System.out.println("파일이 존재하지 않습니다."); 
//			}
		}
		if(result > 0) {
			return "redirect:actionList.ch";
		} else {
			throw new BoardException("게시글 삭제 망함 ㅎㅎ");
		}
	}
	
	@RequestMapping("revise.bo")
	public ModelAndView reviseBoard(@RequestParam int boNum, HttpSession session, HttpServletRequest request, ModelAndView mv) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		Board b = bService.freeDetail(boNum);
		ArrayList<Contents> contentsArr = bService.getContents(boNum);
		
		ArrayList<String> entirDir = new ArrayList<String>();
		for(int i = 0; i < contentsArr.size(); i++) {
			String conUrl = contentsArr.get(i).getConUrl();
			String dir = conUrl.substring(conUrl.length()-8, conUrl.length());
			String entir = dir + "/" + contentsArr.get(i).getConCop();
			entirDir.add(entir);
		}
		
		mv.addObject("b", b);
		mv.addObject("contentsArr", contentsArr);
		mv.addObject("entirDir", entirDir);
		mv.setViewName("board/boardrevis");
		
		return mv;
	}
	@RequestMapping("freeRevis.bo")
	public String freeRevis(HttpSession session, @RequestParam("freeBoardCategory") String category, @RequestParam("freeBoardTitle") String title,
								@RequestParam(value = "fileRename", required = false) String[] reNamesArr,
								@RequestParam(value = "fileOriginName", required = false) String[] originNamesArr,
								@RequestParam String writingContent, HttpServletRequest request,
								@RequestParam int boNum, RedirectAttributes redirect) {
		//RedirectAttributes : addAttribute로 parameter를 담고, return "redirect:detail.bo" 와 같이 URL을 입력하여 파라미터와 함께 넘길 수 있음
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<String> reNames = new ArrayList<String>();
		ArrayList<String> originNames = new ArrayList<String>();
		
		if(reNamesArr != null) {
			reNames = new ArrayList<>(Arrays.asList(reNamesArr));
			while(reNames.remove(""));
		}
		if(originNamesArr != null) {
			originNames = new ArrayList<>(Arrays.asList(originNamesArr));
			while(originNames.remove(""));
		}
		
		ArrayList<Contents> contentsArr = bService.getContents(boNum);
		
		String path = FileMoveReverse(contentsArr, userId, request);
		
		if(path == null) {
			throw new BoardException("FileMoveReverse 실패");
		}
		
		int deleteBoardContents = bService.deleteBoardContents(boNum); //해당 Board에 연결된 Contents 데이터 전부 삭제
		
		String check = FileMove(reNames, userId, request);
		if(check != null) {
			System.out.println("파일 이동 에러없이 완료! ");
		} else {
			throw new BoardException("아왜 파일이동 망했는데;;");
		}
		
		String root = request.getSession().getServletContext().getRealPath("resources");
        String beforePath = root + "/free_photo_upload/" + userId;
		
		deleteUserFolder(beforePath); // 임시 유저 아이디 폴더 삭제
		// -------------- 여기까지 작동 확인
		
		ArrayList<Contents> ContentArr = new ArrayList<Contents>();
		if(originNames.size() == reNames.size()) {
			for(int i = 0; i < reNames.size(); i++) {
				Contents content = new Contents();
				content.setConCop(reNames.get(i));
				content.setConOri(originNames.get(i));
				content.setConUrl(check);
				content.setConRef(boNum);
				
				ContentArr.add(content);
			}
		} else {
			throw new BoardException("젠장 리스트 길이가 다르다..");
		}
		
		// 게시판 데이터부터 DB입력
		Board b = new Board();
		
		b.setBoNum(boNum);
		b.setBoCategory(category);
		b.setBoTitle(title);
		b.setBoWriter(userId);
		b.setBoGroup("1");
		b.setBoContent(writingContent);
		
		int result = bService.boardUpdate(b);
		
		if(result>0) {
			int result2 = bService.insertContents(ContentArr); //Board와 관련된 Contents새삥으로 입력
			
			if(result2 >= reNames.size()) {
				redirect.addAttribute("boNum", boNum);
				return "redirect:detail.bo";
			} else {
				throw new BoardException("콘텐츠 테이블 입력에 실패하였습니다.");
			}
			
		} else {
			throw new BoardException("게시판 테이블 입력에 실패하였습니다");
		}
		
		
	}
	
	public String FileMoveReverse(ArrayList<Contents> contentsArr, String userId, HttpServletRequest request) {

        String root = request.getSession().getServletContext().getRealPath("resources");
        String afterPath = root + "/free_photo_upload/" + userId;
        
        File folder = new File(afterPath);
        if (!folder.exists()) {
        	folder.mkdirs();
        }
        
        boolean check = true;
        
		for (int i = 0; i < contentsArr.size(); i++) {
			String beforeFileRoot = contentsArr.get(i).getConUrl() + "/" + contentsArr.get(i).getConCop();
			String afterFileRoot = afterPath + "/" + contentsArr.get(i).getConCop();
			
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

}


	
