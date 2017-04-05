package com.pan.mapper;

import com.pan.domain.Root;

public interface RootMapper {
	//通过username查询root对象
	public Root getRootByUsername(String username);
}
