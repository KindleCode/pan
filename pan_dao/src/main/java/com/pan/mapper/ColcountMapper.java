package com.pan.mapper;

import com.pan.domain.Colcount;

/**
 *	学院账号映射文件
 * <p>Title: ColcountMapper</p>
 * <p>Description: </p>
 * @version 1.0
 */
public interface ColcountMapper {
	//增加学院账号(由Root账号进行分配)		
	public void insertColcount(Colcount colcount);
	//修改学院账号
	public void updateColcount(Colcount colcount);
	//删除学院账号
	public void deleteColcount(Colcount colcount);
	//根据username查询学院账号
	public Colcount getColcountByUsername(String name);
}
