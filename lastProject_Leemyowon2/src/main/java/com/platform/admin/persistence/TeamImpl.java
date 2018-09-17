package com.platform.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.platform.admin.domain.TeamVO;

@Repository
public class TeamImpl implements TeamDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.platform.mapper.TeamMapper";

	public List<TeamVO> TeamList(Integer team_CD) throws Exception {
		List<TeamVO> list = session.selectList(namespace+".teamList");
		return list;
	}

}
