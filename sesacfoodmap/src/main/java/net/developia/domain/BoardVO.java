package net.developia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String password;
	private Date regDate;
	private boolean ticket;
	private String type;
	private String filename;
	private int stars;
	private int recommend;
	private int comments;
	private String rname;
}
