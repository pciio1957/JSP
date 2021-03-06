package jspexp.z02_vo;


// 주소 : jspexp.z02_vo.Product
public class Product {
	private String name;
	private int price;
	private int cnt;
	private int dis; // 할인율
	
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
	
	public Product(String name, int price, int cnt, int dis) {
		super();
		this.name = name;
		this.price = price;
		this.cnt = cnt;
		this.dis = dis;
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

	public int getDis() {
		return dis;
	}

	public void setDis(int dis) {
		this.dis = dis;
	}

}
