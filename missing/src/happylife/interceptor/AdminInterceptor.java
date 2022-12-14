package happylife.interceptor;

import happylife.model.TbAdmin;
import happylife.util.config.IndexConfig;
import happylife.util.config.PageConfigUtil;
import happylife.util.config.WinterOrangeSysConf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * @author 闫朝喜
 * 
 *         by 2016-5-21
 * 
 */
public class AdminInterceptor extends HandlerInterceptorAdapter {
	private static final Log logger = LogFactory.getLog(AdminInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// 如果当前的请求是登录请求则继续往下走
		String uri = request.getRequestURI();
		if (null != uri
				&& uri.contains(PageConfigUtil.ADMIN_PREFIX+PageConfigUtil.AdminPage.TO_LOGIN_URI)
				|| uri.contains(PageConfigUtil.ADMIN_PREFIX+PageConfigUtil.AdminPage.LOGIN_URI)
				|| !uri.contains("admin")) {
			logger.warn("now login");
			return super.preHandle(request, response, handler);
		}

		// 如果session里面不含有登录信息 则重新登录
		TbAdmin admin = (TbAdmin) request.getSession().getAttribute(
				IndexConfig.ADMIN_SESSION_KEY);
		if (null == admin) {
			logger.error("not login,now to login page and is in test model="+WinterOrangeSysConf.IN_TEST_MODEL);
			
			//如果是本机测试，则跳转到本机
			if(WinterOrangeSysConf.IN_TEST_MODEL){
				response.sendRedirect(IndexConfig.HOME_URL_TEST+PageConfigUtil.ADMIN_PREFIX
						+ PageConfigUtil.AdminPage.TO_LOGIN_URI);
			}else{
				response.sendRedirect(IndexConfig.HOME_URL_ALIYUN+PageConfigUtil.ADMIN_PREFIX
						+ PageConfigUtil.AdminPage.TO_LOGIN_URI);
			}
		
			return false;
		} else {
			return super.preHandle(request, response, handler);
		}

	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception e)
			throws Exception {

		super.afterCompletion(request, response, handler, e);
	}
}
