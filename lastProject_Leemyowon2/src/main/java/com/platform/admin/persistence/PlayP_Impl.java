package com.platform.admin.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.platform.admin.domain.PlayP_VO;

@Repository
public class PlayP_Impl implements PlayP_DAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.platform.mapper.playMapper";
	
	@Override
	public void insert_playP(PlayP_VO vo) throws Exception{
		session.insert(namespace+".insert_playP", vo);
	}
	
	@Override
	public List<PlayP_VO> select_playP(int team_CD, String date) throws Exception {
		HashMap<String, Object> hm =  new HashMap<>();
		hm.put("team_CD", team_CD);
		hm.put("date", date); 		
		List<PlayP_VO> list = session.selectList(namespace+".select_playP", hm);
		return list;	
	}
	

}
