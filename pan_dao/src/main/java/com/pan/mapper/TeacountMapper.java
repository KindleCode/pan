package com.pan.mapper;

import com.pan.domain.Teacount;

public interface TeacountMapper {
	
	public Teacount getTeacountByUsername(String username);
	
	public int updatePassword(Teacount teacount);

}
