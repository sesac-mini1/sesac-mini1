package net.developia.domain;

import java.util.Date;

import lombok.Data;
//이지윤
@Data
public class ReplyVO {
	private Long cno;
	private Long bno;
	private String content;
	private String writer;
	private String password;
	private Date regDate;
}
