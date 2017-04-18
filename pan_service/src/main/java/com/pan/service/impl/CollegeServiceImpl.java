package com.pan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pan.domain.College;
import com.pan.mapper.CollegeMapper;
import com.pan.service.CollegeService;
@Service
public class CollegeServiceImpl implements CollegeService {

	@Autowired
	private CollegeMapper collegeMapper;
	
	
	@Override
	public College getCollege(College college) {
		return collegeMapper.getCollege(college);
	}


	@Override
	public List<College> getAllCollege(String status) {
		return collegeMapper.getAllCollege(status);
	}

}
