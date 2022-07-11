package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * http://localhost:9999/MissionMVC/board/writeForm.do 요청처리
 */
public class BoardWriteFormController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// forward, include, web.xml 의 루트는 contextPath 뒤 (localhost:9999/MissionMVC/)
		return  "/jsp/board/writeForm.jsp";
	}
}
