package org.zerock.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	private final BoardService service;
	
	@GetMapping("/register")
	public void registerget() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		service.register(vo);
		log.info("board 등록 : "+vo);
		return "redirect:/board/list";
	}
	@GetMapping("/list")
	public void showlist(Model model) {
		service.showlist();
		model.addAttribute("list",service.showlist());
		log.info("리스트");	
	}
	@PostMapping("/uploadAjaxAction")
	//파일여러개업로드시
	/*
	 * public void uploadAjaxActionPOST(MultipartFile[] uploadFile){
	 * for(MultipartFile multipartFile : uploadFile) { log.info("파일 이름 : " +
	 * uploadFile.getOriginalFilename()); log.info("파일 타입 : " +
	 * uploadFile.getContentType()); log.info("파일 크기 : " + uploadFile.getSize()); }
	 * }
	 */
	
	public void uploadAjaxActionPost(MultipartFile uploadFile) {
		log.info("uploadAjaxActionPost 실행");
		String uploadFolder = "C:\\upload";
		
		// SimpleDateForamt은 Date 클래스를 통해 얻은 오늘의 날짜를 지정된 형식의 문자열 데이터로 생성하기 위해서 사용
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//Date 클래스를 오늘의 날짜를 얻기 위해서 사용
		Date date = new Date();
		//
		String str = sdf.format(date);
		
		// '-'을 경로 구분자인 '/'(리눅스) 혹은 '\'(윈도)로 변경
		String datePath = str.replace("-", File.separator);
		
		//폴더 생성
		File uploadPath = new File(uploadFolder, datePath);
		//폴더가 이미 존재하는 상황에도 사용자가 업로드를 할 때마다 폴더를 생성하는 코드가 무조건 실행을 막기위해
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

	}
	
}
