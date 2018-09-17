package com.platform.admin.service;

import java.util.Date;
import java.util.List;

import com.platform.admin.domain.GameVO;

public interface GameService {
	
	public void insert_schedule(GameVO vo1, GameVO vo2, GameVO vo3, GameVO vo4, GameVO vo5) throws Exception;
	public List<GameVO> select_schedule() throws Exception;
	public List<GameVO> select_startInfo(String date) throws Exception;

}
