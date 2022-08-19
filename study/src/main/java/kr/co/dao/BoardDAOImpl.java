package kr.co.dao;

import java.util.List;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import kr.co.vo.*;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	// 게시물 작성
	@Override
	public void write(BoardVO bVO) throws Exception {
		sqlSession.insert("bMap.insert",bVO);
	}
	
	// 게시물 목록
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception{
		return sqlSession.selectList("bMap.listPage", scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("bMap.listCount", scri);
	}
	
	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("bMap.read", bno);
	}

	// 게시물 수정
	@Override
	public void update(BoardVO bVO) throws Exception{
		sqlSession.update("bMap.update", bVO);
	}
	
	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("bMap.delete", bno);
	}
}
