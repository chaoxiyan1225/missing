package happylife.interceptor;

import happylife.model.TbWechatUser;
import happylife.service.WeChatUserService;
import happylife.util.config.IndexConfig;
import happylife.util.config.PageConfigUtil;
import happylife.util.config.WinterOrangeSysConf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 从微信界面转接的消息全部经过该过滤器
 * 
 * @author yanchaoxi
 * 
 */
public class WeChatUserInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private WeChatUserService<TbWechatUser> weChatUserServiceInterceptor;

	private static final Log logger = LogFactory
			.getLog(WeChatUserInterceptor.class);

	/*
	 * 预处理，检查微信用户的合法性
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String uri = request.getRequestURI();

		logger.debug("the current uri is :" + uri);
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods",
				"POST, GET, OPTIONS, DELETE");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers", "*");
		// 如果不是从微信过来的链接则忽略
		if (!uri.contains(IndexConfig.USER_FROM_WECHAT_URI_PREFIX)) {
			logger.debug("uri does contains :"
					+ IndexConfig.USER_FROM_WECHAT_URI_PREFIX);
			return super.preHandle(request, response, handler);
		}

		logger.debug("check the wechat user session");

		// 测试模式
		if (WinterOrangeSysConf.IN_TEST_MODEL) {
			logger.info("system in test model ,return true");
			return true;
		}

		// 如果是微信过来的校验信息，则放过
		if (uri.contains(PageConfigUtil.WechatUserPage.INTERACTIVE_URI)
				|| uri.contains(PageConfigUtil.WechatUserPage.WECHAT_PAY_CALL_BACK)) {
			logger.info("message from wechat interactive or call back,uri="
					+ uri);
			return super.preHandle(request, response, handler);
		}

		// 如果微信用户是合法的放到session 否则返回失败
		if (weChatUserServiceInterceptor
				.checkWechatUserValid(request, response)) {
			logger.debug("the user is from wechat");
			return super.preHandle(request, response, handler);
		}

		logger.warn("the user does not from wechat! exit");
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.debug("just user super posthandler");

		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods",
				"POST, GET, OPTIONS, DELETE");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers", "*");

		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception e)
			throws Exception {

		super.afterCompletion(request, response, handler, e);
	}

}
