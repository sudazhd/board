package org.iot.domain;

import java.util.Date;

public class EpilogueVO {

	private Integer ep_no;
	
	private String ep_title;
	
	private String ep_content;
	
	private String ep_writer;
	
	private Date regdate;
	
	private int ep_viewcnt;

	public Integer getEp_no() {
		return ep_no;
	}

	public void setEp_no(Integer ep_no) {
		this.ep_no = ep_no;
	}

	public String getEp_title() {
		return ep_title;
	}

	public void setEp_title(String ep_title) {
		this.ep_title = ep_title;
	}

	public String getEp_content() {
		return ep_content;
	}

	public void setEp_content(String ep_content) {
		this.ep_content = ep_content;
	}

	public String getEp_writer() {
		return ep_writer;
	}

	public void setEp_writer(String ep_writer) {
		this.ep_writer = ep_writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getEp_viewcnt() {
		return ep_viewcnt;
	}

	public void setEp_viewcnt(int ep_viewcnt) {
		this.ep_viewcnt = ep_viewcnt;
	}
	
	
	
}
