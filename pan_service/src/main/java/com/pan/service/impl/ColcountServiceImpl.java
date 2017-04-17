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
	
	/**查询colcount对象*/
	@Override
	public Colcount getColcountByUsername(String username) {
		return colcountMapper.getColcountByUsername(username);
	}

	/**新增学院账号对象*/
	@Override
	public void insertColcount(Colcount colcount) {
		colcountMapper.insertColcount(colcount);
	}

	/**删除学院账号*/
	@Override
	public void deleteColcount(Colcount colcount) {
		colcountMapper.deleteColcount(colcount);
	}

}
