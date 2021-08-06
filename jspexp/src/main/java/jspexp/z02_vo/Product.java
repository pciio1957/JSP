package jspexp.z02_vo;

public class Product {
	private String name;
	private int price;
	private int cnt;
	
	public Product() {
		super();
	}
	
	public Product(String name) {
		super();
		this.name = name;
	}

	public Product(String name, int price, int cnt) {
		super();
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
