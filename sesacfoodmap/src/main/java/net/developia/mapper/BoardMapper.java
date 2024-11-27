package net.developia.mapper;

import java.util.List;

import net.developia.domain.BoardVO;
import net.developia.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getList();
	public void insert(BoardVO board);
	public BoardVO get(Long bno);
	public int delete(Long bno);
	public int update(BoardVO board);
	public List<BoardVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	public int likeUp(Long bno); 
}