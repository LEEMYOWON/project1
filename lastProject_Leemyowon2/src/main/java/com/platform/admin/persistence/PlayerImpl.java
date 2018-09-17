package com.platform.admin.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.platform.admin.domain.PlayerVO;

@Repository
public class PlayerImpl implements PlayerDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.platform.mapper.playerMapper";
	
	@Override
	public List<PlayerVO> playerName(int defenseP, String tname) throws Exception {
		HashMap<String, Object> hsmap = new HashMap<>();
				hsmap.put("defenseP", defenseP);
				hsmap.put("tname", tname);
		List<PlayerVO> list = session.selectList(namespace+".playerName", hsmap);
		return list;
	}
	
	@Override
	public List<PlayerVO> playerName_DH(String tname) throws Exception {
		List<PlayerVO> list = session.selectList(namespace+".playerName_DH", tname);
		return list;
	}

}
