package net.developia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.developia.domain.Criteria;
import net.developia.domain.ReplyVO;

public interface ReplyMapper {
	public String getPassword(Long cno);
	public int delete(Long cno);
	public int update(ReplyVO reply);
	public int insert(ReplyVO reply);
	public ReplyVO get(Long cno);
	public List<ReplyVO> getListWithPaging (@Param("cri") Criteria cri, @Param("bno") Long bno);
}