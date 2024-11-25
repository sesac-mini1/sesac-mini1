package net.developia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("board/*")
public class BoardController {
	
	@GetMapping("list") 
	public void list() {
		log.info("list");
	}
	@GetMapping("/get")
	public void get() {}
}
