package happylife.interceptor;

import happylife.util.config.IndexConfig;
import happylife.util.config.PageConfigUtil;
import happylife.util.config.WinterOrangeSysConf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jodd.util.StringUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * @author 闫朝喜 
 * 
 * by  2016-5-21 
 *
 */
public class MchUserInterceptor extends HandlerInterceptorAdapter {
	private static final Log logger = LogFactory.getLog(MchUserInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception 
	{
		//如果当前的请求是登录请求则继续往下走
		String uri = request.getRequestURI();
		if(null != uri && uri.contains("/mchuser/login") ||uri.contains("/mchuser/tologin") || !uri.contains("mchuser") )
		{
			logger.warn("the login... now login");
			return super.preHandle(request, response, handler);
		}
		
		//如果session里面不含有登录信息 则重新登录
		String mchId = (String)request.getSession().getAttribute(IndexConfig.MCHUSER_SESSION_KEY);
		if(null == mchId || StringUtil.isBlank(mchId))
		{
			logger.error("mchuser not login... now to login,and is in test model="+WinterOrangeSysConf.IN_TEST_MODEL);
			
			if(WinterOrangeSysConf.IN_TEST_MODEL){
				response.sendRedirect(IndexConfig.HOME_URL_TEST+PageConfigUtil.MCH_PREFIX+PageConfigUtil.MchUserPage.TO_LOGIN_URI);
				
			}else{
				response.sendRedirect(IndexConfig.HOME_URL_ALIYUN+PageConfigUtil.MCH_PREFIX+PageConfigUtil.MchUserPage.TO_LOGIN_URI);
			}
			
			return false;
		}
		else
		{
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
