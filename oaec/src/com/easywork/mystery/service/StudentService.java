package com.easywork.mystery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easycore.utils.MyPage;
import com.easywork.mystery.dao.StudentMapper;
import com.easywork.mystery.entity.Student;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Transactional
@Service
public class StudentService {
	@Autowired
	private StudentMapper studentMapper;

	public StudentMapper getStudentMapper() {
		return studentMapper;
	}

	public MyPage<Student> findByCond(String dept, String sex, int pageNum, int pageSize) {
		Example exm = new Example(Student.class);
		Criteria crt = exm.createCriteria();
		if (!dept.trim().equals(""))
			crt.andCondition("department=", dept);
		if (!sex.trim().equals(""))
			crt.andCondition("sex=", sex);

		// 构建page对象
		MyPage<Student> page = MyPage.selectByExampleAndPage(studentMapper, exm, pageNum, pageSize);
		return page;
	}
}