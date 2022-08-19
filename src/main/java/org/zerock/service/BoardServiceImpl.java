package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service // 계층 구조상 주로 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용함.
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	
	private BoardMapper mapper;

	@Override
	public void register(BoardVO vo) {
		mapper.insert(vo);	
	}
	
	@Override
	public BoardVO get(Long pno) {
		return mapper.read(pno);
	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList with criteria : 페이징 기능 추가!" + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count : 전체 개수 카운트!");
		return mapper.getTotalCount(cri);
	}
	

}
