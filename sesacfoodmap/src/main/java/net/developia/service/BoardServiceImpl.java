package net.developia.service;

import java.io.File;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.developia.domain.BoardVO;
import net.developia.domain.Criteria;
import net.developia.mapper.BoardMapper;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	private BoardMapper mapper;
	
	@Autowired
	private final ServletContext servletContext; // ServletContext 주입
   
	private String getFolder(BoardVO bvo) {
    	
	    String basePath = servletContext.getRealPath("/resources/uploadImg");
	   
    	// 게시글 번호로 폴더 생성
    	String bnoFolder = String.valueOf(bvo.getBno());
        String folderPath = basePath + File.separator + bnoFolder;
        
        // 폴더가 존재하지 않으면 생성
        File folder = new File(folderPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        
        return folderPath;
    }
	
	private void deleteDir(File file) {
	    File[] contents = file.listFiles();
	    if (contents != null) {
	        for (File f : contents) {
	            if (!Files.isSymbolicLink(f.toPath())) {
	                deleteDir(f);
	            }
	        }
	    }
	    file.delete();
	}
    
    // 게시글 등록
    @Override
	public void register(BoardVO board) throws Exception {
		log.info("register....." + board);
		board.setBno(mapper.getNextBno());
		
		// 파일이 선택됐을 때만 업로드
		if(board.getFilename() != "") {
	        String uploadFolder = getFolder(board);
	        log.info("Upload Folder: " + uploadFolder);
	        log.info("-------------------------------------");
	        log.info("Upload File getName: " + board.getFile().getOriginalFilename());
	        log.info("Upload File getSize: " + board.getFile().getSize());
			
			File saveFile = new File(uploadFolder, board.getFile().getOriginalFilename());
			
			try {
				board.getFile().transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
				throw new RuntimeException("File save failed");
			}
		}

		log.info("bno: " + board.getBno());
		mapper.insert(board);
    }
	
	@Override
	public BoardVO get(Long bno) throws Exception {
			log.info("get........" + bno);
			BoardVO board = mapper.get(bno);
			if (board == null)
				throw new RuntimeException(bno + "번 게시물이 존재하지 않음");
			return board;
	}

	@Override
	public int modify(BoardVO board) throws Exception {
			log.info("modify........."+board);
			return mapper.update(board);
	}

	@Override
	public boolean remove(Long bno, String password) throws Exception {
			log.info("remove........"+bno);
		    
			if (mapper.delete(bno, password) == 0) {
				return false;
			}
			else {
				// 게시글 삭제에 성공하면 게시글의 이미지 파일도 삭제
			    String basePath = servletContext.getRealPath("/resources/uploadImg");
				String folderPath = basePath + File.separator + String.valueOf(bno);
				File pathToRemove = new File(folderPath);
				deleteDir(pathToRemove);
				
				return true;
			}
	}
	

	public boolean checkPassword(Long bno, String password) throws Exception {
		log.info("checkPassword........"+bno);

		return mapper.checkPassword(bno, password) == 1 ? true : false;
	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) throws Exception {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) throws Exception {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public int likeUp(Long bno) throws Exception {
		log.info("like up");
		return mapper.likeUp(bno);
	}
}
