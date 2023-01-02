package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class ListByWriterHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String writer = request.getParameter("writer");
		BoardService service = new BoardService();
		ArrayList<BoardVo> list = service.getByWriter(writer);
		request.setAttribute("list", list);
		
		return "/index/index.jsp";
	}

}
