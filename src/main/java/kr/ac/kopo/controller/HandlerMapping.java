package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.Map;

public class HandlerMapping {
//		키에 uri value 인터페이스 컨트롤러
	private Map<String, Controller> mappings = new HashMap<>();

	public HandlerMapping() {
		mappings.put("/board/list.do",new BoardListController());
		mappings.put("/board/writeForm.do",new BoardWriteFormController());
		mappings.put("/board/write.do", new BoardWriteController());
	}
	
	public Controller getController(String uri) {
		
		return mappings.get(uri);
	}
	
	
}
