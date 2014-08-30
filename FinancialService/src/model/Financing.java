package model;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Next;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.SQL;
import org.nutz.dao.entity.annotation.Table;

@Table("financing")
public class Financing {
	@Id
	@Next(@SQL("select last_insert_id()"))
	private Long id;
	@Column
	private String name;
	@Column("period_id")
	private Long periodId;
	@Column
	private Double amount;
	@Column("guarantee_category_id")
	private Long guaranteeCategoryId;
	@Column("publish_date")
	private Date publishDate;
	@Column
	private Long status;
	@Column
	private Double rate;
	@Column
	private String email;
	@Column
	private String qq;
	@Column
	private String city;
	@Column
	private String comment;
	@Column
	private String mobile;
	
	@One(target = Period.class, field = "periodId")
	private Period period;
	
	@One(target = GuaranteeCategory.class, field = "guaranteeCategoryId")
	private GuaranteeCategory guaranteeCategory;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getPeriodId() {
		return periodId;
	}
	public void setPeriodId(Long periodId) {
		this.periodId = periodId;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Long getGuaranteeCategoryId() {
		return guaranteeCategoryId;
	}
	public void setGuaranteeCategoryId(Long guaranteeCategoryId) {
		this.guaranteeCategoryId = guaranteeCategoryId;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	public Double getRate() {
		return rate;
	}
	public void setRate(Double rate) {
		this.rate = rate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Period getPeriod() {
		return period;
	}
	public void setPeriod(Period period) {
		this.period = period;
	}
	public GuaranteeCategory getGuaranteeCategory() {
		return guaranteeCategory;
	}
	public void setGuaranteeCategory(GuaranteeCategory guaranteeCategory) {
		this.guaranteeCategory = guaranteeCategory;
	}


}
