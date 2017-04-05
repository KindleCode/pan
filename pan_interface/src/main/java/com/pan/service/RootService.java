package com.pan.service;

import com.pan.domain.Root;

/**
 * 查询root用户的service接口
 * <p>Title: RootService</p>
 * <p>Description: </p>
 * @version 1.0
 */
public interface RootService {
	//通过username查询root
	public Root getRootByUsername(String username);

}
