package handler.board;

import java.io.UnsupportedEncodingException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import handler.Handler;

public class SearchHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if(request.getMethod().toLowerCase().equals("get")) {
			return "/board/search.jsp";
		}
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		

		
		int type = Integer.parseInt(request.getParameter("s"));
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		
		if(type == 1) {
			request.setAttribute("title", title);
			return "/board/s_title.do";
		}else if(type == 2) {
			request.setAttribute("writer", writer);
			return "/board/s_writer.do";
		}
		
		return null;
	}

}
