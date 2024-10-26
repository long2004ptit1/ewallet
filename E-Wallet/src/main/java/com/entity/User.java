package com.entity;

public class User {
	private int id;
	private String name;
	private String userName;
	private String email;
	private String phone;
	private String password;
	private float balance;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	 public double getBalance() {
	        return balance;
	    }

	    public void setBalance(float balance) {
	        this.balance = balance;
	    }


		@Override
		public String toString() {
			return "User [id=" + id + ", name=" + name + ", userName=" + userName + ", email=" + email + ", phone="
					+ phone + ", password=" + password + ", balance=" + balance + "]";
		}

	


	
	
	
	
	
}
