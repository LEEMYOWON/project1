package com.platform.admin.domain;

import java.util.Date;

public class PlayH_VO {
	
	private int playH_CD;
	private int game_CD;
	private int category_CD;
	private int lineup;
	private int player_CD;
	private int defenseP_CD;
	private String pname;
	private String tname;
	private String defenseP;
	private Date date;
	private int team_CD;
	
	public PlayH_VO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPlayH_CD() {
		return playH_CD;
	}

	public PlayH_VO setPlayH_CD(int playH_CD) {
		this.playH_CD = playH_CD;
		return this;
	}

	public int getGame_CD() {
		return game_CD;
	}

	public PlayH_VO setGame_CD(int game_CD) {
		this.game_CD = game_CD;
		return this;
	}

	public int getCategory_CD() {
		return category_CD;
	}

	public PlayH_VO setCategory_CD(int category_CD) {
		this.category_CD = category_CD;
		return this;
	}

	public int getLineup() {
		return lineup;
	}

	public PlayH_VO setLineup(int lineup) {
		this.lineup = lineup;
		return this;
	}

	public int getPlayer_CD() {
		return player_CD;
	}

	public PlayH_VO setPlayer_CD(int player_CD) {
		this.player_CD = player_CD;
		return this;
	}

	public int getDefenseP_CD() {
		return defenseP_CD;
	}

	public PlayH_VO setDefenseP_CD(int defenseP_CD) {
		this.defenseP_CD = defenseP_CD;
		return this;
	}	

	public String getPname() {
		return pname;
	}

	public PlayH_VO setPname(String pname) {
		this.pname = pname;
		return this;
	}

	public String getTname() {
		return tname;
	}

	public PlayH_VO setTname(String tname) {
		this.tname = tname;
		return this;
	}

	public String getDefenseP() {
		return defenseP;
	}

	public PlayH_VO setDefenseP(String defenseP) {
		this.defenseP = defenseP;
		return this;
	}

	public Date getDate() {
		return date;
	}

	public PlayH_VO setDate(Date date) {
		this.date = date;
		return this;
	}
	

	public int getTeam_CD() {
		return team_CD;
	}

	public PlayH_VO setTeam_CD(int team_CD) {
		this.team_CD = team_CD;
		return this;
	}

	@Override
	public String toString() {
		return "PlayH_VO [playH_CD=" + playH_CD + ", game_CD=" + game_CD + ", category_CD=" + category_CD + ", lineup="
				+ lineup + ", player_CD=" + player_CD + ", defenseP_CD=" + defenseP_CD + ", pname=" + pname + ", tname="
				+ tname + ", defenseP=" + defenseP + ", date=" + date + ", team_CD=" + team_CD + "]";
	}
	
}
