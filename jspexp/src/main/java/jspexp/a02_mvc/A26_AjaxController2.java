package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a02_mvc.a02_service.CommonService;
/**
 * Servlet implementation class A24_AjaxController
 * @param <CommonService>
 */
@WebServlet(name = "schEmp.do", urlPatterns = { "/schEmp.do" })
public class A26_AjaxController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommonService service;
	
	public A26_AjaxController2() {
		super();
		service = new CommonService();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 1. 요청값 처리
		String empnoS = request.getParameter("empno");
		

		// 3. 초기화면 호출 - 한 라인으로 바로 초기화면 호출 가능

		if(empnoS == null) {
			request.getRequestDispatcher("z01_jsp\\a14_mvc\\a06_mvc_DB.jsp").forward(request, response);
		} else {
			response.setContentType("text/html; charset=utf-8");	
			response.getWriter().print(service.getJsonEmp(Integer.parseInt(empnoS)));
			// {"name":"홍길동"}
		}
	}
}
