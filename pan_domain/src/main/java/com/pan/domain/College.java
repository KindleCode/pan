package com.pan.domain;
/**
 * 学院对象
 * <p>Title: College</p>
 * <p>Description: </p>
 * @version 1.0
 */
/**
 * <p>Title: College</p>
 * <p>Description: </p>
 * @version 1.0
 */
public class College {
	private String id;
	private String colName;
	private String status;
	private String folder;
	
	public College(){}

	public College(String id){
		this.id = id;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getColName() {
		return colName;
	}
	public void setColName(String colName) {
		this.colName = colName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFolder() {
		return folder;
	}
	public void setFolder(String folder) {
		this.folder = folder;
	}
}
