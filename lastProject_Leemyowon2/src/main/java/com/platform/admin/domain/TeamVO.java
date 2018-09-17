package com.platform.admin.domain;

public class TeamVO {
	
	private int team_CD;
	private String tname;
	private String logo;
	private int hometown;
	private String bnumber;
	private String tel;
	private int main;
	private int sub;
	
	public TeamVO() {
		super();
		
	}

	public TeamVO(int team_CD, String tname, String logo, int hometown, String bnumber, String tel, int main, int sub) {
		super();
		this.team_CD = team_CD;
		this.tname = tname;
		this.logo = logo;
		this.hometown = hometown;
		this.bnumber = bnumber;
		this.tel = tel;
		this.main = main;
		this.sub = sub;
	}

	public int getTeam_CD() {
		return team_CD;
	}

	public void setTeam_CD(int team_CD) {
		this.team_CD = team_CD;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public int getHometown() {
		return hometown;
	}

	public void setHometown(int hometown) {
		this.hometown = hometown;
	}

	public String getBnumber() {
		return bnumber;
	}

	public void setBnumber(String bnumber) {
		this.bnumber = bnumber;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getMain() {
		return main;
	}

	public void setMain(int main) {
		this.main = main;
	}

	public int getSub() {
		return sub;
	}

	public void setSub(int sub) {
		this.sub = sub;
	}

	@Override
	public String toString() {
		return "TeamVO [team_CD=" + team_CD + ", tname=" + tname + ", logo=" + logo + ", hometown=" + hometown
				+ ", bnumber=" + bnumber + ", tel=" + tel + ", main=" + main + ", sub=" + sub + "]";
	}
	
	
	
	
	

}
