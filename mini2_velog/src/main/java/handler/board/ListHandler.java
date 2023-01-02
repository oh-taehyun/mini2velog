package handler.board;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class ListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		BoardService service = new BoardService();
		ArrayList<BoardVo> list = service.getAll();
		
		request.setAttribute("list", list);

		return "/index/index.jsp";
	}

}
