package handler.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getMethod().toLowerCase().equals("get")) {
			return "/board/addForm.jsp";
		}
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String path = "C:\\Users\\kosta\\Desktop\\255\\MyJAVA\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\down\\";

		int size = 100 * 1024 * 1024;

		MultipartRequest multipart = null;
		try {
			multipart = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String writer = multipart.getParameter("writer");
		String title = multipart.getParameter("title");
		String content = multipart.getParameter("content");
		BoardService service = new BoardService();

		File f = multipart.getFile("file");

		try {
			String fname = f.getName();
			service.addBoard(new BoardVo(0, writer, title, content, null, 0, 0, fname));
			return "redirect:/board/list.do";
			
		} catch (NullPointerException e) {
			service.addBoard(new BoardVo(0, writer, title, content, null, 0, 0, null));
			return "redirect:/board/list.do";
		}

	}

}
