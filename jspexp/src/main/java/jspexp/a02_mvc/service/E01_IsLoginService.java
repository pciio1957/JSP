package jspexp.a02_mvc.service;

public class E01_IsLoginService {
	private E01_isLoginDAO dao;

	
	public E01_IsLoginService() {
		super();
		dao = new E01_isLoginDAO();
	}

	public boolean isIDCheck(String id) {	
		return dao.idCheck(id);
	}
	
}
