package com.pan.service;

import com.pan.domain.Teacount;

public interface TeacountService {
	//根据用户名查询用户对象
	public Teacount getTeacountByUsername(String username);
	//根据用户名进行密码的修改
	public int updatePassword(Teacount teacount);
}

