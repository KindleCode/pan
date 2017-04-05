package com.pan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pan.domain.Root;
import com.pan.mapper.RootMapper;
import com.pan.service.RootService;

@Service
public class RootServiceImpl implements RootService {

	@Autowired
	private RootMapper rootMapper;
	
	//根据username查询root账号对象
	@Override
	public Root getRootByUsername(String username) {
		return rootMapper.getRootByUsername(username);
	}
}






