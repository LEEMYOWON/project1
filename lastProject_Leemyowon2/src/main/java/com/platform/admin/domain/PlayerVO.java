package com.platform.admin.domain;

import java.util.Date;

public class PlayerVO {
	
	private int player_CD;
	private int back_number;
	private String pname;
	private int team_CD;
	private int position_CD;
	private int pnh_CD;
	private Date pbirth;
	private int height;
	private int weight;
	private int nation_CD;
	private String tname;
	private String position;
	private String pnh;
	
	public PlayerVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPlayer_CD() {
		return player_CD;
	}

	public PlayerVO setPlayer_CD(int player_CD) {
		this.player_CD = player_CD;
		return this;
	}

	public int getBack_number() {
		return back_number;
	}

	public PlayerVO setBack_number(int back_number) {
		this.back_number = back_number;
		return this;
	}

	public String getPname() {
		return pname;
	}

	public PlayerVO setPname(String pname) {
		this.pname = pname;
		return this;
	}

	public int getTeam_CD() {
		return team_CD;
	}

	public PlayerVO setTeam_CD(int team_CD) {
		this.team_CD = team_CD;
		return this;
	}

	public int getPosition_CD() {
		return position_CD;
	}

	public PlayerVO setPosition_CD(int position_CD) {
		this.position_CD = position_CD;
		return this;
	}

	public int getPnh_CD() {
		return pnh_CD;
	}

	public PlayerVO setPnh_CD(int pnh_CD) {
		this.pnh_CD = pnh_CD;
		return this;
	}

	public Date getPbirth() {
		return pbirth;
	}

	public PlayerVO setPbirth(Date pbirth) {
		this.pbirth = pbirth;
		return this;
	}

	public int getHeight() {
		return height;
	}

	public PlayerVO setHeight(int height) {
		this.height = height;
		return this;
	}

	public int getWeight() {
		return weight;
	}

	public PlayerVO setWeight(int weight) {
		this.weight = weight;
		return this;
	}

	public int getNation_CD() {
		return nation_CD;
	}

	public PlayerVO setNation_CD(int nation_CD) {
		this.nation_CD = nation_CD;
		return this;
	}

	public String getTname() {
		return tname;
	}

	public PlayerVO setTname(String tname) {
		this.tname = tname;
		return this;
	}

	public String getPosition() {
		return position;
	}

	public PlayerVO setPosition(String position) {
		this.position = position;
		return this;
	}

	public String getPnh() {
		return pnh;
	}

	public PlayerVO setPnh(String pnh) {
		this.pnh = pnh;
		return this;
	}

	@Override
	public String toString() {
		return "PlayerVO [player_CD=" + player_CD + ", back_number=" + back_number + ", pname=" + pname + ", team_CD="
				+ team_CD + ", position_CD=" + position_CD + ", pnh_CD=" + pnh_CD + ", pbirth=" + pbirth + ", height="
				+ height + ", weight=" + weight + ", nation_CD=" + nation_CD + ", tname=" + tname + ", position="
				+ position + ", pnh=" + pnh + "]";
	}
	
	
	
	
	
	
}
