package com.laptrinhjavaweb.model;


public class UserModel extends AbstractModel {	
	private String userName;
	private String fullName;
	private String password;
	private int status;
	private Long roleid;
	public UserModel(String userName, String fullName, String password, int status, Long roleid) {
		super();
		this.userName = userName;
		this.fullName = fullName;
		this.password = password;
		this.status = status;
		this.roleid = roleid;
	}
		

	public UserModel() {
		super();
	}


	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Long getRoleid() {
		return roleid;
	}
	public void setRoleid(Long roleid) {
		this.roleid = roleid;
	}

	
	

	
}
