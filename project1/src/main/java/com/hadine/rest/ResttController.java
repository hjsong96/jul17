package com.hadine.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.hadine.util.Util;

@RestController //전체 바디 모두 responsebody 를 쓴다는 뜻, json 형태로 객체 반환
@Controller
public class ResttController {
	
	@Autowired
	private LoginService loginService;
		
	@Autowired
	private BoardService boardService;

	@Autowired
	private Util util;
	
	
	
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
	
	//자바스크립트로 만든 것.
	@PostMapping("/checkID2")
	public String checkID2(@RequestParam("id") String id) {
		int result = loginService.checkID(id);
		return result+"";
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
	
	@PostMapping("/cdelR")
	public String cdelR(@RequestParam Map<String, Object> map, HttpSession session) {
		int result = 0;
		if (session.getAttribute("mid") !=null) {
			if (map.containsKey("bno") && map.get("cno") !=null &&
					!(map.get("bno").equals("")) && !(map.get("cno").equals("")) && 
				util.isNum(map.get("bno")) && util.isNum(map.get("cno"))) {
				
				System.out.println(map);
				
				//System.out.println("여기로 들어왔습니다.");
				map.put("mid", session.getAttribute("mid"));
				result = boardService.cdel(map);
				System.out.println("삭제 결과: " + result);
				
				JSONObject json = new JSONObject();
				json.put("result", result);
				
				return json.toString();
			}
		}
		return result+"";
	}
	
	@PostMapping("/ceditR")
	public String ceditR(@RequestParam Map<String, Object> map, HttpSession session) {
		int result = 0;
		if (map.containsKey("bno") && map.containsKey("cno") &&
				!(map.get("bno").equals("")) && !(map.get("cno").equals("")) ) {
			map.put("mid", session.getAttribute("mid"));
			System.out.println(map);
			result = boardService.cedit(map);
			System.out.println(result);
		}
		return "0";
	}
}
