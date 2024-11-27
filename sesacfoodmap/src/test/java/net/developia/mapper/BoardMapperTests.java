package net.developia.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;
import net.developia.domain.Criteria;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:**/*-context.xml")
@Log4j
public class BoardMapperTests {
	@Autowired
	private BoardMapper mapper;

//	@Test
//	public void testGet() {
//		//존재하는 게시물 번호로 테스트
//		BoardVO board = mapper.get(1L);
//		log.info(board);
//	}
//

//	@Test
//	public void testGetList() throws Exception {
//		List<BoardVO> boardList = mapper.getList();
//		log.info(boardList);
//		
//		service.getList(new Criteria(2,10)).forEach(board -> log.info(board));
//		
//		log.info(mockMvc.perform(
//				MockMvcRequestBuilders.get("/board/list")
//				.param("pageNum", "2")
//				.param("amount", "50")
//				)
//				.andReturn().getModelAndView().getModelMap());
//
//	}

	@Test
	public void testGetListWithPaging() throws Exception {
		mapper.getListWithPaging(new Criteria(2, 50)).forEach(board -> log.info(board));
	}

	
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		cri.setPageNum(1);
//		cri.setPageNum(10);
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(4L));
	}
	

//	@Test
//	public void testRemove() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
//				.param("bno", "10")
//				).andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}

	@Test
	public void testLikeUp() {
		log.info(mapper.likeUp(1L));
	}

	
}
