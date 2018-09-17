package com.platform.sports.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.admin.domain.GameVO;
import com.platform.sports.persistence.ClientGameDAO;

@Service
public class ClientGameServiceImpl implements ClientGameService {
	
	@Inject
	private ClientGameDAO clientgamedao;
	
	@Transactional
	@Override
	public List<GameVO> todayGames() throws Exception {
		List<GameVO> list = null;
		list = clientgamedao.todayGames();
		return list;
	}

}
