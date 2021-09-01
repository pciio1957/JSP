package jspexp.a02_mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.servlet.RequestDispatcher;
import jspexp.a02_mvc.service.E01_IsLoginService;

/**
 * Servlet implementation class E01_IsLogin
 */
@WebServlet(name = "e01_isLogin.do", urlPatterns = { "/e01_isLogin.do" })
public class E01_IsLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private E01_IsLoginService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public E01_IsLogin() {
        super();
        service = new E01_IsLoginService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		
		if(id != "") {
			request.setAttribute("idCheck", service.isIDCheck(id));
		}
		
		String page = "z01_jsp\\a00_exp\\a0901exp.jsp";
		javax.servlet.RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
