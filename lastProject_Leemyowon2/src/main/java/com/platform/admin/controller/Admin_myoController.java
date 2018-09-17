package com.platform.admin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.platform.admin.domain.ArsenalVO;
import com.platform.admin.domain.ContentsVO;
import com.platform.admin.domain.GameVO;
import com.platform.admin.domain.PlayH_VO;
import com.platform.admin.domain.PlayP_VO;
import com.platform.admin.domain.PlayerVO;
import com.platform.admin.domain.RecordVO;
import com.platform.admin.service.GameService;
import com.platform.admin.service.Play_Service;
import com.platform.admin.service.PlayerService;
import com.platform.admin.service.RecordService;

/**
 * Handles requests for the application home page.
 */
@Controller

public class Admin_myoController {

	@Inject
	GameService gameService;
	
	@Inject
	Play_Service play_service;
	
	@Inject
	PlayerService playerService;
	
	@Inject
	RecordService recordService;

	@RequestMapping("/")
	public String main() {
		return "admin_index";
	}

	@RequestMapping("/starting_info")
	public String starting_info() {
		return "sports/starting_info";
	}

	@RequestMapping("/schedule")
	public String schedule() {
		return "sports/play_schedule";
	}

	@RequestMapping("/record")
	public String record() {
		return "sports/play_record";
	}
	
