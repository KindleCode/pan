package com.pan.domain;

/**
 * 文件对象
 * <p>Title: Folder</p>
 * <p>Description: </p>
 * @version 1.0 图片，文档，视频，种子，音乐，其他
 */
public class Pfolder {
	private String id;
	private String type;
	private String folurl;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFolurl() {
		return folurl;
	}
	public void setFolurl(String folurl) {
		this.folurl = folurl;
	}
}
