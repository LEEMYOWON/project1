package com.platform.admin.domain;

import java.util.Date;

public class GameVO {

	private int game_CD;
	private int home;
	private int away;
	private String homeName;
	private String awayName;
	private Date date;
	private boolean result;
	private boolean place;
	private Date playstart;
	private Date playfinish;
	private int homeTeam_CD;
	private int awayTeam_CD;
	
	public GameVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getGame_CD() {
		return game_CD;
	}

	public GameVO setGame_CD(int game_CD) {
		this.game_CD = game_CD;
		return this;
	}

	public int getHome() {
		return home;
	}

	public GameVO setHome(int home) {
		this.home = home;
		return this;
	}

	public int getAway() {
		return away;
	}

	public GameVO setAway(int away) {
		this.away = away;
		return this;
	}

	public String getHomeName() {
		return homeName;
	}

	public GameVO setHomeName(String homeName) {
		this.homeName = homeName;
		return this;
	}

	public String getAwayName() {
		return awayName;
	}

	public GameVO setAwayName(String awayName) {
		this.awayName = awayName;
		return this;
	}

	public Date getDate() {
		return date;
	}

	public GameVO setDate(Date date) {
		this.date = date;
		return this;
	}

	public boolean isResult() {
		return result;
	}

	public GameVO setResult(boolean result) {
		this.result = result;
		return this;
	}

	public boolean isPlace() {
		return place;
	}

	public GameVO setPlace(boolean place) {
		this.place = place;
		return this;
	}

	public Date getPlaystart() {
		return playstart;
	}

	public GameVO setPlaystart(Date playstart) {
		this.playstart = playstart;
		return this;
	}

	public Date getPlayfinish() {
		return playfinish;
	}

	public GameVO setPlayfinish(Date playfinish) {
		this.playfinish = playfinish;
		return this;
	}
	
	public int getHomeTeam_CD() {
		return homeTeam_CD;
	}

	public GameVO setHomeTeam_CD(int homeTeam_CD) {
		this.homeTeam_CD = homeTeam_CD;
		return this;
	}

	public int getAwayTeam_CD() {
		return awayTeam_CD;
	}

	public GameVO setAwayTeam_CD(int awayTeam_CD) {
		this.awayTeam_CD = awayTeam_CD;
		return this;
	}

	@Override
	public String toString() {
		return "GameVO [game_CD=" + game_CD + ", home=" + home + ", away=" + away + ", homeName=" + homeName
				+ ", awayName=" + awayName + ", date=" + date + ", result=" + result + ", place=" + place
				+ ", playstart=" + playstart + ", playfinish=" + playfinish + ", homeTeam_CD=" + homeTeam_CD
				+ ", awayTeam_CD=" + awayTeam_CD + "]";
	}

}
