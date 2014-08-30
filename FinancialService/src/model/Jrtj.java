package model;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Next;
import org.nutz.dao.entity.annotation.SQL;

public class Jrtj {
	@Id
	@Next(@SQL("select last_insert_id()"))
	private Long id;
	@Column
	private String name;
	@Column
	private String pic;
	@Column
	private String code;
	@Column
	private String iopv;
	@Column
	private String iopvdate;
	@Column
	private String type;
	@Column
	private String startdate;
	@Column
	private String admin;
	@Column
	private String manager;
	@Column
	private String scale;
	@Column
	private Integer grade;
	@Column
	private String layer;
	@Column
	private String contact;
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
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getIopv() {
		return iopv;
	}
	public void setIopv(String iopv) {
		this.iopv = iopv;
	}
	public String getIopvdate() {
		return iopvdate;
	}
	public void setIopvdate(String iopvdate) {
		this.iopvdate = iopvdate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	public String getLayer() {
		return layer;
	}
	public void setLayer(String layer) {
		this.layer = layer;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	
}
