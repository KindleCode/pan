package com.pan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pan.domain.College;

/**学院账号信息*/
public interface CollegeMapper {
	/**根据id/colName查询学院对象*/
	public College getCollege(College college);
	/**根据状态查询学院列表*/
	public List<College> getAllCollege(@Param("status")String status);
}
