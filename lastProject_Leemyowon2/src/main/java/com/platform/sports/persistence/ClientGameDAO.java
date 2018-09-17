package com.platform.sports.persistence;

import java.util.List;

import com.platform.admin.domain.GameVO;

public interface ClientGameDAO {
	
	public List<GameVO> todayGames() throws Exception;

}
