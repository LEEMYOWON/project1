package com.platform.admin.persistence;

import java.util.List;

import com.platform.admin.domain.TeamVO;


public interface TeamDAO {
	
	public List<TeamVO> TeamList(Integer team_CD) throws Exception;

}
