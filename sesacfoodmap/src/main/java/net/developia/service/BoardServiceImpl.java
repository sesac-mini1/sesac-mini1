package net.developia.service;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	   private static final String BASE_UPLOAD_PATH = "C:\\dev\\sesac-mini1\\sesacfoodmap\\src\\main\\webapp\\resources\\uploadimg";

	    private String getFolder(BoardVO bvo) {
	    	
	    	//게시글 저장 및 BNO 반환
//	    	mapper.insertSelectKey(board);
//	        Long bno = board.getBno();
//	        log.info("Generated BNO: " + bno);
	    	
	    	
	    	// 게시글 번호로 폴더 생성
	    	String bnoFolder = String.valueOf(bvo.getBno());
	        String folderPath = BASE_UPLOAD_PATH + File.separator + bnoFolder;
	        
	        // 폴더가 존재하지 않으면 생성
	        File folder = new File(folderPath);
	        if (!folder.exists()) {
	            folder.mkdirs();
	        }
	        
	        return folderPath;
	    }
	    
		   
		    // 게시글 등록
		    @Override
			public void register(BoardVO board) throws Exception {
				log.info("register....." + board);
				board.setBno(mapper.getNextBno());
			
			// 게시글 번호 기반 폴더 생성
	        String savefile = getFolder(board);
			
			
			String uploadFolder = "C:\\dev\\sesac-mini1\\sesacfoodmap\\src\\main\\webapp\\resources\\uploadimg\\"  + board.getBno();
			System.out.println("------------------------"+uploadFolder+"----------------------");
			System.out.println("-------------------------------------");
			System.out.println("Upload File getName: " + board.getFile().getOriginalFilename());
			System.out.println("Upload File getSize: " + board.getFile().getSize());
			
			File saveFile = new File(uploadFolder, board.getFile().getOriginalFilename());
			
			 try {
                board.getFile().transferTo(saveFile);
     
	         } catch (Exception e) {
	            log.error(e.getMessage());
	            throw new RuntimeException("File save failed");
	         }
				
			log.info(board.getBno());
			log.info("==========================================");
		mapper.insert(board);
				
	}
		    
	
	@Override
	public BoardVO get(Long bno) throws Exception {
			log.info("get........" + bno);
			BoardVO board = mapper.get(bno);
			if (board == null )
				throw new RuntimeException(bno + "번 게시물이 존재하지 않음");
			return board;
	}

	@Override
	public boolean modify(BoardVO board) throws Exception {
			log.info("modify........."+board);
			if (mapper.update(board) == 0)
				throw new RuntimeException(board.getBno() + "번 게시물이 수정되지 않음");
			return true;
	}

	@Override
	public boolean remove(Long bno) throws Exception {
			log.info("remove........"+bno);
			if (mapper.delete(bno) == 0)
				throw new RuntimeException(bno + "번 게시물이 삭제되지 않음");
			return true;
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
