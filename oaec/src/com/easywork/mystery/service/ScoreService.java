package com.easywork.mystery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.easywork.mystery.entity.Score;
import com.easywork.mystery.entity.Student;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

import com.easywork.mystery.dao.ScoreMapper;

@Transactional
@Service
public class ScoreService {
	@Autowired
	private ScoreMapper scoreMapper;

	public ScoreMapper getScoreMapper() {
		return scoreMapper;
	}

	public List<Score> findById(int id) {
		Example exm = new Example(Score.class);
		Criteria crt = exm.createCriteria();
		crt.andCondition("stu_id=", id);
		return scoreMapper.selectByExample(exm);
	}

}