package filter;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.ActionContext;
import org.nutz.mvc.ActionFilter;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.View;
import org.nutz.mvc.view.ServerRedirectView;

import dao.UserDao;

public class AuthorityFilter implements ActionFilter {
	private static final Log log = Logs.get();
	private Integer role;
	private String loginPath = "/admin/login.jsp";

	public AuthorityFilter(Integer role) {
		this.role = role;
	}

	@Override
	public View match(ActionContext arg0) {
		if (!this.check())
			return new ServerRedirectView(getLoginPath());
		return null;
	}

	public boolean check() {

		UserDao dao = new UserDao();
		HttpSession session = Mvcs.getHttpSession(false);
		System.out.println(session.getId());
		boolean res = true;
//		try {
//			if (session == null
//					|| null == session.getAttribute("USERID")
//					|| dao.get_user_role((Integer) session
//							.getAttribute("USERID")) < role)
			String loginedUserName = (String)session.getAttribute("loginedUserName");
			String adminCheck = (String)session.getAttribute("adminCheck");
			if(null==adminCheck||adminCheck.equals("")||adminCheck.endsWith("false"))
				res = false;
//		} catch (SQLException e) {
//			log.error("查询角色出错", e);
//			res = false;
//		}
		return res;
	}

	public String getLoginPath() {
		return loginPath;
	}

}
