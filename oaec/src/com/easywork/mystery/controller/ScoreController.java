package com.easywork.mystery.controller;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easycore.utils.BaseController;
import com.easywork.mystery.entity.Score;
import com.easywork.mystery.entity.Student;
import com.easywork.mystery.service.ScoreService;

@Controller
@RequestMapping("/mystery/Score")
public class ScoreController extends BaseController {
	@Autowired
	private ScoreService scoreService;

	@RequestMapping("/toDetail/{stuid}")
	public String toDetail(@PathVariable("stuid") String stuid, Model model) {
		model.addAttribute("scores", scoreService.findById(Integer.parseInt(stuid)));
		return "/mysteryx/scores";
	}

	@RequestMapping("/findById")
	@ResponseBody
	public List<Score> findByCond(int id) {
		return scoreService.findById(id);
	}
}