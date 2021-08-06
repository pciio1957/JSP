package jspexp.a02_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A03_Servlet3
 */
@WebServlet(name = "ser03.do", urlPatterns = { "/ser03.do" })
public class A03_Servlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A03_Servlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 응용) A03_Servlet3.java 요청값이 없을 때와 있을 때를 분리하여
		//		없을때는 로그인되지 않음, 있을 때는 해당 id와 pass를 출력하기 (5조)
		//		id=himan&pass=7777
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		String idIn = request.getParameter("id");
		String passIn = request.getParameter("pass");
		
		if(idIn != null && passIn != null) {
			out.print("<h2 align='center'> 로그인 성공! </h2>");
			out.print("<h2 align='center'> ID : " + idIn + "</h2>");
			out.print("<h2 align='center'> PASS : " + passIn + "</h2>");
		} else {
			out.print("<h2 align='center'>로그인 실패</h2>");
		}
	}

}
