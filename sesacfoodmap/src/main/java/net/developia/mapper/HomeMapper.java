package net.developia.mapper;

import java.util.List;

import net.developia.domain.BoardVO;

// 이재혁
public interface HomeMapper {
	public List<BoardVO> getListPopular(int count);
}
