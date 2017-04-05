package com.pan.domain;

import java.sql.Time;

public class Root {
	private String username;
	private String password;
	private Time updatetime;
	public Time getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Time updatetime) {
		this.updatetime = updatetime;
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
