package jspexp.a02_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A02_Servlet2
 */
@WebServlet(name = "ser02.do", urlPatterns = { "/ser02.do" })
public class A02_Servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A02_Servlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// 응용) servlet A02_Servlet2.java serv02.do로 만들어서
		// 	물건명, 가격, 갯수는 자바 변수로 h3으로 출력하기(4조)
		
		// 정적 처리 
		String name="사과";
		int price = 2000;
		int cnt = 25;
		out.print("<h2 align='center'> 물건명" + name + "</h2>");
		out.print("<h2 align='center'> 가격" + price + "</h2>");
		out.print("<h2 align='center'> 갯수" + cnt + "</h2>");
		
		
		// 동적 처리 
		String nameS = request.getParameter("name");
		String priceS = request.getParameter("price");
		String cntS = request.getParameter("cnt");
		
		String name2 = (nameS != null)?nameS:"";
		int price2 = (priceS != null)?Integer.parseInt(priceS):0;
		int cnt2 = (cntS != null)?Integer.parseInt(cntS):0;
		out.print("<h2 align='center'> 물건명" + name + "</h2>");
		out.print("<h2 align='center'> 가격" + price + "</h2>");
		out.print("<h2 align='center'> 갯수" + cnt + "</h2>");
		out.print("<h2 align='center'> 총계" + (price2*cnt2) + "</h2>");
		
		// ser02.do?name=사과&price=3000&cnt=5 결과가 나옴
		
		// 응용) A03_Servlet3.java 요청값이 없을 때와 있을 때를 분리하여
		//		없을때는 로그인되지 않음, 있을 때는 해당 id와 pass를 출력하기 (5조)
		//		id=himan&pass=7777
	}

}
