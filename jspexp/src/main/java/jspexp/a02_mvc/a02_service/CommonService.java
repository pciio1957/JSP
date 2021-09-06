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
	
	// 전체 list를 가져오는 dao 처리 및 json 데이터 만들기
	public String memberList() {
		return gson.toJson(dao.getMemList());
	}
	
	// 등록처리하는 dao 호출 및 최종 json 데이터 처리 
	public String insMember(Member ins) {
		String ret = "등록성공";
		
		try {
			dao.insertMember(ins);
		} catch(Exception e) {
			ret = "등록시 문제발생" + "(" + e.getMessage() + ")";	
		}
		
		// {"result":"결과", "list":[]}
		// 주석으로 데이터 작성 후에 복붙하면 \역슬래시가 자동으로 붙음
		
		return "{\"result\":\"결과\", \"list\":" + memberList() + "}";
	}
	
	// 등록처리하는 dao 호출 및 최종 json 데이터 처리 
	public String uptMember(Member ins) {
		String ret = "수정성공";
		
		try {
			dao.updateMem(ins);
		} catch(Exception e) {
			ret = "등록시 문제발생" + "(" + e.getMessage() + ")";	
		}
		
		// {"result":"결과", "list":[]}
		// 주석으로 데이터 작성 후에 복붙하면 \역슬래시가 자동으로 붙음
		
		return "{\"result\":\"결과\", \"list\":" + memberList() + "}";
	}
	
	// 등록처리하는 dao 호출 및 최종 json 데이터 처리 
	public String delJsonMember(Member ins) {
		String ret = "삭제성공";
		
		try {
			dao.delMem(ins);
		} catch(Exception e) {
			ret = "등록시 문제발생" + "(" + e.getMessage() + ")";	
		}
		
		// {"result":"결과", "list":[]}
		// 주석으로 데이터 작성 후에 복붙하면 \역슬래시가 자동으로 붙음
		
		return "{\"result\":\"결과\", \"list\":" + memberList() + "}";
	}
	
	public String getEmpList(Emp sch) {
		// dao의 ArrayList형태 데이터 gson.toJson으로 객체로 변환처리..
		return gson.toJson(dao.getPreparedEmpList(sch));
	}
}
