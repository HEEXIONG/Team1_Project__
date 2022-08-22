package org.zerock.mapper;


import java.util.List;

import org.zerock.domain.AttachImageVO;
import org.zerock.domain.BoardVO;


public interface BoardMapper {
	
	void insert(BoardVO vo);
	
	List<BoardVO> getlist(); 

	public BoardVO read(Long pno);
	
	
	
	
	
	//============================================이미지=========================================
	void imageinsert(AttachImageVO vo);
	
	public List<AttachImageVO> getAttachList(long pno);
	
	
	
	
	
	

}
