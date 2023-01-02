package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class CntViewsHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		String id = request.getParameter("id");
		

		BoardService service = new BoardService();
		BoardVo vo = service.getBoard(post_num);
		request.setAttribute("vo", vo);
		service.editViews(vo);
		
		return "/board/detail.do?post_num="+post_num+"&id="+id;
	}

}
