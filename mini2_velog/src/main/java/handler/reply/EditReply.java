package handler.reply;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import reply.ReplyService;
import reply.ReplyVo;

public class EditReply implements Handler {

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
		
		String content = request.getParameter("content");
		int repN = Integer.parseInt(request.getParameter("repNum"));
		
		ReplyService service = new ReplyService();
				
		service.editReply(new ReplyVo(repN, "", content, 0, null));
		ReplyVo vo = service.getByrepNum(repN);
		
		JSONObject obj = new JSONObject();
		
		obj.put("repNum", repN);
		obj.put("writer", vo.getWriter());
		obj.put("rDate", vo.getrDate().toString());
		obj.put("content", content);
		
		String txt = obj.toJSONString();
		return "responsebody/"+txt;
	}

}
