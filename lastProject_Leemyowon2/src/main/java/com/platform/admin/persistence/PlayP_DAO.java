package com.platform.admin.persistence;

import java.util.Date;
import java.util.List;

import com.platform.admin.domain.PlayP_VO;

public interface PlayP_DAO {
	
	public void insert_playP(PlayP_VO vo) throws Exception;
	public List<PlayP_VO> select_playP(int team_CD, String date) throws Exception;

}
