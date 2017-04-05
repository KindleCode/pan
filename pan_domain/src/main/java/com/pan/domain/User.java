package com.pan.domain;
/**
 * 通用user,用于存储当前登录的对象
 * <p>Title: User</p>
 * <p>Description: </p>
 * @version 1.0
 */
public class User {
	//当前登录对象的身份(root,college,teacher)
	private String identity;
	//当前用户对象
	private String username;
	private String password;
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
