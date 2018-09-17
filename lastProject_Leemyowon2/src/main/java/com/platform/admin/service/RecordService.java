package com.platform.admin.service;

import java.util.List;

import com.platform.admin.domain.ArsenalVO;
import com.platform.admin.domain.ContentsVO;
import com.platform.admin.domain.RecordVO;

public interface RecordService {
	
	public List<ArsenalVO> selectArsenal() throws Exception;
	public List<ContentsVO> selectContents() throws Exception;
	public void insertRecord(RecordVO vo) throws Exception;
	public List<RecordVO> readRecord() throws Exception;

}
