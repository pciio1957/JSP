package jspexp.a02_mvc.a02_service;

import com.google.gson.Gson;

import jspexp.z01_database.A05_PreparedDao;
import jspexp.z02_vo.Emp;
import jspexp.z02_vo.Member;

public class CommonService {
	private A05_PreparedDao dao;
	private Gson gson;
		
	public CommonService() {
		// TODO Auto-generated constructor stub
		dao = new A05_PreparedDao();
		gson = new Gson();
	}

	public Member getMember(String id) {
		return dao.getMem(id);
	}
	
	public String getJsonMem(String id) {
		String memJson = "{}";
		Member mem = dao.getMem(id);
		
		if(mem != null) {
			memJson = gson.toJson(mem);
		}
		return memJson;
	}
	
	public String getJsonEmp(int empno) {
		// dao를 통해 나온 Emp객체를 gson으로 처리 
		String empJson = "{}";
		Emp emp = dao.getEmp(empno);
		
		if(emp != null) {
			empJson = gson.toJson(emp);
		}
		return empJson;
	}
}
