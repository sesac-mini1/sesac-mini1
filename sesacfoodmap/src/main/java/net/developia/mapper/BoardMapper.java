package net.developia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.developia.domain.BoardVO;
import net.developia.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getList();
	public Long getNextBno();
	public void insert(BoardVO board);
	public BoardVO get(Long bno);
	public int delete(@Param("bno") Long bno, @Param("password") String password);
	public int update(BoardVO board);
	public List<BoardVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	public int likeUp(Long bno);
    public int getStars(Long bno); // 별점 가져오기
	public void updateStars(Long bno, int stars);
}