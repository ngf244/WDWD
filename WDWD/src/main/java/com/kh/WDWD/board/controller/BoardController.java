package com.kh.WDWD.board.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
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
	@RequestMapping("detail.bo")
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
		
		System.out.println(renameFileName);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(renameFileName, response.getWriter());
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request, String userId) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 웹 서버 contextPath를 불러와서 폴더의 경로 받아옴 (webapp 하위의 resources에 도달)
		
		String savePath = root + "/photo_upload/" + userId;
		
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
	public void boardWriting(HttpSession session, @RequestParam("freeBoardCategory") String category, @RequestParam("freeBoardTitle") String title,
								@RequestParam("fileRename") String[] reNames, @RequestParam("fileOriginName") String[] originNames,
								@RequestParam("writingContent") String wrtingConent, HttpServletRequest request) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		Board b = new Board();
		
		b.setBoCategory(category);
		b.setBoTitle(title);
		b.setBoWriter(userId);
		b.setBoGroup("1");
		b.setBoContent(wrtingConent);
		
		boolean check = FileMove(reNames, userId, request);
		
		
	}
	
	
	
	public boolean FileMove(String[] reNames, String userId, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 웹 서버 contextPath를 불러와서 폴더의 경로 받아옴 (webapp 하위의 resources에 도달)
		String path = root + "/photo_upload/" + userId;
		
		File targetFolder = new File(path);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

        Calendar c1 = Calendar.getInstance();

        String strToday = sdf.format(c1.getTime());

        System.out.println("Today=" + strToday);

		
		String folderName = "new";//폴더 생성할 이름
		String fileName = "가수이미지11.jpg"; //바뀔 이름
		String beforeFilePath = "C:/tmp/upload/2015/06/25/앨범속지1.jpg"; //옮길 대상 경로
		String afterFilePath = "C:/tmp/upload/"; //옮겨질 경로
		
		String result = moveFile(folderName, fileName, beforeFilePath, afterFilePath);
		if(result!=null){
			System.out.println("SUCCESS: "+result);
		}else{
			System.out.println("FAIL");
		}
		
		return true;
	}

	public String moveFile(String folderName, String fileName, String beforeFilePath, String afterFilePath) {

		String path = afterFilePath+"/"+folderName;
		String filePath = path+"/"+fileName;

		File dir = new File(path);

		if (!dir.exists()) { //폴더 없으면 폴더 생성
			dir.mkdirs();
		}

		try{

			File file =new File(beforeFilePath);

			if(file.renameTo(new File(filePath))){ //파일 이동
				return filePath; //성공시 성공 파일 경로 return
			}else{
				return null;
			}

		}catch(Exception e){
			e.printStackTrace();
			return null;
		}

	}

}
	

	
