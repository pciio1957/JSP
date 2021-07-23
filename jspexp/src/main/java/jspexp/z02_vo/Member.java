package jspexp.z02_vo;

public class Member {
	//아이디,패스워드,이름,권한,포인트
	private String id;
	private String pw;
	private String name;
	private String auth;
	private int point;
	
	public Member() {
		super();
	}

	public Member(String id, String pw, String name, String auth, int point) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.auth = auth;
		this.point = point;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
}
