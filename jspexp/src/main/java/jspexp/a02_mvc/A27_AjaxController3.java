package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a02_mvc.a02_service.CommonService;
import jspexp.z02_vo.Member;
/**
 * Servlet implementation class A24_AjaxController
 * @param <CommonService>
 */
@WebServlet(name = "schMem.do", urlPatterns = { "/schMem.do" })
public class A27_AjaxController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommonService service;
	
	public A27_AjaxController3() {
		super();
		service = new CommonService();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*  #프로세스 로직
			1. 초기화면 로딩 - proc가 null값일 때
			2. id값으로 검색 - proc를 sch로
			3. 등록 - proc를 ins로
			4. 수정 - upt 
			5. 삭제 - del */
		
		// 1. 요청값 처리
		request.setCharacterEncoding("utf-8");
		String proc = request.getParameter("proc");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String auth = request.getParameter("auth");
		String point = request.getParameter("point");
		
		// 3. 초기화면 호출 - 한 라인으로 바로 초기화면 호출 가능
		// ajax에서는 초기화면에 요청값을 전달할 필요가 없어서 response.sendRedirect()로 처리 
		if(proc == null) {
			// 데이터를 넘겨야할때 (주소에는 /schMem.do로 나옴) 
			// request.getRequestDispatcher("z01_jsp\\a14_mvc\\a07_mvc_DB.jsp").forward(request, response);
			response.sendRedirect("z01_jsp\\a14_mvc\\a07_mvc_DB.jsp");
			
		} else {
			
			response.setContentType("text/html; charset=utf-8");
			if(proc != null) {
				
				if(proc.equals("ins")) {
					Member ins = new Member(id, pw, name, auth, Integer.parseInt(point));
					System.out.println("등록처리" + ins.getName());
					response.getWriter().print(service.insMember(ins));
				}
				
				if(proc.equals("sch")) {
					response.getWriter().print(service.getJsonMem(id));
				}
				
				if(proc.equals("upt")) {
					Member upt = new Member(id, pw, name, auth, Integer.parseInt(point));
					response.getWriter().print(service.uptMember(upt));
				}
				
				if(proc.equals("del")) {
					Member del = new Member(id, pw, name, auth, Integer.parseInt(point));
					response.getWriter().print(service.delJsonMember(del));
				}
			} 
		}	
	}
}