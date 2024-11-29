package net.developia.service;

import java.util.List;

import net.developia.domain.BoardVO;
import net.developia.domain.Criteria;

public interface BoardService {
	public void register(BoardVO board) throws Exception;
	public BoardVO get(Long bno) throws Exception;
	public int modify(BoardVO board) throws Exception;
	public boolean remove(Long bno, String password) throws Exception;
	public boolean checkPassword(Long bno, String password) throws Exception;
	public List<BoardVO> getList(Criteria cri) throws Exception;
	public int getTotal(Criteria cri) throws Exception;
	public int likeUp(Long bno) throws Exception;
}