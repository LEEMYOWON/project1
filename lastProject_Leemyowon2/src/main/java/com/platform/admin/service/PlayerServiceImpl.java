package com.platform.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.admin.domain.PlayerVO;
import com.platform.admin.persistence.PlayerDAO;

@Service
public class PlayerServiceImpl implements PlayerService {
	
	@Inject
	PlayerDAO playerDao;
	
	@Transactional
	@Override
	public List<PlayerVO> playerName(int defenseP, String tname){
		List<PlayerVO> list = null;
		try {
			list = playerDao.playerName(defenseP, tname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<PlayerVO> playerName_DH(String tname){
		List<PlayerVO> list = null;
		try {
			list = playerDao.playerName_DH(tname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
