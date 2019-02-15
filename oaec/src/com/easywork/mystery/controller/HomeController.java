package com.easywork.mystery.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.easycore.utils.BaseController;
import com.easycore.utils.MyHttpUtils;
import com.easywork.mystery.entity.Employee;
import com.easywork.mystery.rpc.MyService;

@Controller
@RequestMapping("/home")
public class HomeController extends BaseController {

	@Reference
	private MyService myService;

	@Autowired
	private StringRedisTemplate tpl;

	@RequestMapping("/rand")
	public void rand(HttpServletResponse resp) throws InterruptedException {
		while (true) {
			int val = new Random().nextInt(9000) + 1000;
			System.out.println(val);
			if (val >= 5000) {
				super.print(resp, val + "");
				break;
			}
			Thread.sleep(1000);
		}
	}

	@RequestMapping("/bkTime")
	@ResponseBody
	public String bkTime() {
		Date dt = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");
		return fmt.format(dt);
	}

	@RequestMapping("/view")
	public String view() {
		return "/mysteryx/view";
	}

	@RequestMapping("/openWork/{view}")
	public String openWork(@PathVariable("view") String view) {
		// return "/demo/" + view;
		return "/mysteryx/" + view;
	}

	@RequestMapping("/testDate.")
	@ResponseBody
	public String testDate(Date date) {
		System.out.println("date=" + date);
		return "success";
	}

	@RequestMapping("/test")
	@ResponseBody
	public int[] test(String cont_a, int value) {
		// 获得整型数组
		String[] sArr = cont_a.split(",");
		int[] arr = new int[sArr.length];
		for (int i = 0; i < sArr.length; i++) {
			arr[i] = Integer.parseInt(sArr[i]);
		}
		// 排序
		if (value == 1) {
			for (int i = 0; i < arr.length - 1; i++) {
				for (int j = 0; j < arr.length - 1 - i; j++) {
					if (arr[j] > arr[j + 1]) {
						int tmp = arr[j];
						arr[j] = arr[j + 1];
						arr[j + 1] = tmp;
					}
				}
				System.out.println(Arrays.toString(arr));
			}
		} else if (value == 2) {
			for (int i = 0; i < arr.length - 1; i++) {
				for (int j = 0; j < arr.length - 1 - i; j++) {
					if (arr[j] < arr[j + 1]) {
						int tmp = arr[j];
						arr[j] = arr[j + 1];
						arr[j + 1] = tmp;
					}
				}
				System.out.println(Arrays.toString(arr));
			}
		}
		// 响应
		return arr;
	}

	// redis试验
	@RequestMapping("/redis1")
	@ResponseBody
	public String redis1(String val) {
		ListOperations<String, String> ops = tpl.opsForList();
		ops.leftPush("company", val);
		return "success";
	}

	// 获取天气-显式http调用
	@RequestMapping("/weather")
	public void weather(String city, HttpServletResponse resp) {
		String url = "http://v.juhe.cn/weather/index?format=2&cityname=" + city
				+ "&key=0fa0fd7554ef4e5473de95cf4c51f27c";
		String res = MyHttpUtils.httpGetRequest(url);
		super.print(resp, res);
	}

	// 获取员工表-rpc式调用
	@RequestMapping("/showEmp")
	@ResponseBody
	public List<Employee> showEmp() {
		return myService.findHero();
	}

}