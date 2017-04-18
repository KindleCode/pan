package com.pan.service;

import java.util.List;

import com.pan.domain.College;

public interface CollegeService {
	/**根据id/colNmae查询college对象*/
	public College getCollege(College college);
	
	/**根据状态查询学院列表*/
	public List<College> getAllCollege(String status);

}
