package jspexp.a02_mvc.service;

import jspexp.z01_database.A05_PreparedDao;
import jspexp.z02_vo.Member;

public class A22_MemberService {
	private A05_PreparedDao dao;

	public A22_MemberService() {
		// TODO Auto-generated constructor stub4
		super();
		dao = new A05_PreparedDao();
	}

	// dao의 데이터 호출하기 
	public Member getMember(String id) {
		return dao.getMem(id);
	}
}
