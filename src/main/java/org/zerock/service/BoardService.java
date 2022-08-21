package org.zerock.service;


import java.util.List;

import org.zerock.domain.AttachImageVO;
import org.zerock.domain.BoardVO;


public interface BoardService {
	
	 void register(BoardVO vo);
	 
	 List<BoardVO> showlist();
	 
	 
	 List<AttachImageVO> getAttachList(Long pno);

}
