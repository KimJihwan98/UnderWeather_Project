package com.playlist.model.dto;

public class Singer {
	private int sId;
	private String sName;
	private String genre;


	public Singer() {
	}


	public Singer(int sId, String sName, String genre) {
		super();
		this.sId = sId;
		this.sName = sName;
		this.genre = genre;
	}


	public int getsId() {
		return sId;
	}


	public void setsId(int sId) {
		this.sId = sId;
	}


	public String getsName() {
		return sName;
	}


	public void setsName(String sName) {
		this.sName = sName;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	@Override
	public String toString() {
		return "Singer [sId=" + sId + ", sName=" + sName + ", genre=" + genre + "]";
	}


	
	
}	