package com.platform.admin.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.admin.domain.GameVO;
import com.platform.admin.persistence.GameDAO;

@Service
public class GameServiceImpl implements GameService {
	
	@Inject
	private GameDAO gameDAO;
	
	@Transactional
	@Override
	public void insert_schedule(GameVO vo1, GameVO vo2, GameVO vo3, GameVO vo4, GameVO vo5) {
		try {
			gameDAO.insert_schedule(vo1);
			gameDAO.insert_schedule(vo2);
			gameDAO.insert_schedule(vo3);
			gameDAO.insert_schedule(vo4);
			gameDAO.insert_schedule(vo5);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public List<GameVO> select_schedule(){
		List<GameVO> list = null;
		
		try {
			list = gameDAO.select_schedule();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<GameVO> select_startInfo(String date){
		List<GameVO> list = null;
		try {
			list = gameDAO.select_startInfo(date);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	

}
