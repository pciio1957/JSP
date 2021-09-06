package jspexp.z03_util;

import com.google.gson.Gson;

import jspexp.z02_vo.Person;
import jspexp.z02_vo.Product;

public class A01_GSON {

	
	/*
	
	#Gson
	1. 객체를 json 문자열로 변환
		class Person {
		
			private String name;
			public void setName(String name) {}
			public void getName(String name) {}
		}
		Person p = new Person();
		p.setName("홍길동");
		
		gson.toJson(객체참조) -> 
		-> {name:"홍길동"}
	 
	*/
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Person p01 = new Person("홍길동", 25, "서울");
		Gson gson = new Gson();
		
		// 1. 객체를 json문자열로 변환처리
		String json = gson.toJson(p01);
		System.out.println("json 문자열 데이터 : " + json);
		
		String json2 = "{\"name\":\"마길동\",\"age\":29,\"loc\":\"제주\"}";
		Person p02 = gson.fromJson(json2, Person.class);
		
		System.out.println(p02.getName());
		System.out.println(p02.getAge());
		System.out.println(p02.getLoc());
		
		
		/* 
		 응용) Product 클래스를 객체로 할당한 후, json 문자열로 출력하고
		 	json 문자열 데이터를 Product 객체로 생성해서 출력하기 
		*/
		
		Product prod01 = new Product("체리", 19000, 5);
		Gson gson2 = new Gson();
		
		String json3 = gson.toJson(prod01);
		System.out.println("json 문자열 데이터 출력 \n : " + json3);
		
		String json4 = "{\"name\":\"체리\",\"price\":19000,\"cnt\":5,\"dis\":0}";
		Product prod02 = gson.fromJson(json3, Product.class);
		System.out.println(prod02.getName());
		System.out.println(prod02.getPrice());
		System.out.println(prod02.getCnt());
		
	}

}
