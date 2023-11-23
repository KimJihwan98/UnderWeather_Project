package com.playlist.model.dto;

import java.util.Date;

public class Grass {
	private String gId;
	private String userId;
	private int index;
	private String title;
	private Object img;
	private String content;
	private String regDate;

	public Grass() {
	}

	public Grass(String gId, String userId, int index, String title, Object img, String content) {
		this.gId = gId;
		this.userId = userId;
		this.index = index;
		this.title = title;
		this.img = img;
		this.content = content;
		this.regDate = new Date().toString();
	}

	public String getgId() {
		return gId;
	}

	public void setgId(String gId) {
		this.gId = gId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getgIndex() {
		return index;
	}

	public void setgIndex(int gIndex) {
		this.index = gIndex;
	}

	public Object getImg() {
		return img;
	}

	public void setImg(Object img) {
		this.img = img;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
