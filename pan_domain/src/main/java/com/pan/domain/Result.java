package com.pan.domain;

/**
 * ajax 返回结果对象
 * <p>Title: Result</p>
 * <p>Description: </p>
 * @version 1.0
 */
public class Result<T> {
	//结果状态 
	private Boolean success;
	//返回的结果集
	private T data;
	//信息
	private String message;
	public Boolean getSuccess() {
		return success;
	}
	public void setSuccess(Boolean success) {
		this.success = success;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public static Result resultError(String message){
		Result result = new Result();
		result.setMessage(message);
		result.setSuccess(false);
		return result;
	}
	
	public static Result resultOk(String message){
		Result result = new Result();
		result.setMessage(message);
		result.setSuccess(true);
		return result;
	}
	
}
