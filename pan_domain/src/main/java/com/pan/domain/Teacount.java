package com.pan.domain;
/**
 * 老师账户对象
 * <p>Title: Teacount</p>
 * <p>Description: </p>
 * @version 1.0
 */
public class Teacount{
	private String id;
	private String username;
	private String password;
	private String realname;
	//所属学院编号
	private String colId;
	private String phone;
	private String mail;
	private String folId;
	private String panId;
	
	public Teacount(){}
	
	public Teacount(String username,String password){
		this.password = password;
		this.username = username;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getColId() {
		return colId;
	}
	public void setColId(String colId) {
		this.colId = colId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getFolId() {
		return folId;
	}
	public void setFolId(String folId) {
		this.folId = folId;
	}
	public String getPanId() {
		return panId;
	}
	public void setPanId(String panId) {
		this.panId = panId;
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
