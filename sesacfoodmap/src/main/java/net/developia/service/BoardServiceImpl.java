package net.developia.service;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.developia.domain.BoardVO;
import net.developia.mapper.BoardMapper;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) throws Exception {
			log.info("register....." + board);
			mapper.insert(board);
	}

	@Override
	public BoardVO get(Long bno) throws Exception {
			log.info("get........" + bno);
			BoardVO board = mapper.get(bno);
			if (board == null ) 
				throw new RuntimeException(bno + "�� �Խù��� ����");
			return board;
	}

	@Override
	public boolean modify(BoardVO board) throws Exception {
			log.info("modify........."+board);
			if (mapper.update(board) == 0) 
				throw new RuntimeException(board.getBno() + "�� �Խù��� �������� ����"); 
			return true;
	}

	@Override
	public boolean remove(Long bno) throws Exception {
			log.info("remove........"+bno);
			if (mapper.delete(bno) == 0) 
				throw new RuntimeException(bno + "�� �Խù��� �������� ����"); 
			return true;
	}
	
	/*
	@Override
	public List<BoardVO> getList() throws Exception {
			return mapper.getList();
	}*/
	
//	@Override
//	public List<BoardVO> getList(Criteria cri) throws Exception {
//		log.info("get List with criteria: " + cri);
//		return mapper.getListWithPaging(cri);
//	}
//
//	@Override
//	public int getTotal(Criteria cri) throws Exception {
//		log.info("get total count");
//		return mapper.getTotalCount(cri);
//	}
}