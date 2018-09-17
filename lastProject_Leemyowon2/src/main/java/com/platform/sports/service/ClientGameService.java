package com.platform.sports.service;

import java.util.List;

import com.platform.admin.domain.GameVO;

public interface ClientGameService {
	
	public List<GameVO> todayGames() throws Exception; 

}
