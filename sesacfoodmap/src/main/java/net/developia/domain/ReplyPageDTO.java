package net.developia.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
//이지윤
@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {
	private int replyCnt;
	private List<ReplyVO> list;
}
