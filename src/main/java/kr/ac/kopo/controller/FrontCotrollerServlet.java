package kr.ac.kopo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 클라이언트의 요청을 jsp 가 아닌 서블릿이 받도록한다
// 어떤 요청이 들어와도 대표 서블릿이 요청을 받는다

//	대표 서블릿 
public class FrontCotrollerServlet extends HttpServlet{	
	
	private	HandlerMapping mappings;
	
	//ServletConfig : 서블릿의 환경설정을 가지고 있음
	@Override
	public void init(ServletConfig config) throws ServletException {
		String propLocation = config.getInitParameter("propLocation");
		//System.out.println(propLocation);
		mappings = new HandlerMapping(propLocation);	
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		MissionMVC : request.getContextPath();
		String context = request.getContextPath();
//		요청의 uri 를 알려주는 메소드 : request.getRequestURI();
		String uri = request.getRequestURI();
		uri = uri.substring(context.length());
		
		System.out.println("uri: " + uri);
//		System.out.println("context: " + context);		
		try {
			//String callPage = null;
			//Controller control = null;
			Controller control = mappings.getController(uri);
			/*
			switch (uri) {
			case "/board/list.do":
				control = new BoardListController();
				break;
			case "/board/writeForm.do":
				control = new BoardWriteFormController();				
				break;
			
			case "/board/write.do":
				control = new BoardWriteController();				
				break;
			}
			*/
			if(control != null) {
				String callPage = control.handleRequest(request, response);
				if(callPage.startsWith("redirect:")) {
					callPage = callPage.substring("redirect:".length());
					response.sendRedirect(request.getContextPath()+callPage);
				}else {
					// forward
					RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
					dispatcher.forward(request, response);					
				}
			}

			// forward, include, web.xml 의 루트는 contextPath 뒤 (localhost:9999/MissionMVC/)
			// 다른 것의 루트는 localhost:9999 뒤 (localhost:9999/)
			
		}catch(Exception e) {
			throw new ServletException(e);
		}
		
	}


}
