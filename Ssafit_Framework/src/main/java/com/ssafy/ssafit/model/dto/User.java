package com.ssafy.ssafit.model.dto;

public class User {
    private String userId;
    private String name;
    private String password;
    private String preferSport;
    private String location;

    public User() {
    }

    public User(String userId, String name, String password) {
        this.userId = userId;
        this.name = name;
        this.password = password;
    }
    


	public User(String userId, String name, String password, String preferSport, String location) {
		this.userId = userId;
		this.name = name;
		this.password = password;
		this.preferSport = preferSport;
		this.location = location;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPreferSport() {
		return preferSport;
	}

	public void setPreferSport(String preferSport) {
		this.preferSport = preferSport;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
    
    
	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", password=" + password + ", preferSport=" + preferSport
				+ ", location=" + location + "]";
	}

    

}