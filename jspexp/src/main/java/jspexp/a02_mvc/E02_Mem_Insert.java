package jspexp.a02_mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a02_mvc.a02_service.CommonService;

/**
 * Servlet implementation class E02_Mem_Insert
 */
@WebServlet(name = "E02_Mem_Insert.do", urlPatterns = { "/E02_Mem_Insert.do" })
public class E02_Mem_Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommonService service;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public E02_Mem_Insert() {
        super();
        service = new CommonService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	}

}
