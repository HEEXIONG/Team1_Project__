package org.zerock.controller;

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
		log.info("파일 이름 : " + uploadFile.getOriginalFilename());
		log.info("파일 타입 : " + uploadFile.getContentType());
		log.info("파일 크기 : " + uploadFile.getSize());
	}
	
}
