package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A12_ShppingMVC
 */
@WebServlet(name = "shp01.do", urlPatterns = { "/shp01.do" })
public class A12_ShppingMVC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A12_ShppingMVC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String buyname = request.getParameter("buyname");
		String buypriceS = request.getParameter("buyprics");
		String buycntS = request.getParameter("buycnt");
		
		int buyprice = (buypriceS!=null)?Integer.parseInt(buypriceS):0;
		int buycnt = (buycntS!=null)?Integer.parseInt(buycntS):0;
		int buysum = buyprice * buycnt;
		
		request.setAttribute("buyname", buyname);
		request.setAttribute("buyprice", buyprice);
		request.setAttribute("buycnt", buycnt);
		
		if(buysum >= 100000) {
			request.setAttribute("buysum", (int) (buysum * 0.85));
			request.setAttribute("disratio", 15);
		} else {
			request.setAttribute("buysum", (int) (buysum * 0.95));
			request.setAttribute("disratio", 3);
		}
		
		// 기본 화면
		String page = "a04_basic\\a07_buy.jsp";
		
		if(buysum >= 100000) {
			page = "a04_basic\\a08_vip.jsp";
		} else if (buysum > 0){
			page = "a04_basic\\a09_cus.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
		
	}

}
