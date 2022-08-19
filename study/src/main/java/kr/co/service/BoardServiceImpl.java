package kr.co.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;

import kr.co.dao.*;
import kr.co.vo.*;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	// 게시판 글 작성
	@Override
	public void write(BoardVO bVO) throws Exception {
		dao.write(bVO);
	}
	
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}
	
	// 게시물 수정
	@Override
	public void update(BoardVO bVO) throws Exception {
		dao.update(bVO);
	}
	
	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}
}
