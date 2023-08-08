package com.hadine.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

//Inject 사용해보기
@Repository("boardDAO")
public class BoardDAO {
	
	@Inject
	@Named("sqlSession")
	private SqlSession sqlSession;
	
	
	public List<BoardDTO> boardList(PageDTO page) {
		return sqlSession.selectList("board.boardList", page);
	}

	public BoardDTO detail(BoardDTO dto2) {
		return sqlSession.selectOne("board.detail", dto2); //뒤에 bno String 타입, 
	}

	public void write(BoardDTO dto) {
		sqlSession.insert("board.write", dto); //네임스페이스.id, 값
	}

	public void delete(BoardDTO dto) {
		sqlSession.update("board.delete", dto);
	}

	public void edit(BoardDTO dto) {
		sqlSession.update("board.edit", dto);
	}

	public void likeUp(BoardDTO dto2) {
		sqlSession.update("board.likeUp", dto2);
		
	}

	public int totalCount() {
		return sqlSession.selectOne("board.totalCount");
	}

	public List<Map<String, Object>> commentsList(int bno) {
		return sqlSession.selectList("board.commentsList", bno);
	}

	public int cdel(Map<String, Object> map) {
		return sqlSession.update("board.cdel", map);
	}

	public int cedit(Map<String, Object> map) {
		return sqlSession.update("board.cedit", map);
	}

}
