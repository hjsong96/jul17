package com.hadine.pro1;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class WriteController {

	@GetMapping("/write")
	public String write() {
		return "write";
	}
	
	@PostMapping("/write")
	public String write2(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		//System.out.println(request.getParameter("title"));
		//System.out.println(request.getParameter("content"));
		String content = request.getParameter("content");
		content = content.replaceAll("/n", "<br>");
		return "board";
	}
	
}
