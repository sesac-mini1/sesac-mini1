package net.developia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.developia.service.BoardService;

@Controller
@Log4j
@RequestMapping("board/*")
@AllArgsConstructor
public class BoardController {
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
	public String list(Model model) {

		try {
			log.info("list: ");
			model.addAttribute("list", service.getList());
//			model.addAttribute("pageMaker", new PageDTO(cri, 123));

			//int total = service.getTotal();

			//log.info("total: " + total);

			//model.addAttribute("pageMaker", new PageDTO(cri, total));

			return "board/list";

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}



	@GetMapping("/modify")
	public void modify() {

	}

	@GetMapping("/write")
	public void write() {

	}
}