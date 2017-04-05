package com.pan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pan.domain.Colcount;
import com.pan.mapper.ColcountMapper;
import com.pan.service.ColcountService;

@Service
public class ColcountServiceImpl implements ColcountService {
	
	@Autowired
	private ColcountMapper colcountMapper;
	
	@Override
	public Colcount getColcountByUsername(String username) {
		return colcountMapper.getColcountByUsername(username);
	}

}
