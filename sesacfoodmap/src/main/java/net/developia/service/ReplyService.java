package net.developia.service;

import java.util.List;

import net.developia.domain.Criteria;
import net.developia.domain.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);
	public ReplyVO get(Long cno);
	public int modify(ReplyVO vo);
	public int remove(Long cno);
	public List<ReplyVO> getList(Criteria cri, Long bno);
}
