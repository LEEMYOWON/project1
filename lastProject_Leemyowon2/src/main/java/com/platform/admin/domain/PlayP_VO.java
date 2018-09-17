package com.platform.admin.domain;

import java.util.Date;

public class PlayP_VO {
	
	private int playP_CD;
	private int game_CD;
	private int category_CD;
	private int player_CD;
	private int defenseP_CD;
	private Date date;
	private String pname;
	private String defenseP;
	private String tname;
	

	public PlayP_VO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPlayP_CD() {
		return playP_CD;
	}

	public PlayP_VO setPlayP_CD(int playP_CD) {
		this.playP_CD = playP_CD;
		return this;
	}

	public int getGame_CD() {
		return game_CD;
	}

	public PlayP_VO setGame_CD(int game_CD) {
		this.game_CD = game_CD;
		return this;
	}

	public int getCategory_CD() {
		return category_CD;
	}

	public PlayP_VO setCategory_CD(int category_CD) {
		this.category_CD = category_CD;
		return this;
	}

	public int getPlayer_CD() {
		return player_CD;
	}

	public PlayP_VO setPlayer_CD(int player_CD) {
		this.player_CD = player_CD;
		return this;
	}

	public int getDefenseP_CD() {
		return defenseP_CD;
	}

	public PlayP_VO setDefenseP_CD(int defenseP_CD) {
		this.defenseP_CD = defenseP_CD;
		return this;
	}	

	public Date getDate() {
		return date;
	}

	public PlayP_VO setDate(Date date) {
		this.date = date;
		return this;
	}

	public String getPname() {
		return pname;
	}

	public PlayP_VO setPname(String pname) {
		this.pname = pname;
		return this;
	}

	public String getDefenseP() {
		return defenseP;
	}

	public PlayP_VO setDefenseP(String defenseP) {
		this.defenseP = defenseP;
		return this;
	}

	public String getTname() {
		return tname;
	}

	public PlayP_VO setTname(String tname) {
		this.tname = tname;
		return this;
	}

	@Override
	public String toString() {
		return "PlayP_VO [playP_CD=" + playP_CD + ", game_CD=" + game_CD + ", category_CD=" + category_CD
				+ ", player_CD=" + player_CD + ", defenseP_CD=" + defenseP_CD + ", date=" + date + ", pname=" + pname
				+ ", defenseP=" + defenseP + ", tname=" + tname + "]";
	}



	
	
}
