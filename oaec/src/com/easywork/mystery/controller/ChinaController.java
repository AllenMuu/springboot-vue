package com.easywork.mystery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.easycore.utils.BaseController;
import com.easywork.mystery.entity.China;
import com.easywork.mystery.service.ChinaService;

@Controller
@RequestMapping("/mystery/China")
public class ChinaController extends BaseController {
	@Autowired
	private ChinaService chinaService;
}