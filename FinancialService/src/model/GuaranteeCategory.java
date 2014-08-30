package model;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

@Table("guarantee_category")
public class GuaranteeCategory {
	@Id
	private Long id;
	@Column
	private String name;
	@Column
	private Long Status;

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

	public Long getStatus() {
		return Status;
	}

	public void setStatus(Long status) {
		Status = status;
	}

}
