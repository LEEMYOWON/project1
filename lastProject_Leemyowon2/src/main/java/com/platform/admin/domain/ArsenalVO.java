package com.platform.admin.domain;

public class ArsenalVO {

	private int arsenal_CD;
	private String paname;
	
	public ArsenalVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getArsenal_CD() {
		return arsenal_CD;
	}

	public ArsenalVO setArsenal_CD(int arsenal_CD) {
		this.arsenal_CD = arsenal_CD;
		return this;
	}

	public String getPaname() {
		return paname;
	}

	public ArsenalVO setPaname(String paname) {
		this.paname = paname;
		return this;
	}

	@Override
	public String toString() {
		return "ArsenalVO [arsenal_CD=" + arsenal_CD + ", paname=" + paname + "]";
	}
	
	
}
