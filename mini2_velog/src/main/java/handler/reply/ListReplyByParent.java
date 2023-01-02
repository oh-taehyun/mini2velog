package handler.reply;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import handler.Handler;
import reply.ReplyService;
import reply.ReplyVo;

public class ListReplyByParent implements Handler {

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
		ReplyService service = new ReplyService();
		
		int parent = Integer.parseInt(request.getParameter("num"));
		ArrayList<ReplyVo> list = service.getByParent(parent);
		if (list.size()==0) {
			return "responsebody/"+"null";
		}
		JSONArray arr = new JSONArray();
		
		for (ReplyVo vo: list) {
			JSONObject obj = new JSONObject();
			obj.put("repNum", vo.getRep_num());
			obj.put("writer", vo.getWriter());
			obj.put("content", vo.getContent());
			obj.put("postNum", vo.getPost_num());
			obj.put("rDate", vo.getrDate().toString());
			arr.add(obj);

		}
		String txt = arr.toJSONString();

		return "responsebody/"+txt;
	}

}
