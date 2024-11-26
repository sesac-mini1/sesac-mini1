package net.developia.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import lombok.extern.log4j.Log4j;
import net.developia.domain.BoardVO;
import net.developia.domain.Criteria;
import net.developia.service.BoardService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:**/*-context.xml")
@Log4j
public class BoardMapperTests {
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
    private BoardService service;
	
	@Autowired
    private MockMvc mockMvc;

//	@Test
//	public void testGet() {
//		//존재하는 게시물 번호로 테스트
//		BoardVO board = mapper.get(1L);
//		log.info(board);
//	}ㅁ
//
	@Test
	public void testGetList() throws Exception {
//		List<BoardVO> boardList = mapper.getList();
//		log.info(boardList);
//		
//		service.getList(new Criteria(2,10)).forEach(board -> log.info(board));
		
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/board/list")
				.param("pageNum", "2")
				.param("amount", "50")
				)
				.andReturn().getModelAndView().getModelMap());

	}
	
	@Test
	public void testPaging() {
//		Criteria cri = new Criteria();
//		cri.setPageNum(1);
//		cri.setPageNum(10);
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
		
	}
	
}
