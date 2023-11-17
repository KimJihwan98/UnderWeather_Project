package com.ssafy.ssafit.model.dto;

public class Product {
	private int pId;
	private String youtubeId;
	private long price;
	private String pUrl;
	private String userId;


	public Product() {
	}


	public Product(int pId, String youtubeId, long price, String pUrl, String userId) {
		super();
		this.pId = pId;
		this.youtubeId = youtubeId;
		this.price = price;
		this.pUrl = pUrl;
		this.userId = userId;
	}


	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
	}


	public String getYoutubeId() {
		return youtubeId;
	}


	public void setYoutubeId(String youtubeId) {
		this.youtubeId = youtubeId;
	}


	public long getPrice() {
		return price;
	}


	public void setPrice(long price) {
		this.price = price;
	}


	public String getpUrl() {
		return pUrl;
	}


	public void setpUrl(String pUrl) {
		this.pUrl = pUrl;
	}
	
	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "Product [pId=" + pId + ", youtubeId=" + youtubeId + ", price=" + price + ", pUrl=" + pUrl + ", userId="
				+ userId + "]";
	}
	
	
}	