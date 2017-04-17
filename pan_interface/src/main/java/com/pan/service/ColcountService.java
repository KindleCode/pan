package com.pan.service;

import com.pan.domain.Colcount;

public interface ColcountService {
	//根据username查询colcount对象
	public Colcount getColcountByUsername(String username);
	//新增colcount对象
	public void insertColcount(Colcount colcount);
	//删除colcount对象
	public void deleteColcount(Colcount colcount);

}
