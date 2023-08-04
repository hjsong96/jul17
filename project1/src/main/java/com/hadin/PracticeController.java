package com.hadin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PracticeController {

	@Autowired
	PracticeService practiceService;
	
	
	@GetMapping("practice")
	public String practice() {
		return "practice";
	}
	
	/*
	 * @GetMapping("detail") public String deatail(Model model) { PracticeDTO dto =
	 * new PracticeDTO(); dto = practiceService.detail(); model.addAttribute(dto);
	 * 
	 * return "detail"; }
	 */
}
