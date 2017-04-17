package com.pan.domain;

/**
 * 学院账号  (是由root账号进行分配的)
 * <p>Title: Colcount</p>
 * <p>Description: </p>
 * @version 1.0
 */
public class Colcount{
	//主键
	private String id;
	//所属学院(外键)
	private String colId;
	//学院账号所在的根目录
	private String folder;
	private String username;
	private String password;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getColId() {
		return colId;
	}
	public void setColId(String colId) {
		this.colId = colId;
	}
	
	public String getFolder() {
		return folder;
	}
	public void setFolder(String folder) {
		this.folder = folder;
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
