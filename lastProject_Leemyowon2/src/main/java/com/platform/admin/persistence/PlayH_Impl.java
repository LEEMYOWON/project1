package com.platform.admin.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.platform.admin.domain.PlayH_VO;

@Repository
public class PlayH_Impl implements PlayH_DAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.platform.mapper.playMapper";
	
	public void insert_playH(PlayH_VO vo) throws Exception {
		session.insert(namespace+".insert_playH", vo);
	}
	
	public List<PlayH_VO> select_playH(int team_CD, String date) throws Exception {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("team_CD", team_CD);
		hm.put("date", date);
		List<PlayH_VO> list = session.selectList(namespace+".select_playH", hm);
		return list;
	}

}
