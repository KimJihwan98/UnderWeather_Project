package com.playlist.model.dto;


public class Sport {
	private String spName;
	private Object spImg;

	public Sport() {
	}

	public Sport(String spName, Object spImg) {
		super();
		this.spName = spName;
		this.spImg = spImg;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public Object getSpImg() {
		return spImg;
	}

	public void setSpImg(Object spImg) {
		this.spImg = spImg;
	}

	@Override
	public String toString() {
		return "Sport [spName=" + spName + ", spImg=" + spImg + "]";
	}

	
}
