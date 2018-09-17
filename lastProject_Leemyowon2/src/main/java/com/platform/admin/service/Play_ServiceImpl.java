package com.platform.admin.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.admin.domain.PlayH_VO;
import com.platform.admin.domain.PlayP_VO;
import com.platform.admin.persistence.PlayH_DAO;
import com.platform.admin.persistence.PlayP_DAO;

@Service
public class Play_ServiceImpl implements Play_Service {
	
	@Inject
	private PlayP_DAO playP_dao;
	
	@Inject
	private PlayH_DAO playH_dao;
	
	@Transactional
	@Override
	public void insert_playP(PlayP_VO vo) {
		try {
			playP_dao.insert_playP(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void insert_playH(PlayH_VO vo) {
		try {
			playH_dao.insert_playH(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public List<PlayP_VO> select_playP(int team_CD, String date) {
		List<PlayP_VO> list = null;
		try {
			list = playP_dao.select_playP(team_CD, date);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<PlayH_VO> select_playH(int team_CD, String date) {
		List<PlayH_VO> list = null;
		try {
			list = playH_dao.select_playH(team_CD, date);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	

}
