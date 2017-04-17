package com.pan.utils;

import java.util.UUID;

/**
 * 生成唯一主键工具类
 * <p>Title: UUID</p>
 * <p>Description: </p>
 * @version 1.0
 */
public class RandomUtil {

	public static String getUUID(){
		return UUID.randomUUID().toString();
	}
	
}
