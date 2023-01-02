package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class ListByTitleHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		BoardService service = new BoardService();
		ArrayList<BoardVo> list = service.getByTitle(title);
		request.setAttribute("list", list);
		
		return "/index/index.jsp";

	}

}
