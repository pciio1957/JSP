package jspexp.a00_exp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A0806_A13MVC
 */
@WebServlet(name = "exp02.do", urlPatterns = { "/exp02.do" })
public class A0809_A13MVC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A0809_A13MVC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 1. 요청값
		String inReplyS = request.getParameter("inReply");
		String gradeS = request.getParameter("grade");
		String cntS = request.getParameter("cnt");
		
		// 2. 모델데이터 처리 - 구구단 문제 전송
		boolean isCorr = false;
		if(inReplyS == null) {
			request.setAttribute("grade", (int) (Math.random()*8+2));
			request.setAttribute("cnt", (int) (Math.random()*9+1));
		} else {
			int inReply = Integer.parseInt(inReplyS);
			int grade = Integer.parseInt(gradeS);
			int cnt = Integer.parseInt(cntS);
			
			if(inReply==(grade*cnt)) {
				isCorr = true;
				request.setAttribute("msg", "정답입니다");
			} else {
				request.setAttribute("msg", "오답입니다");
			}
		}
		
		
		// 3. 화면 호출 
		String page = "a00_exp\\a0809_gugu.jsp";
		if(isCorr) page = "a00_exp\\a0809exp_gugu_result.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
