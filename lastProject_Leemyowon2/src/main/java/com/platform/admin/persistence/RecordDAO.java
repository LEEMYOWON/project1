package com.platform.admin.persistence;

import java.util.List;

import com.platform.admin.domain.ArsenalVO;
import com.platform.admin.domain.ContentsVO;
import com.platform.admin.domain.RecordVO;

public interface RecordDAO {

	public List<ArsenalVO> selectArsenal() throws Exception;
	public List<ContentsVO> selectContents() throws Exception; 
	public void insertRecord(RecordVO vo) throws Exception;
	public List<RecordVO> readRecord() throws Exception;
	
}
