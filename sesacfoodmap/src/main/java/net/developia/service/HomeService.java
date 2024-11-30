package net.developia.service;

import java.util.List;

import net.developia.domain.BoardVO;

// 이재혁
public interface HomeService {
	public List<BoardVO> getListPopular(int count);
}
