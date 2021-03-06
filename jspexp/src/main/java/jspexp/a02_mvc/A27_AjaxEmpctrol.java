package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a02_mvc.a02_service.CommonService;
import jspexp.z02_vo.Emp;

/**
 * Servlet implementation class A27_AjaxEmpctrol
 */
@WebServlet(name = "ajaxEmp.do", urlPatterns = { "/ajaxEmp.do" })
public class A27_AjaxEmpctrol extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommonService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A27_AjaxEmpctrol() {
        super();
        service = new CommonService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 1. 요청값 처리.
		request.setCharacterEncoding("utf-8");
		String ename = request.getParameter("ename")==""?"":request.getParameter("ename");
		String job = request.getParameter("job")==""?"":request.getParameter("job");
		
		
		
		// 2. service
		
		// 3. 초기화면 호출
		if(ename!=null) {
			System.out.println("ename:"+ename);
			System.out.println("job:"+job);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(service.getEmpList(new Emp(ename,job)));
		}else {
			response.sendRedirect("z01_jsp\\a14_mvc\\a08_mvc_empAjax.jsp");
		}
		
	}

}
