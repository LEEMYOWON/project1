package com.platform.admin.service;

import java.util.Date;
import java.util.List;

import com.platform.admin.domain.PlayH_VO;
import com.platform.admin.domain.PlayP_VO;

public interface Play_Service {
	
	public void insert_playP(PlayP_VO vo) throws Exception;
	public void insert_playH(PlayH_VO vo) throws Exception;
	public List<PlayP_VO> select_playP(int team_CD, String date) throws Exception;
	public List<PlayH_VO> select_playH(int team_CD, String date) throws Exception;

}
