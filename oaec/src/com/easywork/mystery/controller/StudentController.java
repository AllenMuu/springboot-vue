package com.easywork.mystery.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.easycore.utils.BaseController;
import com.easycore.utils.MyPage;
import com.easywork.mystery.entity.Student;
import com.easywork.mystery.service.StudentService;

@Controller
@RequestMapping("/mystery/Student")
public class StudentController extends BaseController {
	@Autowired
	private StudentService studentService;

	@RequestMapping("/findByCond")
	@ResponseBody
	public MyPage<Student> findByCond(String dept, String sex, int pageNum, int pageSize) {
		return studentService.findByCond(dept, sex, pageNum, pageSize);
	}

}