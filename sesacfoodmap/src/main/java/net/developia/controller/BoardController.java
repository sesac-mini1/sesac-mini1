package net.developia.controller;

import java.io.File;
import java.nio.file.Files;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	@Autowired
	private BoardService service;

	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		try {
			log.info("/get");
			model.addAttribute("board", service.get(bno));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/list")
	public void list(Criteria cri, Model model) throws Exception {
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri,123));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}


	@GetMapping("/write")
	public void write() {

	}
	
	@PostMapping("/write")
	public String register(BoardVO board, MultipartFile upfile, RedirectAttributes rttr) {
		try {
			log.info("register:" + board);
			
			// 파일이 업로드 될 때만 실행
			board.setFilename(board.getFile().getOriginalFilename());
			if(board.getFilename() != "") {
				File f = new File(board.getFilename());
				String mimetype = Files.probeContentType(f.toPath());

				if (mimetype == null || !(mimetype.split("/")[0].equals("image"))) {
					log.info("it is not an image!");
					return "redirect:/board/list";
				}
				log.info(board.getFilename());
			}

			service.register(board);
			rttr.addFlashAttribute("result", board.getBno());
			return "redirect:/board/list";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @RequestParam("password") String password,
			RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		log.info("remove... " + bno + password);
		if(service.remove(bno, password)) {
			rttr.addFlashAttribute("result", "remove");
			return "redirect:/board/list";
		} else {
			rttr.addFlashAttribute("result", "fail");
			String referer = request.getHeader("Referer");
			String redirectUrl;
	        if (referer != null) {
	            if (referer.contains("/board/get")) {
	                redirectUrl = "/board/get?bno="+bno;
	            } else if (referer.contains("/board/modify")) {
	                redirectUrl = "/board/modify";
	            } else {
	                redirectUrl = "/board/list";
	            }
	        } else {
	            redirectUrl = "/"; // Referer가 없을 경우 기본 경로
	        }
	        return "redirect:" + redirectUrl;
		}
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) throws Exception {
		log.info("컨트롤ㄹ러 !!!!!! ");
		log.info("컨트롤ㄹ러 !!!!!! ");
		log.info("modify: " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}

	@PostMapping(value = "/likeup", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> likeUp(@RequestBody Long bno) {
	log.info("likeup: " + bno);
	int result;
	try {
		result = service.likeUp(bno);
	} catch (Exception e) {
		e.printStackTrace();
		result = -1;
	}
    return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}