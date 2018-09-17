package com.platform.admin.persistence;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.platform.admin.domain.GameVO;

public interface GameDAO {
	
	public void insert_schedule(GameVO vo) throws Exception;
	public List<GameVO> select_schedule() throws Exception;
	public List<GameVO> select_startInfo(String date) throws Exception;

}
