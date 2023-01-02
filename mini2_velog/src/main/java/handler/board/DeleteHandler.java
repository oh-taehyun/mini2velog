package handler.board;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class DeleteHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		

		BoardService service = new BoardService();
		BoardVo vo = service.getBoard(post_num);
		
		String path = "C:\\Users\\kosta\\Desktop\\255\\MyJAVA\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\down\\";
		
		File f = new File(path + vo.getFname());
		
		f.delete();
		service.delBoard(post_num);

		return "redirect:/board/list.do";
	}

}
