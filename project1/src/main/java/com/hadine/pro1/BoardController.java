package com.hadine.pro1;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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

		// 상대방 ip 가져오기
		String ip = null; // 192.168.0.0 -> HttpServletRequest 가 있어야 합니다.

		ip = request.getHeader("X-Forwarded-For"); // 헤더족을 읽어서 forwarded ip 뽑을 것이다.

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}

		BoardDTO dto = new BoardDTO();
		dto.setBtitle(request.getParameter("title"));
		dto.setBcontent(ip + request.getParameter("content"));
		dto.setBwrite("말랭이"); // 이건 임시로 적었습니다. 로그인 추가되면 변경 예정

		// Service -> DAO -> mybatis -> DB 로 보내서 저장하기
		boardService.write(dto);

		// String content = request.getParameter("content");
		// content = content.replaceAll("/n", "<br>");

		return "redirect:board"; // 다시 컨트롤러 지나가기 GET 방식으로 갑니다.
	}

}
