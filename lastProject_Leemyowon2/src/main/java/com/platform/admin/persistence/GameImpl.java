package com.platform.admin.persistence;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.platform.admin.domain.GameVO;

@Repository
public class GameImpl implements GameDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.platform.mapper.GameMapper";
	
	@Override
	public void insert_schedule(GameVO vo) throws Exception{
		session.insert(namespace+".insert_schedule", vo);
	}
	
	@Override
	public List<GameVO> select_schedule() throws Exception{
		List<GameVO> list = session.selectList(namespace+".select_schedule");				
		return list;
	}
	
	@Override
	public List<GameVO> select_startInfo(String date) throws Exception{
		List<GameVO> list = session.selectList(namespace+".select_startInfo", date);
		return list;
	}

}
