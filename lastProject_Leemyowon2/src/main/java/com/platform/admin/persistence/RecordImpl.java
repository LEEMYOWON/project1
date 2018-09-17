package com.platform.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.platform.admin.domain.ArsenalVO;
import com.platform.admin.domain.ContentsVO;
import com.platform.admin.domain.RecordVO;

@Repository
public class RecordImpl implements RecordDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.platform.mapper.recordMapper";
	
	@Override
	public List<ArsenalVO> selectArsenal() throws Exception {
		List<ArsenalVO> list = session.selectList(namespace+".selectArsenal");
		return list;
	}
	
	@Override
	public List<ContentsVO> selectContents() throws Exception {
		List<ContentsVO> list = session.selectList(namespace+".selectContents");
		return list;
	}
	
	@Override
	public void insertRecord(RecordVO vo) throws Exception {
		session.insert(namespace+".insertRecord", vo);
	}
	
	@Override
	public List<RecordVO> readRecord() throws Exception {
		List<RecordVO> list = session.selectList(namespace+".readRecord");
		System.out.println("impl list=============>"+list);
		return list;
	}
}
