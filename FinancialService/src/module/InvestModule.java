package module;

import java.util.Date;

import javax.sql.DataSource;

import model.Investment;

import org.nutz.dao.Dao;
import org.nutz.dao.impl.NutDao;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import database.Connections;

@At("/invest")
public class InvestModule {
	
	private Dao dao;
	
	public InvestModule() throws Exception {
		DataSource dataSource = Connections.getDataSource();
		this.dao = new NutDao(dataSource);
	}
	
	@At("/reg")
	@Ok("redirect:/public/invest_list.jsp")
	public void reg(@Param("..") Investment invest) {
		invest.setDate(new Date());
		invest.setStatus(1L);
		dao.insert(invest);
	}
}
