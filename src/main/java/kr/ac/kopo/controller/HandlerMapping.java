package kr.ac.kopo.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {
//		키에 uri value 인터페이스 컨트롤러
	private Map<String, Controller> mappings = new HashMap<>();

	public HandlerMapping(String propLocation) {
		
		Properties prop = new Properties();
		
		try {			
			// InputStream is = new FileInputStream("D:\\Lecture\\web-workspace\\MissionMVC\\bean.properties");
			InputStream is = new FileInputStream(propLocation);
			prop.load(is);
			//System.out.println(prop.getProperty("/board/list.do"));
			
			// 키를 셋형태로 받아옴
			Set<Object> keys = prop.keySet();
			
			for(Object key : keys) {
				System.out.println(key);
				// key 가 Object 형이라 형변환
				String className= prop.getProperty(key.toString());
				//System.out.println(className);
				
				Class<?> clz = Class.forName(className);
				
				Constructor<?> constructor = clz.getConstructor();
				
				// (Controller)clz.newInstance() : clz.newInstance() 동적으로 변하기때문에 컨트롤러 타입으로 인식하지못해 오류 -> 상속받은 컨트롤러로 형변환
				mappings.put(key.toString(), (Controller)constructor.newInstance());
			}
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/*
		mappings.put("/board/list.do",new BoardListController());
		mappings.put("/board/writeForm.do",new BoardWriteFormController());
		mappings.put("/board/write.do", new BoardWriteController());
		 */	
	}
	
	public Controller getController(String uri) {
		
		return mappings.get(uri);
	}
	
	/*
	public static void main(String[] args) throws Exception {
		// 클래스 명으로 동적 객체 생성
		Class<?> clz = Class.forName("kr.ac.kopo.controller.BoardListController");
		BoardListController obj = (BoardListController) clz.newInstance();
		System.out.println(obj.handleRequest(null, null));
		
		
		// 리프렉션 : 동적으로 객체를 셍성하게함

//		Class<?> clz = Class.forName("java.util.Random");
//		// newInstance() : 클래스의 객체 만들기
//		java.util.Random r = (java.util.Random) clz.newInstance();
//		int random = r.nextInt(10) + 1;
//		System.out.println(random);
		
		
		
		//java.util.Random r = new java.util.Random();
		//int random = r.nextInt(10) + 1;
		//System.out.println(random);
		
	}
	
	*/
}