	@RequestMapping("/read_record")
	public String read_record(Model model) {
		try {
			readRecord(model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "sports/read_record";
	}

	@RequestMapping(value = "/insert_schedule", method = RequestMethod.GET)
	public @ResponseBody boolean insert_schedule(int home1, int away1, Date date1, int home2, int away2, Date date2,
			int home3, int away3, Date date3, int home4, int away4, Date date4, int home5, int away5, Date date5) {

		Calendar cal = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		cal.setTime(date1);
		cal.add(Calendar.DATE, -1);		
		GameVO vo1 = new GameVO();
		vo1.setAway(away1).setHome(home1).setDate(cal.getTime());
		GameVO vo2 = new GameVO();
		vo2.setAway(away2).setHome(home2).setDate(cal.getTime());
		GameVO vo3 = new GameVO();
		vo3.setAway(away3).setHome(home3).setDate(cal.getTime());
		GameVO vo4 = new GameVO();
		vo4.setAway(away4).setHome(home4).setDate(cal.getTime());
		GameVO vo5 = new GameVO();
		vo5.setAway(away5).setHome(home5).setDate(cal.getTime());
		try {
			gameService.insert_schedule(vo1, vo2, vo3, vo4, vo5);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return true;
	}

	@RequestMapping(value = "/select_schedule", method = RequestMethod.GET)
	public @ResponseBody List<HashMap<String, Object>> select_schedule() throws Exception {
		
		Calendar cal = Calendar.getInstance();		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");		
		List<GameVO> list = gameService.select_schedule();
		ArrayList<HashMap<String, Object>> mapList = new ArrayList<>();		
		HashMap<String, Object> gmap;
		for (GameVO li : list) {
			gmap = new HashMap<>();
			// split을 이용하여 팀 이름 메인글자로 자르기
			gmap.put("title", li.getAwayName().split(" ")[0] + " VS " +li.getHomeName().split(" ")[0]);
			cal.setTime(li.getDate());
			cal.add(Calendar.DATE, +1);
			gmap.put("start", cal.getTime());

			mapList.add(gmap);
		}
		return mapList;
	}
	
	@RequestMapping(value = "select_startInfo", method = RequestMethod.GET)
	public @ResponseBody List<HashMap<String, Object>> select_startInfo(Date date) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		
		List<GameVO> list = gameService.select_startInfo(sdf.format(date));		
		ArrayList<HashMap<String, Object>> teamList = new ArrayList<>();
		HashMap<String, Object> teamMap;
		for (GameVO li : list) {
			teamMap = new HashMap<>();
			teamMap.put("away", li.getAwayName());
			teamMap.put("home", li.getHomeName());
			teamMap.put("awayTeam_CD", li.getAwayTeam_CD());
			teamMap.put("homeTeam_CD", li.getHomeTeam_CD());
			teamMap.put("game_CD", li.getGame_CD());
			teamList.add(teamMap);
		} System.out.println(teamList);
		return teamList;
 	}
	
	@RequestMapping(value = "/insert_playP", method = RequestMethod.GET)
	public @ResponseBody boolean insert_playP(String date, int category_CD, String tname, int player_CD, int defenseP_CD) throws Exception {
		PlayP_VO vo = new PlayP_VO();
		Date dateTemp = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		vo.setDate(dateTemp).setCategory_CD(category_CD).setTname(tname).setPlayer_CD(player_CD).setDefenseP_CD(defenseP_CD);
		play_service.insert_playP(vo);
		
		return true;
	}

	@RequestMapping(value = "/insert_playH", method = RequestMethod.POST)
	public @ResponseBody void insert_playH(String date, int category_CD, String tname, @RequestParam(value="lineup") int[] lineup,
			@RequestParam(value="player_CD") int[] player_CD, @RequestParam(value="defenseP_CD") int[] defenseP_CD) throws Exception {
		System.out.println(date);
		Date dateTemp = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		PlayH_VO vo = new PlayH_VO();
		for(int i = 0; i < lineup.length; i++) {
			vo.setDate(dateTemp).setCategory_CD(category_CD).setTname(tname).setLineup(lineup[i]).setPlayer_CD(player_CD[i])
			.setDefenseP_CD(defenseP_CD[i]);
			play_service.insert_playH(vo);
		}
	}
	
	@RequestMapping(value = "playerName", method = RequestMethod.POST)
	public @ResponseBody List<PlayerVO> playerName(int defenseP, String tname) throws Exception {
		List<PlayerVO> list = null;
		if(defenseP == 10) {
			list = playerService.playerName_DH(tname);
		} else {
			list = playerService.playerName(defenseP, tname);
		}
		return list;
	}
	
	@RequestMapping(value = "/select_playP", method = RequestMethod.GET)
	public @ResponseBody List<PlayP_VO> select_playP(int team_CD, String date) {
		List<PlayP_VO> list = null;
		try {
			list = play_service.select_playP(team_CD, date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@RequestMapping(value = "select_playH", method = RequestMethod.GET)
	public @ResponseBody List<PlayH_VO> select_playH(int team_CD, String date) {
		List<PlayH_VO> list = null;
		try {
			list = play_service.select_playH(team_CD, date);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return list;
	}
	
	@RequestMapping(value = "selectArsenal", method = RequestMethod.GET)
	public @ResponseBody List<ArsenalVO> selectArsenal(){
		List<ArsenalVO> list = null;
		try {
			list = recordService.selectArsenal();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@RequestMapping(value = "selectContents", method = RequestMethod.GET)
	public @ResponseBody List<ContentsVO> selectContents(){
		List<ContentsVO> list = null;
		try {
			list = recordService.selectContents();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return list;
	}
	
	// 기록 insert
	
	/*
	@RequestMapping(value = "insertRecord", method = RequestMethod.POST)
	public @ResponseBody void insertRecord(int game_CD, int inning, int score, int rbi, int pitcher, int hitter, int[] pitching, int[] hitting, int[] arsenal_CD, int[] ballSpeed) {
		RecordVO vo = new RecordVO();
//		vo.setGame_CD(game_CD).setInning(inning).setScore(score).setRbi(rbi).setPitcher(pitcher).setHitter(hitter).setPitching(pitching).setHitting(hitting).setArsenal_CD(arsenal_CD).setBallSpeed(ballSpeed);
		try {
			recordService.insertRecord(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	*/
	
	@RequestMapping(value = "insertRecord", method = RequestMethod.POST)
	public @ResponseBody void insertRecord(@RequestParam(value = "ballSpeed") ArrayList<Integer> ballSpeed
			,@RequestParam(value = "arsenal_CD") ArrayList<Integer> arsenal_CD, @RequestParam(value = "contents_CD") ArrayList<Integer> contents_CD
			,@RequestParam(value = "rbi") int rbi, @RequestParam(value = "inning") int inning, @RequestParam(value = "playP") int playP_CD
			, @RequestParam(value = "awayplayH") int playH_CD, @RequestParam(value = "game_CD") int game_CD) {
		System.out.println("ballSpeed ==================>"+ballSpeed);
		System.out.println("arsenal_CD ==================>"+arsenal_CD);
		System.out.println("contents_CD ==================>"+contents_CD);
		System.out.println("rbi ==================>"+rbi);
		System.out.println("inning ==================>"+inning);
		System.out.println("playP ==================>"+playP_CD);
		System.out.println("playH ==================>"+playH_CD);
		System.out.println("game_CD ==================>"+game_CD);
		
		for(int i = 0; i < arsenal_CD.size(); i++) {
			
			RecordVO vo = new RecordVO();
			vo.setGame_CD(game_CD).setInning(inning).setRbi(rbi).setPitcher(playP_CD).setHitter(playH_CD).setPitching(contents_CD.get(i)).setHitting(contents_CD.get(i)).setArsenal_CD(arsenal_CD.get(i)).setBallSpeed(ballSpeed.get(i));
			try {
				recordService.insertRecord(vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public void readRecord(Model model) throws Exception {
		List<RecordVO> list = recordService.readRecord();
		model.addAttribute("todayRecord", list);
		System.out.println(list);
	}
	
}
