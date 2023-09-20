package com.quiz.quiz02;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RequestMapping("/lesson01/quiz02")
@RestController
public class Lesson01Quiz02Controller {
//	1. json 출력 (List, Map)
//	영화 정보를 저장한 json을 List와 Map을 활용해서 아래와 같이 출력하세요.
//	요청 URL : http://localhost:8080/lesson01/quiz02/1
	
	// response body + return String -> HttpConverter 

	@RequestMapping("/1")
	public List<Map<String, Object>> quiz02_1() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rate", 15);
		map.put("director", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		list.add(map);
		
		// map = new HashMap<>(); 
		// 새롭게 리셋
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("rate", 0);
		map1.put("director", "로베르토 베니니");
		map1.put("time", 116);
		map1.put("title", "인생은 아름다워");
		list.add(map1);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("rate", 12);
		map2.put("director", "크리스토퍼 놀란");
		map2.put("time", 147);
		map2.put("title", "인셉션");
		list.add(map2);
		
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("rate", 19);
		map3.put("director", "윤종빈");
		map3.put("time", 133);
		map3.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		list.add(map3);
		
		Map<String, Object> map4 = new HashMap<String, Object>();
		map4.put("rate", 15);
		map4.put("director", "프란시스 로렌스");
		map4.put("time", 137);
		map4.put("title", "헝거게임");
		list.add(map4);
		
		
		return list;
	}

	
	
	@RequestMapping("/2")
	public List<Hi> quiz02_2() {
		List<Hi> list = new ArrayList<>();
		Hi hi = new Hi();
		hi.setTitle("안녕하세요 가입인사 드립니다.");
		hi.setUser("hagulu");
		hi.setContent("안녕하세요 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		list.add(hi);
		
		Hi hi1 = new Hi();
		hi1.setTitle("헐 대박");
		hi1.setUser("bada");
		hi1.setContent("오늘 목요일이었어... 금요일인줄");
		list.add(hi1);
		
		Hi hi2 = new Hi();
		hi2.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		hi2.setUser("dulumary");
		hi2.setContent("....");
		list.add(hi2);
		
		return list;
	}
	
	@RequestMapping("/3")
	public ResponseEntity<Hi> quiz02_3() {
		Hi hi = new Hi();
		hi.setTitle("안녕하세요 가입인사 드립니다.");
		hi.setUser("hagulu");
		hi.setContent("안녕하세요 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		
		return new ResponseEntity<>(hi	, HttpStatus.OK);
	}
	
}
