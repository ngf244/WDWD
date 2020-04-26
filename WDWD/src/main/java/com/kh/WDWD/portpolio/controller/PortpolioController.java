package com.kh.WDWD.portpolio.controller;

import java.io.File;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.WDWD.board.model.exception.BoardException;
import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.common.Pagination;
import com.kh.WDWD.member.model.vo.Member;
import com.kh.WDWD.portpolio.model.exception.PortpolioException;
import com.kh.WDWD.portpolio.model.service.PortpolioService;
import com.kh.WDWD.portpolio.model.vo.Portpolio;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;
import com.kh.WDWD.portpolio.model.vo.PortpolioReply;

@Controller
public class PortpolioController {
	
	@Autowired
	private PortpolioService pService;
	
	@RequestMapping("portEnrollView.my")
	public String portEnrollView() {
		return "portpolioEnroll";
	}
	
	@RequestMapping("portThumbEnroll.my")
	public @ResponseBody void EnrollPortpolioThumbnail(MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		MultipartFile uploadFile = request.getFile("pFile");
		String renameFileName = "";
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			renameFileName = saveFile(uploadFile, request, userId);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(renameFileName, response.getWriter());
	}
	
	@RequestMapping("portImgEnroll.my")
	public @ResponseBody void EnrollPortpolioImg(MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		MultipartFile uploadFile = request.getFile("pFile");
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
		
		String savePath = root + "/portpolio_upload/" + userId;
		
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
	
	@RequestMapping("enrollPort.my")
	public String EnrollPortpolio(HttpSession session, @ModelAttribute Portpolio p, 
								  @RequestParam("pocOriginArr") String[] pocOriginArr, 
								  @RequestParam("pocModifyArr") String[] pocModifyArr, 
								  HttpServletRequest request) {
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		p.setPoWriter(userId);
		System.out.println("Portpolio : " + p);
		
		int result = pService.enrollPortpolio(p);
		
		if(result > 0) {
			
			ArrayList<String> pocOrigins = new ArrayList<>(Arrays.asList(pocOriginArr));
			
			for(int i = 0; i < pocOrigins.size(); i++) {
				if(pocOrigins.get(i).equals("")) {
					pocOrigins.remove("");
				}
			}
			// test ----------------
			for(int i = 0; i < pocOrigins.size(); i++) {
				System.out.println(pocOrigins.get(i));
			}
			// -------------------------
			
			ArrayList<String> pocModifys = new ArrayList<>(Arrays.asList(pocModifyArr));
			
			for(int i = 0; i < pocModifys.size(); i++) {
				if(pocModifys.get(i).equals("")) {
					pocModifys.remove("");
				}
			}
			
			String check = FileMove(pocModifys, userId, request);
			if(check != null) {
				System.out.println("파일 이동 완료!");
			} else {
				throw new PortpolioException("파일 이동 실패!");
			}
			
			String root = request.getSession().getServletContext().getRealPath("resources");
	        String beforePath = root + "/portpolio_upload/" + userId;
			
			deleteUserFolder(beforePath); // 임시 유저 아이디 폴더 삭제
			
			ArrayList<PortpolioContents> pcArr = new ArrayList<PortpolioContents>();
			
			if(pocOrigins.size() == pocModifys.size()) {
				for(int i = 0; i < pocModifys.size(); i++) {
					PortpolioContents pc = new PortpolioContents();
					pc.setPocModify(pocModifys.get(i));
					pc.setPocOrigin(pocOrigins.get(i));
					pc.setPocPath(check);
					pc.setPocLevel(i);
					
					pcArr.add(pc);
				}
			} else {
				throw new PortpolioException("리스트의 길이가 맞지 않습니다.");
			}
			
			int PortConResult = pService.insertPortpolioCotents(pcArr);
			
			if(PortConResult >= pocModifys.size()) {
				return "redirect:portpolioList.my?poWriter=" + userId;
			} else {
				throw new BoardException("포트폴리오 콘텐츠 테이블 입력에 실패하였습니다.");
			}
			
		} else {
			throw new PortpolioException("포트폴리오 테이블 입력에 실패하였습니다");
		}
		
	}
	
	public String FileMove(ArrayList<String> pocModifys, String userId, HttpServletRequest request) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance();
        String Today = sdf.format(cal.getTime());
        
        String root = request.getSession().getServletContext().getRealPath("resources");
        String beforePath = root + "/portpolio_upload/" + userId;
        String afterPath = root + "/portpolio_upload/" + Today;
        
        File folder = new File(afterPath);
        if (!folder.exists()) {
        	folder.mkdirs();
        }
        
        boolean check = true;
		for (int i = 0; i < pocModifys.size(); i++) {
			String beforeFileRoot = beforePath + "/" + pocModifys.get(i);
			String afterFileRoot = afterPath + "/" + pocModifys.get(i);
			
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
    			System.out.println("폴더 삭제 성공");
    		}else{
    			System.out.println("폴더 삭제 실패");
    		}
    		
    	}else{
    		System.out.println("파일이 존재하지 않습니다.");
    	}
	}
	
	@RequestMapping("portpolioList.my")
	public ModelAndView portpolioListView(@ModelAttribute Portpolio p, 
										  @RequestParam(value="page", required=false) Integer page, 
										  ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = pService.getPortpolioCount(p);
		PageInfo pi = Pagination.getPortpolioListPageInfo(currentPage, listCount);
		
		ArrayList<PortpolioContents> list = pService.selectPortpolioList(pi, p);
		
		System.out.println("plist" + list);
		
		if(list != null) {
			mv.addObject("list", list)
			  .addObject("pi", pi)
			  .addObject("portpolio", p)
			  .setViewName("portpolioList");
			
		} else {
			throw new PortpolioException("포트폴리오 리스트 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("enrollPoReply.my")
	public void enrollPoReply(@ModelAttribute PortpolioReply pr, HttpServletResponse response) throws Exception {
		System.out.println("pr : " + pr);
		
		int result = pService.enrollPoReply(pr);
		
		if(result > 0) {
			ArrayList<PortpolioReply> prList = pService.selectPoReply(pr);
		
			if(prList != null) {
				response.setCharacterEncoding("UTF-8");
				
				System.out.println("prList : " + prList);
				
				new Gson().toJson(prList, response.getWriter());
			}
		}
		
	}
	
	
	
}
