package com.platform.admin.domain;

public class ContentsVO {
	
	private int contents_CD;
	private String contents;
	
	public ContentsVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getContents_CD() {
		return contents_CD;
	}

	public ContentsVO setContents_CD(int contents_CD) {
		this.contents_CD = contents_CD;
		return this;
	}

	public String getContents() {
		return contents;
	}

	public ContentsVO setContents(String contents) {
		this.contents = contents;
		return this;
	}

	@Override
	public String toString() {
		return "ContentsVO [contents_CD=" + contents_CD + ", contents=" + contents + "]";
	}
	
	
	
	
	
	
}
