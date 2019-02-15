package com.easywork.mystery.rpc;

import java.util.List;
import com.easywork.mystery.entity.Employee;

public interface MyService {
	public List<Employee> findAll();

	public List<Employee> findHero();
}
