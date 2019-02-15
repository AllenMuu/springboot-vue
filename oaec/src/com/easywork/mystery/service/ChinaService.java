package com.easywork.mystery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.easywork.mystery.entity.China;
import com.easywork.mystery.dao.ChinaMapper;

@Transactional
@Service
public class ChinaService {
	@Autowired
	private ChinaMapper chinaMapper;

	public ChinaMapper getChinaMapper() {
		return chinaMapper;
	}

}