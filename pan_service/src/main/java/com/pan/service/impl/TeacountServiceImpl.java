package com.pan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pan.domain.Teacount;
import com.pan.mapper.TeacountMapper;
import com.pan.service.TeacountService;

@Service
public class TeacountServiceImpl implements TeacountService {
	
	@Autowired
	private TeacountMapper teacountMapper;

	@Override
	public Teacount getTeacountByUsername(String username) {
		return teacountMapper.getTeacountByUsername(username);
	}

}
