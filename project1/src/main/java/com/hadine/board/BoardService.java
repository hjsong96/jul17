package com.hadine.board;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hadine.util.Util;

@Service("boardService") // 서비스의 이름을 지정
public class BoardService {

	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;

	@Autowired
	private Util util; // 컴포넌트 Util과 연결했습니다.

	// 보드 리스트 불러오는 메소드
	public List<BoardDTO> boardList(PageDTO page) {
		return boardDAO.boardList(page); // DAO가 대신 일한다.
	}

	public BoardDTO detail(BoardDTO dto2) {
		//좋아요 수 +1 하기 기능을 넣어주겠습니다. 
		boardDAO.likeUp(dto2);
		
		BoardDTO dto = boardDAO.detail(dto2);
		//System.out.println(dto);
		//System.out.println(dto.getBno());
		//System.out.println(dto.getBip());
		
		if (dto != null) {//내 글이 아닐 때 null 들어옵니다. 즉, null 이 아닐 때라고 검사해주세요.
			// 검사 : . 이 없거나, null이면 실행하지 않게 해주세요.
			if (dto.getBip() != null && dto.getBip().contains(".")) {
				// 여기서 ip 뽑아오기 (get ip)
				String newip = dto.getBip();
				String[] newip2 = newip.split("\\.");
				System.out.println(Arrays.toString(newip2));
				// ip 중간에 하트 넣어주기 (string)
				newip2[1] = "♡";
				System.out.println(Arrays.toString(newip2));
				// 그거 다시 ip에 저장 (set bip)
				String h = String.join(".", newip2);
				dto.setBip(h);
				// 끝.
				// 172.30.1.19 ----> 172.♡.1.19
			}
		} 
		return dto;  
	}

	// 글쓰기입니다.
	public void write(BoardDTO dto) {  
		// btitle 을 꺼내줍니다.
		// dto.getBtitle()
		//String btitle = dto.getBtitle();
		// 값을 변경하겠습니다. replace() <-> < -> &lt; > -> &gt;
		// btitle = btitle.replaceAll("<", "&lt;");
		// btitle = btitle.replaceAll(">", "&gt;");

		//util.exchange(dto.getBtitle());
		//btitle = util.exchange(btitle);
		
		// 다시 저장해주세요
		dto.setBtitle(util.exchange(dto.getBtitle()));

		// 얻어온 ip도 저장해서 데이터베이스로 보내겠습니다
		dto.setBip(util.getIp());

		//System.out.println(btitle);

		boardDAO.write(dto); // 실행만 시키고 결과를 받지 않습니다.
		// select 를 제외한 나머지는 영향받은 행의 수(int)를 받아오기도 합니다.
	}

	public void delete(BoardDTO dto) {
		boardDAO.delete(dto);
	}

	public void edit(BoardDTO dto) {
		boardDAO.edit(dto);
		
	}

	public int totalCount() {
		return boardDAO.totalCount();
	}

	public List<Map<String, Object>> commentsList(int bno) {
		return boardDAO.commentsList(bno);
	}


}
//test 입니다.
