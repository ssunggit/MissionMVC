package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

// FrontCotrollerServlet가 일을 다 하는것이 아닌 BoardListController가 나눠함 
// 전체 게시글 조회
public class BoardListController implements Controller{

// 요청을 처리하기위해 request, response가 필요
	// 리턴타입 String : forward 할 jsp의 주소값을 담기위함
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		List<BoardVO> list = new ArrayList<>();
		list.add(new BoardVO("aaa", "bbb"));
		list.add(new BoardVO("ccc", "ddd"));
		list.add(new BoardVO("eee", "fff"));
		
		request.setAttribute("list", list);
		*/
		
		BoardService service = new BoardService();
		List<BoardVO> boardList = service.selectAllboard();
		request.setAttribute("list", boardList);
		
		return "/jsp/board/list.jsp";
	}
}
