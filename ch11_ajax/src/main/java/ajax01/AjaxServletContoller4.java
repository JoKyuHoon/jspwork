package ajax01;

import java.io.IOException;

import org.json.simple.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxServletContoller4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("name");
		MemberDao mDao = new MemberDao();
		Member bean = mDao.getMember(id);
		
		// 1. 객체의 주소 반환. toString() 오버라이딩 했다면 toString()의 값(문자열)이 출력
//		System.out.println(bean);
//		response.getWriter().print(bean);
		
		// 2. JSONObject 객체로
		 // JSON 객체 생성
        JSONObject jObj = new JSONObject();
        jObj.put("userId", bean.getId());
        jObj.put("userName", bean.getName());
        jObj.put("gender", bean.getGender());
        jObj.put("email", bean.getEmail());
		
		response.setContentType("application/json");
		response.getWriter().print(jObj);
	}


}
