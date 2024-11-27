package net.developia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.developia.domain.BoardVO;
import net.developia.domain.Criteria;
import net.developia.domain.PageDTO;
import net.developia.service.BoardService;

@Controller
@Log4j
@RequestMapping("board/*")
@AllArgsConstructor
public class BoardController {
	
	@Autowired
	private BoardService service;

	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, Model model) {
		try {
			log.info("/get");
			model.addAttribute("board", service.get(bno));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	@GetMapping("list")
//	public void list() {
//		log.info("list");
//	}

	@GetMapping("/list")

	public void list(Criteria cri, Model model) throws Exception {
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,123));
	}



	@GetMapping("/modify")
	public void modify() {

	}

	@GetMapping("/write")
	public void write() {

	}
	
	@PostMapping("/write")
	public String register(BoardVO board, MultipartFile fileName, RedirectAttributes rttr) {
		try {
			log.info("register:" + board);
			service.register(board);
			rttr.addFlashAttribute("result", "게시글이 성공적으로 등록되었습니다. :" + board.getBno() + ")");
			return "redirect:/board/list";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}