package com.hadine.rest;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hadine.board.BoardService;
import com.hadine.login.LoginService;

@RestController //전체 바디 모두 responsebody 를 쓴다는 뜻, json 형태로 객체 반환
@Controller
public class ResttController {
	
	@Autowired
	private LoginService loginService;
	
	
	//아이디 중복검사 2023-08-02
 //바디에 결과값 1만 전달되도록 한다. 
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		System.out.println("id: " + id);
		int result = loginService.checkID(id);
		//System.out.println(result);
		//json
		JSONObject json = new JSONObject();
		json.put("result", result);
		System.out.println(json.toString());
		
		return json.toString(); // {result : 1}
	}
	
	//boardList2
	@GetMapping(value= "/boardList2", produces = "application/json; charset=UTF-8") //한글처리
	public String boardList2(@RequestParam("pageNo") int pageNo) {
		System.out.println("jq가 보내주는 : " + pageNo);
		
		List<Map<String, Object>> list = loginService.boardList2((pageNo -1) * 10); 
		JSONObject json = new JSONObject(); //리스트를 json 오브젝트로 만들 것이다.
		JSONArray arr = new JSONArray(list); //리스트 맵타입을 제이슨 배열에 담고 
		json.put("totalCount", loginService.totalCount());
		json.put("pageNo", pageNo);
		json.put("list", arr); // 이 배열을 다시 json 으로 감싸서 내보내야 한다. 
		//System.out.println(json.toString());
		
		return json.toString();
	}
	
	//객체 : { 키: 값, 키2 : 값, .....}
	
	
	
}
