package module;

import java.util.List;

import javax.sql.DataSource;

import model.User;

import org.nutz.dao.Dao;
import org.nutz.dao.impl.NutDao;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import database.Connections;
import filter.AuthorityFilter;

@At("/user")
@Filters({ @By(type = AuthorityFilter.class, args = { "2" }) })
public class UserModule {

	private Dao dao;

	public UserModule() throws Exception {
		DataSource dataSource = Connections.getDataSource();
		this.dao = new NutDao(dataSource);
	}

	@At("/user_list")
	@Ok("json:{quoteName:true}")
	public List<User> userList(@Param("page") int pageNumber,
			@Param("rows") int pageSize) {
		List<User> users = dao.query(User.class, null,
				dao.createPager(pageNumber, pageSize));
		return users;
	}

	/*@At("/user_add")
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
	}*/

	/*@At("/jrtj_edit")
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
	}*/

	/*@At("/user_delete")
	@Ok("json:{quoteName:true}")
	public ResponseCode jrtjDelete(@Param("id") Long id) {
		dao.delete(Jrtj.class, id);
		return new ResponseCode(0, "删除成功");
	}*/
}
