package com.platform.sports.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.platform.admin.domain.GameVO;

@Repository
public class ClientGameImpl implements ClientGameDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.platform.mapper.GameMapper";
	
	@Override
	public List<GameVO> todayGames() throws Exception {
		List<GameVO> list = session.selectList(namespace+".todayGames");
		return list;
	}

}
