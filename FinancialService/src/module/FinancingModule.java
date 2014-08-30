package module;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import model.Financing;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.impl.NutDao;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import database.Connections;
import filter.AuthorityFilter;

@At("/financing")
public class FinancingModule {
	
	private Dao dao;
	
	public FinancingModule() throws Exception {
		DataSource dataSource = Connections.getDataSource();
		this.dao = new NutDao(dataSource);
	}
	
	@At("/reg")
	@Ok("redirect:/public/wyrzxx.jsp")
	public void reg(@Param("..") Financing financing) {
		financing.setPublishDate(new Date());
		financing.setStatus(0L);
		dao.insert(financing);
	}
	
	@Filters({ @By(type = AuthorityFilter.class, args = { "2" }) })
	@At("/financing_delete")
	@Ok("json:{quoteName:true}")
	public ResponseCode financingDelete(@Param("id") Long id) {
		dao.delete(Financing.class, id);
		return new ResponseCode(0, "删除成功");
	}
	
	@Filters({ @By(type = AuthorityFilter.class, args = { "2" }) })
	@At("/financing_audit")
	@Ok("json:{quoteName:true}")
	public ResponseCode financingAudit(@Param("id") Long id) {
		Financing financing = new Financing();
		financing.setId(id);
		financing.setStatus(1L);
		dao.updateIgnoreNull(financing);
		return new ResponseCode(0, "审核成功");
	}
	
	@Filters({ @By(type = AuthorityFilter.class, args = { "2" }) })
	@At("/financing_list")
	@Ok("json:{quoteName:true}")
	public List<Financing> financingList(@Param("page") int pageNumber,
			@Param("rows") int pageSize, @Param("status") Long status) {
		Cnd cnd = status != null ? Cnd.where("status", "=", status) : null;
		List<Financing> financings = dao.query(Financing.class, cnd,
				dao.createPager(pageNumber, pageSize));
		return financings;
	}
}
