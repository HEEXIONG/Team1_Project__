package org.zerock.service;


import java.util.List;

import org.zerock.domain.BoardVO;


public interface BoardService {
	
	 void register(BoardVO vo);
	 
	 List<BoardVO> showlist();

}
