package net.developia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.developia.domain.Criteria;
import net.developia.domain.ReplyVO;
// 이지윤
public interface ReplyMapper {
	public int delete(@Param("cno") Long cno, @Param("password") String password);
	public int update(ReplyVO reply);
	public int insert(ReplyVO reply);
	public ReplyVO get(Long cno);
	public List<ReplyVO> getListWithPaging (@Param("cri") Criteria cri, @Param("bno") Long bno);
	public int getCountByBno(Long bno);
}