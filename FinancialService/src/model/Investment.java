package model;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Next;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.SQL;
import org.nutz.dao.entity.annotation.Table;

@Table("invest")
public class Investment {
	@Id
	@Next(@SQL("select last_insert_id()"))
	private int id;
	/**/
	@Column
	private int amount;
	
	@Column("period_id")
	private int period_id;
	
	@Column("expect_rate")
	private int expect_rate;
	
		
	@Column("guarantee_category_id")
	private int guarantee_category_id;
	
	
	
/*	*/
	
	@Column
	private String mobile;
	
	@Column
	private String name;
	
	@Column
	private String email;
	@Column
	private String qq;
	@Column
	private String city;
	@Column
	private String comment;
	
	
	@Column("date")
	private Date date;
	
	@Column("user_id")
	private int user_id;
	
	@Column
	private Long status;
	
	
	
	@One(target = Period.class, field = "period_id")
	private Period period;
	
	@One(target = GuaranteeCategory.class, field = "guarantee_category_id")
	private GuaranteeCategory guaranteeCategory;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPeriod_id() {
		return period_id;
	}

	public void setPeriod_id(int period_id) {
		this.period_id = period_id;
	}

	public int getExpect_rate() {
		return expect_rate;
	}

	public void setExpect_rate(int expect_rate) {
		this.expect_rate = expect_rate;
	}

	public int getGuarantee_category_id() {
		return guarantee_category_id;
	}

	public void setGuarantee_category_id(int guarantee_category_id) {
		this.guarantee_category_id = guarantee_category_id;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
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
