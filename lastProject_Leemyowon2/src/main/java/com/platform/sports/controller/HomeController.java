package com.platform.sports.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.platform.admin.domain.GameVO;
import com.platform.admin.domain.RecordVO;
import com.platform.admin.service.GameService;
import com.platform.admin.service.RecordService;
import com.platform.sports.service.ClientGameService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	ClientGameService clientgameservice;
	
	
	@RequestMapping("/main")
	public String main(Model model) throws Exception {
		todayGames(model);
		return "index";
	}
	
	@RequestMapping("/schedule")
	public String schedule(Model model) throws Exception {
		todayGames(model);
		return "schedule";
	}
	
	@RequestMapping("/player_info")
	public String player_info(Model model) throws Exception {
		todayGames(model);
		return "player_info";
	}
	
	@RequestMapping("/pitching_Record")
	public String pitching_Record(Model model) throws Exception {
		todayGames(model);
		return "pitching_Record";
	}
	
	@RequestMapping("/hitting_Record")
	public String hitting_Record(Model model) throws Exception {
		return "hitting_Record";
	}
	
	@RequestMapping("/login")
	public String login(Model model) throws Exception {
		todayGames(model);
		return "login/login";
	}
	
	@RequestMapping("/analysis")
	public String analysis(Model model) throws Exception {
		todayGames(model);
		return "analysis";
	}
	
	@RequestMapping("/admin")
	public String SMIN(Model model) throws Exception {
		todayGames(model);
		return "../admin/index";
	}
	
	@RequestMapping("/playrecord")
	public String playRecord(Model model) throws Exception {
		todayGames(model);
		return "playRecord";
	}	
	
	public void todayGames(Model model) throws Exception {
		List<GameVO> list = clientgameservice.todayGames();		
		model.addAttribute("teamList", list);
	}
	
	
	
	
}
