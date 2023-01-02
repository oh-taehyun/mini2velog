package handler.board;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class EditBoard implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		
		String title = request.getParameter("title");
		System.out.println(title);
		String content = request.getParameter("content");
		BoardService service = new BoardService();
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		service.editBoard(new BoardVo(post_num,null,title,content,null,0,0,null));
		BoardVo vo = service.getBoard(post_num);
		JSONObject obj = new JSONObject();
		

		obj.put("title", vo.getTitle());
		obj.put("content", vo.getContent());

		String txt = obj.toJSONString();
		return "responsebody/"+txt;
	}
	
}
