package com.hadine.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	//첫 화면 로딩 : index.jsp 호출
	@GetMapping(value = {"/", "/index", "/home"})
	public String index() {
		return "index"; //데이터 붙임 없이 index.jsp 페이지만 보여줍니다.
	}
	
	@GetMapping("/board2")
	public String board2() {
		return "board2";
	}
	
	@GetMapping("/mooni")
	public String mooni() {
		return "mooni";
	}
	
	@GetMapping("notice")
	public String notice() {
		return "notice";
	}
	
}
