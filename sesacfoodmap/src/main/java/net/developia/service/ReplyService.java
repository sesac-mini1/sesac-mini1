package net.developia.service;

import java.util.List;

import net.developia.domain.Criteria;
import net.developia.domain.ReplyPageDTO;
import net.developia.domain.ReplyVO;
// 이지윤
public interface ReplyService {
	public int register(ReplyVO vo);
	public ReplyVO get(Long cno);
	public int modify(ReplyVO vo);
	public int remove(Long cno, String password);
	public List<ReplyVO> getList(Criteria cri, Long bno);
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
}
