package com.hadine.pro1;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

@Service("boardService") //서비스의 이름을 지정
public class BoardService {
	
	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;

	//보드 리스트 불러오는 메소드
	public List<Map<String, Object>> boardList() {
		return boardDAO.boardList(); //DAO가 대신 일한다.
	}

	public BoardDTO detail(String bno) {
		return boardDAO.detail(bno);
	}
}
