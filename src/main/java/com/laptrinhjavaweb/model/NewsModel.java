package com.laptrinhjavaweb.model;

public class NewsModel extends AbstractModel {
	private String title;
	private String thumbnail;
	private String shortdescription;
	private String content;
	private Long categoryid;
	public NewsModel(String title, String thumbnail, String shortdescription, String content, Long categoryid) {
		super();
		this.title = title;
		this.thumbnail = thumbnail;
		this.shortdescription = shortdescription;
		this.content = content;
		this.categoryid = categoryid;
	}
	
	
	public NewsModel() {
		super();
	}


	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getShortdescription() {
		return shortdescription;
	}
	public void setShortdescription(String shortdescription) {
		this.shortdescription = shortdescription;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(Long categoryid) {
		this.categoryid = categoryid;
	}
	   
}
