package com.easywork.mystery.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easycore.utils.BaseController;

@Controller
@RequestMapping("/push")
public class PushController extends BaseController {

	@RequestMapping("/sendMsg")
	public void sendMsg(String msg, HttpServletRequest req, HttpServletResponse resp) {
		super.saveToAppList(req, String.class, "chat", msg, 200);
		super.print(resp, "success");
	}

	@RequestMapping("/showMsg")
	@ResponseBody
	public List<String> showMsg(HttpServletRequest req) {
		return super.getAppList(req, String.class, "chat");
	}
}
