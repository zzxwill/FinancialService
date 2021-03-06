package module;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import model.Jrtj;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.nutz.dao.Dao;
import org.nutz.dao.impl.NutDao;
import org.nutz.lang.Strings;
import org.nutz.mvc.annotation.AdaptBy;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.upload.UploadAdaptor;

import database.Connections;
import filter.AuthorityFilter;

@At("/jrtj")
@Filters({ @By(type = AuthorityFilter.class, args = { "2" }) })
public class JrtjModule {

	private Dao dao;

	public JrtjModule() throws Exception {
		DataSource dataSource = Connections.getDataSource();
		this.dao = new NutDao(dataSource);
	}

	@At("/jrtj_list")
	@Ok("json:{quoteName:true}")
	public List<Jrtj> jrtjList(@Param("page") int pageNumber,
			@Param("rows") int pageSize) {
		List<Jrtj> jrtjs = dao.query(Jrtj.class, null,
				dao.createPager(pageNumber, pageSize));
		return jrtjs;
	}

	@At("/jrtj_add")
	@Ok("json:{quoteName:true}")
	@AdaptBy(type = UploadAdaptor.class, args = { "${app.root}/WEB-INF/tmp" })
	public ResponseCode jrtjAdd(@Param("..") Jrtj obj,
			@Param("picfile") File picfile, ServletContext context,
			HttpServletRequest request) {
		if (Strings.isEmpty(obj.getName())) {
			return new ResponseCode(0, "名称不能为空");
		}
		if (picfile == null || !picfile.isFile()) {
			return new ResponseCode(0, "封面文件不能为空");
		}
		String filePath = new StringBuilder("upload/")
				.append(System.currentTimeMillis()).append(".")
				.append(FilenameUtils.getExtension(picfile.getName()))
				.toString();
		try {
			FileUtils.moveFile(picfile, new File(context.getRealPath("/")
					+ filePath));
			String ctx = request.getContextPath();
			ctx = StringUtils.isEmpty(ctx) ? "/" : "/" + ctx + "/";
			obj.setPic(ctx + filePath);
		} catch (IOException e) {
			return new ResponseCode(0, "文件上传失败");
		}
		dao.insert(obj);
		return new ResponseCode(0, "保存成功");
	}

	@At("/jrtj_edit")
	@Ok("json:{quoteName:true}")
	@AdaptBy(type = UploadAdaptor.class, args = { "${app.root}/WEB-INF/tmp" })
	public ResponseCode jrtjEdit(@Param("..") Jrtj obj,
			@Param("picfile") File picfile, ServletContext context,
			HttpServletRequest request) {
		if (Strings.isEmpty(obj.getName())) {
			return new ResponseCode(0, "名称不能为空");
		}
		if (picfile != null && picfile.isFile()) {
			String filePath = new StringBuilder("upload/")
					.append(System.currentTimeMillis()).append(".")
					.append(FilenameUtils.getExtension(picfile.getName()))
					.toString();
			try {
				FileUtils.moveFile(picfile, new File(context.getRealPath("/")
						+ filePath));
				String ctx = request.getContextPath();
				ctx = StringUtils.isEmpty(ctx) ? "/" : "/" + ctx + "/";
				obj.setPic(ctx + filePath);
			} catch (IOException e) {
				return new ResponseCode(0, "文件上传失败");
			}
		}
		dao.updateIgnoreNull(obj);
		return new ResponseCode(0, "保存成功");
	}

	@At("/jrtj_delete")
	@Ok("json:{quoteName:true}")
	public ResponseCode jrtjDelete(@Param("id") Long id) {
		dao.delete(Jrtj.class, id);
		return new ResponseCode(0, "删除成功");
	}
}
