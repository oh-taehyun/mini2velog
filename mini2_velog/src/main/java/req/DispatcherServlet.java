package req;

import java.io.FileNotFoundException;

import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("*.do") //모든 요청 받음
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 명령어와 실행할 handler객체를 쌍으로 저장할 맵샐성
	private Map<String, Handler> map = new HashMap<>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DispatcherServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 서블릿 초기화 메서드
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		// Properties: map과 비슷하게 키와 값 저장하는 클래스.
		Properties prop = new Properties();
		// Properties 파일 경로
		String path = "/WEB-INF/command.properties";
		// 웹주소로 변경
		String path2 = getServletContext().getRealPath(path);
		try {
			// 파일의 내용을 읽어서 Properties에 복구
			prop.load(new FileReader(path2));
			// properties의 키값묶음 반복자 붙여서
			Iterator iter = prop.keySet().iterator();// iterator => 반복자
			// 읽을 키가 있을 동안 반복
			while (iter.hasNext()) {
				String url = (String) iter.next();
				// 키에 묶인 값을 읽는다.(클래스명)
				String className = prop.getProperty(url);
				try {
					// 클래스 정보를 읽어서 반환
					Class<?> handlerClass = Class.forName(className);
					// Class 객체의 new newInstance()메서드는 객체생성
					Constructor<?> cons = handlerClass.getConstructor(null);
					Handler handler = (Handler) cons.newInstance();
					// 명령어와 핸들러 객체를 쌍으로 등록
					map.put(url, handler);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String url = request.getParameter("url");
		//요청 url 반환
		String url = request.getServletPath();
		
		// 명령어로 등록된 핸들러 객체를 꺼내서
		Handler handler = map.get(url);
		// process()를 호출
		String view = handler.process(request, response);
		if(view==null) {
			return;
		}
		if (view.startsWith("redirect:")) {
			String path = view.split(":")[1];
			response.sendRedirect(request.getContextPath() + path);
		} else if (view.startsWith("responsebody/")) {
			response.getWriter().append(view.split("/")[1]);
		} else {
			RequestDispatcher dis = request.getRequestDispatcher(view);
			dis.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
