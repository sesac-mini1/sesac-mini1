package net.developia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.developia.domain.BoardVO;
import net.developia.mapper.HomeMapper;

@Service
@Log4j
@AllArgsConstructor
public class HomeServiceImpl implements HomeService {
	private HomeMapper mapper;

	@Override
	public List<BoardVO> getListPopular(int count) {
		log.info("get popular " + count);
		return mapper.getListPopular(count);
	}
	
}
