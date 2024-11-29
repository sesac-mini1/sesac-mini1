package net.developia.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
// 이지윤
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
	private MultipartFile file;
	private int stars;
	private int recommend;
	private int comments;
	private String rname;
}
