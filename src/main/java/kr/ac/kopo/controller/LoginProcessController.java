package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.member.vo.MemberVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 연결확인
		//System.out.println("LoginProcessController 처리부...");
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		if(id.equals("user") && password.equals("user")) {
			// 로그인성공
			
			MemberVO userVO = new MemberVO();
			userVO.setId(id);
			userVO.setPassword(password);
			userVO.setName("홍길동이");
			userVO.setType("U");
			
			// 세션등록
			// request 객체 안에 session 객체 얻어올 수 았음
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
			
			// page-context 가 뒤에 있음
			return "redirect:";
		}
		
		// 로그인 실패		
		return "redirect:/login.do";
		
	}

}
