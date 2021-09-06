package jspexp.a00_exp;

import com.google.gson.Gson;

import jspexp.z02_vo.Member;

public class a0902exp_class {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Member m01 = new Member("himan", "7777", "오길동", "관리자", 1000);
		Gson gson = new Gson();
		
		// 문자열 -> json 문자열
		String str01 = gson.toJson(m01);
		System.out.println(str01);
		
		// json 문자열 -> 문자열
		Member m02 = gson.fromJson(str01, Member.class);
		System.out.println(m02.getId());
		System.out.println(m02.getPw());
		System.out.println(m02.getName());
		System.out.println(m02.getAuth());
		System.out.println(m02.getPoint());
	}

}
