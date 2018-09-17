package com.platform.admin.persistence;

import java.util.Date;
import java.util.List;

import com.platform.admin.domain.PlayH_VO;

public interface PlayH_DAO {
	
	public void insert_playH(PlayH_VO vo) throws Exception;
	public List<PlayH_VO> select_playH(int team_CD, String date) throws Exception;
}
