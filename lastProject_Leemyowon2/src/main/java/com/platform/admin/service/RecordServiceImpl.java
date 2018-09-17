package com.platform.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.admin.domain.ArsenalVO;
import com.platform.admin.domain.ContentsVO;
import com.platform.admin.domain.RecordVO;
import com.platform.admin.persistence.RecordDAO;

@Service
public class RecordServiceImpl implements RecordService {
	
	@Inject
	private RecordDAO recordDAO;
	
	@Transactional
	@Override
	public List<ArsenalVO> selectArsenal() throws Exception {
		List<ArsenalVO> list = null;
		list = recordDAO.selectArsenal();
		return list;
	}
	
	@Override
	public List<ContentsVO> selectContents() throws Exception {
		List<ContentsVO> list = null;
		list = recordDAO.selectContents();
		return list;
	}
	
	@Override
	public void insertRecord(RecordVO vo) throws Exception {
		recordDAO.insertRecord(vo);
	}

	@Override
	public List<RecordVO> readRecord() throws Exception {
		List<RecordVO> list = null;
		list = recordDAO.readRecord();
		System.out.println("service list============>"+list);
		return list;
	}
	

}
