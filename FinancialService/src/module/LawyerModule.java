package module;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import model.Lawyer;

import org.nutz.dao.Dao;
import org.nutz.dao.impl.NutDao;
import org.nutz.lang.Strings;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import database.Connections;
import filter.AuthorityFilter;

@At("/lawyer")
@Filters({ @By(type = AuthorityFilter.class, args = { "2" }) })
public class LawyerModule {

	private Dao dao;

	public LawyerModule() throws Exception {
		DataSource dataSource = Connections.getDataSource();
		this.dao = new NutDao(dataSource);
	}

	@At("/lawyer_list")
	@Ok("json:{quoteName:true}")
	public List<Lawyer> lawyerList(@Param("page") int pageNumber,
			@Param("rows") int pageSize) {
		List<Lawyer> lawyers = dao.query(Lawyer.class, null,
				dao.createPager(pageNumber, pageSize));
		return lawyers;
	}

	/*@At("/article_add")
	@Ok("json:{quoteName:true}")
	public ResponseCode articleAdd(@Param("..") Article article,
			HttpServletRequest request) {
		if (Strings.isEmpty(article.getText())) {
			return new ResponseCode(0, "标题不能为空");
		}
		Long userId = (Long) request.getSession().getAttribute("USERID");
		Date now = new Date();
		article.setCreateTime(now);
		article.setUpdateTime(now);
		article.setUserId(userId);
		dao.insert(article);
		return new ResponseCode(0, "保存成功");
	}*/

	@At("/lawyer_edit")
	@Ok("json:{quoteName:true}")
	public ResponseCode articleEdit(@Param("..") Lawyer lawyer) {
		if (Strings.isEmpty(lawyer.getName())) {
			return new ResponseCode(0, "标题不能为空");
		}
		Date now = new Date();
		lawyer.setDate(now.toString());
		dao.updateIgnoreNull(lawyer);
		return new ResponseCode(0, "保存成功");
	}

	/*
	@At("/article_delete")
	@Ok("json:{quoteName:true}")
	public ResponseCode articleDelete(@Param("id") Long id) {
		dao.delete(Article.class, id);
		return new ResponseCode(0, "删除成功");
	}*/
}
