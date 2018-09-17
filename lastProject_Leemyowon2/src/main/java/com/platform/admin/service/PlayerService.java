package com.platform.admin.service;

import java.util.List;

import com.platform.admin.domain.PlayerVO;

public interface PlayerService {
	
	public List<PlayerVO> playerName(int defenseP, String tname) throws Exception;
	public List<PlayerVO> playerName_DH(String tname) throws Exception;
}
