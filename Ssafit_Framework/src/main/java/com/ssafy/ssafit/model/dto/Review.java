package com.ssafy.ssafit.model.dto;

import java.util.Date;

public class Review {
	private static int no = 1; //클래스 변수
	private int rId;
	private String title;
	private String userId;
	private String content;
	private String regDate;
	private String youtubeId;
	private int viewCnt;

	public Review() {
	}

	public Review(String title, String writer, String content, String youtubeId) {
		super();
		this.rId = no++;
		this.title = title;
		this.userId = writer;
		this.content = content;
		this.youtubeId = youtubeId;
		this.regDate = new Date().toString();
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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
	
	public String getYoutubeId() {
		return youtubeId;
	}

	public void setYoutubeId(String youtubeId) {
		this.youtubeId = youtubeId;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "Review [rId=" + rId + ", title=" + title + ", writer=" + userId + ", content=" + content + ", regDate="
				+ regDate + ", viewCnt=" + viewCnt + "]";
	}
}
