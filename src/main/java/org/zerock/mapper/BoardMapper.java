package org.zerock.mapper;


import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardMapper {
	
	void insert(BoardVO vo);
	
	void update(BoardVO vo);
	
	List<BoardVO> getlist(); 

}
