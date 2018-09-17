package com.platform.admin.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RecordVO {
	
	private int record_CD;
	private int game_CD;
	private int inning;
	private int score;
	private int rbi;
	private int pitcher;
	private int hitter;
	private int pitching;
	private int hitting;
	private int miss_CD;
	private int arsenal_CD;
	private int ballSpeed;
	private String pitcherName;
	private String hitterName;
	private ArrayList<Integer> pitchingList;
	private ArrayList<Integer> hittingList;
	private ArrayList<Integer> arsenalList;
	private ArrayList<Integer> ballSpeedList;
	private Date date;
	private String paname;
	private String contents;
	private String awayName;
	private String homeName;
	
	public int getRbi() {
		return rbi;
	}

	public RecordVO setRbi(int rbi) {
		this.rbi = rbi;
		return this;
	}

	public int getArsenal_CD() {
		return arsenal_CD;
	}

	public RecordVO setArsenal_CD(int arsenal_CD) {
		this.arsenal_CD = arsenal_CD;
		return this;
	}

	public int getBallSpeed() {
		return ballSpeed;
	}

	public RecordVO setBallSpeed(int ballSpeed) {
		this.ballSpeed = ballSpeed;
		return this;
	}

	public RecordVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getRecord_CD() {
		return record_CD;
	}

	public RecordVO setRecord_CD(int record_CD) {
		this.record_CD = record_CD;
		return this;
	}

	public int getGame_CD() {
		return game_CD;
	}

	public RecordVO setGame_CD(int game_CD) {
		this.game_CD = game_CD;
		return this;
	}

	public int getInning() {
		return inning;
	}

	public RecordVO setInning(int inning) {
		this.inning = inning;
		return this;
	}

	public int getScore() {
		return score;
	}

	public RecordVO setScore(int score) {
		this.score = score;
		return this;
	}

	public int getPitcher() {
		return pitcher;
	}

	public RecordVO setPitcher(int pitcher) {
		this.pitcher = pitcher;
		return this;
	}

	public int getHitter() {
		return hitter;
	}

	public RecordVO setHitter(int hitter) {
		this.hitter = hitter;
		return this;
	}

	public int getPitching() {
		return pitching;
	}

	public RecordVO setPitching(int pitching) {
		this.pitching = pitching;
		return this;
	}

	public int getHitting() {
		return hitting;
	}

	public RecordVO setHitting(int hitting) {
		this.hitting = hitting;
		return this;
	}


	public int getMiss_CD() {
		return miss_CD;
	}

	public RecordVO setMiss_CD(int miss_CD) {
		this.miss_CD = miss_CD;
		return this;
	}
	

	public ArrayList<Integer> getPitchingList() {
		return pitchingList;
	}

	public RecordVO setPitchingList(ArrayList<Integer> pitchingList) {
		this.pitchingList = pitchingList;
		return this;
	}

	public ArrayList<Integer> getHittingList() {
		return hittingList;
	}

	public RecordVO setHittingList(ArrayList<Integer> hittingList) {
		this.hittingList = hittingList;
		return this;
	}

	public ArrayList<Integer> getArsenalList() {
		return arsenalList;
	}

	public RecordVO setArsenalList(ArrayList<Integer> arsenalList) {
		this.arsenalList = arsenalList;
		return this;
	}

	public ArrayList<Integer> getBallSpeedList() {
		return ballSpeedList;
	}

	public RecordVO setBallSpeedList(ArrayList<Integer> ballSpeedList) {
		this.ballSpeedList = ballSpeedList;
		return this;
	}
	

	public String getPitcherName() {
		return pitcherName;
	}

	public RecordVO setPitcherName(String pitcherName) {
		this.pitcherName = pitcherName;
		return this;
	}

	public String getHitterName() {
		return hitterName;
	}

	public RecordVO setHitterName(String hitterName) {
		this.hitterName = hitterName;
		return this;
	}

	public Date getDate() {
		return date;
	}

	public RecordVO setDate(Date date) {
		this.date = date;
		return this;
	}
	

	public String getPaname() {
		return paname;
	}

	public RecordVO setPaname(String paname) {
		this.paname = paname;
		return this;
	}
	

	public String getContents() {
		return contents;
	}

	public RecordVO setContents(String contents) {
		this.contents = contents;
		return this;
	}

	public String getAwayName() {
		return awayName;
	}

	public RecordVO setAwayName(String awayName) {
		this.awayName = awayName;
		return this;
	}

	public String getHomeName() {
		return homeName;
	}

	public RecordVO setHomeName(String homeName) {
		this.homeName = homeName;
		return this;
	}

	@Override
	public String toString() {
		return "RecordVO [record_CD=" + record_CD + ", game_CD=" + game_CD + ", inning=" + inning + ", score=" + score
				+ ", rbi=" + rbi + ", pitcher=" + pitcher + ", hitter=" + hitter + ", pitching=" + pitching
				+ ", hitting=" + hitting + ", miss_CD=" + miss_CD + ", arsenal_CD=" + arsenal_CD + ", ballSpeed="
				+ ballSpeed + ", pitcherName=" + pitcherName + ", hitterName=" + hitterName + ", pitchingList="
				+ pitchingList + ", hittingList=" + hittingList + ", arsenalList=" + arsenalList + ", ballSpeedList="
				+ ballSpeedList + ", date=" + date + ", paname=" + paname + ", contents=" + contents + ", awayName="
				+ awayName + ", homeName=" + homeName + "]";
	}



}
