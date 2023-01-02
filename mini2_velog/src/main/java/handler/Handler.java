package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//요청 처리 클래스의 조상
public interface Handler {
	String process(HttpServletRequest request,HttpServletResponse response);
}
