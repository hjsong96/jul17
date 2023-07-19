package com.hadine.pro1;

import java.util.Arrays;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	// user -> Controller -> Service -> DAO -> mybatis -> DB

	// Autowired 말고 Resource 로 연결
	@Resource(name = "boardService")
	private BoardService boardService;

	@GetMapping("/board")
	public String board(Model model) {
		// 서비스에서 값 가져오기
		model.addAttribute("list", boardService.boardList());

		return "board";
	}

	// http://localhost:8080/pro1/detail?bno=131
	// 파라미터로 들어오는 값 잡기
	@GetMapping("/detail") // Model 은 jsp 에 값을 붙이기 위해 넣었습니다.
	public String detail(HttpServletRequest request, Model model) {
		String bno = request.getParameter("bno");
		// bno 에 요청하는 값이 있습니다. 이 값을 db까지 보내겠습니다.
		// System.out.println("bno: " + bno);

		BoardDTO dto = boardService.detail(bno);
		model.addAttribute("dto", dto);

		return "detail";
	}

	@GetMapping("/write")
	public String write() {
		return "write";
	}

	@PostMapping("/write")
	public String write2(HttpServletRequest request) throws Exception {
		// request.setCharacterEncoding("UTF-8");
		// 사용자가 입려한 데이터 변수에 담기
		// System.out.println(request.getParameter("title"));
		// System.out.println(request.getParameter("content"));
		// System.out.println("============================");

		BoardDTO dto = new BoardDTO();
		dto.setBtitle(request.getParameter("title"));
		dto.setBcontent(request.getParameter("content"));
		dto.setBwrite("말랭이"); // 이건 임시로 적었습니다. 로그인 추가되면 변경 예정

		// Service -> DAO -> mybatis -> DB 로 보내서 저장하기
		boardService.write(dto);
		// String content = request.getParameter("content");
		// content = content.replaceAll("/n", "<br>");

		return "redirect:board"; // 다시 컨트롤러 지나가기 GET 방식으로 갑니다.
	}

	//삭제가 들어온다면 http://172.30.1.19/delete?bno=150
	@GetMapping("/delete")
	public String delete(@RequestParam(value = "bno", required = false, defaultValue = "0") int bno) { //HttpServletRequest 의 getParameter();
		//System.out.println("bno: " + bno);
		//dto
		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);
		//dto.setBwrite(null); 사용자 정보
		//추후 로그인을 하면 사용자의 정보도 담아서 보냅니다.
		
		boardService.delete(dto);
		
		return "redirect:board"; //삭제를 완료한 후에 다시 보드로 갑니다. 
	}
}