package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A21_MVC_Buy
 */
@WebServlet(name = "a21_buy.do", urlPatterns = { "/a21_buy.do" })
public class A21_MVC_Buy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A21_MVC_Buy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 1. 요청값 처리
		String pname = request.getParameter("pname");
		String priceS = request.getParameter("price");
		String pcntS = request.getParameter("pcnt");
		
		if(pname != null && priceS != null && pcntS != null) {
			int price = Integer.parseInt(priceS);
			int pcnt = Integer.parseInt(pcntS);
			int tot = price * pcnt;
			
			// 결과 처리
			request.setAttribute("tot", tot);
		}
		
		// view 호출
		String page = "z01_jsp\\a14_mvc\\a02_buyProduct.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
