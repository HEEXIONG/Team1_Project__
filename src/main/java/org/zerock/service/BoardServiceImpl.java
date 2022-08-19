package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
@RequiredArgsConstructor
@ToString
public class BoardServiceImpl implements BoardService {
	
	
	private final BoardMapper mapper;

	@Override
	public void register(BoardVO vo) {
		mapper.insert(vo);	
	}

	@Override
	public List<BoardVO> showlist() {
		
		return mapper.getlist();
	}

}
