package org.zerock.mapper;


import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
	public void insert(BoardVO vo);
	
	public void update(BoardVO vo);
	
	public List<BoardVO> getList(); 
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public BoardVO read(Long pno);
	
	public int getTotalCount(Criteria cri);	

}
