package com.playlist.model.dto;

public class Video {
	
	private String youtubeId;
	private String title;
	private String channelName;
	private String url;
	private String genre;
	private String weather;
	private int viewCnt;
	
	public Video() {}
	
	public Video(String youtubeId, String title, String channelName, String url, String genre, String weather,
			int viewCnt) {
		this.youtubeId = youtubeId;
		this.title = title;
		this.channelName = channelName;
		this.url = url;
		this.genre = genre;
		this.weather = weather;
		this.viewCnt = viewCnt;
	}
	public String getYoutubeId() {
		return youtubeId;
	}
	public void setYoutubeId(String youtubeId) {
		this.youtubeId = youtubeId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	@Override
	public String toString() {
		return "Video [youtubeId=" + youtubeId + ", title=" + title + ", channelName=" + channelName + ", url=" + url
				+ ", genre=" + genre + ", weather=" + weather + ", viewCnt=" + viewCnt + "]";
	}
	
	
	
	
}

