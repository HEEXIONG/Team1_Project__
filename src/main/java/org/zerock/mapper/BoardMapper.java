package org.zerock.mapper;


import java.util.List;

import org.zerock.domain.AttachImageVO;
import org.zerock.domain.BoardVO;

public interface BoardMapper {
	
	void insert(BoardVO vo);
	
	
	
	List<BoardVO> getlist(); 
	
	
	
	

	void imageinsert(AttachImageVO vo);
	
	List<AttachImageVO> getAttachList(Long pno);
	
	

}
