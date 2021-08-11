package jspexp.a00_exp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A0806exp
 */
@WebServlet(name = "exp01.do", urlPatterns = { "/exp01.do" })
public class A0806exp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A0806exp() {
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
		
		// 1번문제
		String bname = request.getParameter("bname");
		String bpriceS = request.getParameter("bprice");
		int bprics = 0;
		
		if(bname==null) bname="";
		if(bpriceS!=null) bprics=Integer.parseInt(bpriceS);
				

		// 2번문제
		String ranNum01S = request.getParameter("ranNum01");
		String ranNum02S = request.getParameter("ranNum02");
		String ansS = request.getParameter("ans");
		
		boolean isAns = false;
		int ranno01 = 0;
		int ranno02 = 0;
		int ans = 0;
		
		if(ranNum01S!=null) ranno01 = Integer.parseInt(ranNum01S);
		if(ranNum02S!=null) ranno02 = Integer.parseInt(ranNum02S);
		if(ansS!=null) { 
			isAns = true;
			ans = Integer.parseInt(ansS); 
		}
		

		// 초기페이지
		String page = "a00_exp\\a0806exp.jsp";

		if(isAns) {
			page = "a00_exp\\a0806exp_result.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
