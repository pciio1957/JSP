package jspexp.a02_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.servlet.RequestDispatcher;
import jspexp.a02_mvc.service.A22_MemberService;

/**
 * Servlet implementation class A22_MemberCheck
 */
@WebServlet(name = "memCheck2.do", urlPatterns = { "/memCheck2.do" })
public class A23_MemberCheck2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A22_MemberService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A23_MemberCheck2() {
        super();
        // TODO Auto-generated constructor stub
        service = new A22_MemberService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 1. 요청
		String id = request.getParameter("id");
		
		// 2. 모델 - 테스트용 himan 작성
		request.setAttribute("idCheck", (service.getMember(id)==null)?"등록가능":"등록불가능");
	
		
		// 3. view
		if(id == null) { // 초기화면에서는 id값이 없으니까 화면호출
			String page = "z01_jsp\\a00_exp\\a0901exp_Ans.jsp";
			javax.servlet.RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else { // ajax로 호출할때
			// json 데이터가 결과물을 전송해야한다
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print((service.getMember(id)==null)?"등록가능":"등록불가능");
			
		}
		
	}

}
