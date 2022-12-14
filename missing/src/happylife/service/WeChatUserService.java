package happylife.service;

import happylife.model.TbMchStaff;
import happylife.model.TbTransactionRecord;
import happylife.model.servicemodel.CacheRedeemCode;
import happylife.model.servicemodel.CacheTransaction;
import happylife.model.servicemodel.CacheWechatUser;
import happylife.service.exception.HappyLifeException;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

/**
 * 用户业务层
 * 
 * @author 闫朝喜
 * 
 *         by 2016-5-21
 */
public interface WeChatUserService<TbWechatUser> extends
		GenericService<TbWechatUser> {

	/**
	 * 解析请求中的 微信用户信息，并校验微信信息有效性， 如果有效则放到session中
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public boolean checkWechatUserValid(HttpServletRequest request,
			HttpServletResponse response);

	/**
	 * 处理微信的接入确认消息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public boolean checkWeChatAccessSignature(HttpServletRequest request,
			HttpServletResponse response);

	/**
	 * 微信的非signature确认消息的处理接口类，处理：关注、取消关注、订阅、自定义菜单的点击等请求
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public boolean processWechatInteractive(HttpServletRequest request,
			HttpServletResponse response);

	/**
	 * 按分页方式查询 美食信息： 可以支持只查指定商家的美食， 也可以查询所有商家的美食，对应的美食商品的状态要为有效值 如果查询不到 则 在model
	 * 层里面把对应的 数据信息填充为空即可
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	public void generateProductListByPage(HttpServletRequest request,
			Map<String, Object> model, HttpServletResponse response,
			boolean isAjax);
	
	/**
	 *
 
	 * @param request
	 * @param model
	 * @return
	 */
	public void  wechatFollowOneMch(HttpServletRequest request,
			ModelMap model, HttpServletResponse response);
	
	/**
	 * 按分页方式查询 商家信息： 可以支持只查指定商家到 则 在model
	 * 层里面把对应的 数据信息填充为空即可
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	public void generateMchListByPage(HttpServletRequest request,
			Map<String, Object> model, HttpServletResponse response,
			boolean isAjax);

	/**
	 * 购买商品
	 * 
	 * @param request
	 * @param model
	 */
	public ModelAndView buyProduct(ModelMap model, HttpServletRequest request,
			HttpServletResponse response);
	
	/**
	 * 微信用户为排号付费
	 * 
	 * @param request
	 * @param model
	 */
	public ModelAndView payforQueueOrder(ModelMap model, HttpServletRequest request,
			HttpServletResponse response);
	
	/**
	 * 购物车支付接口
	 * 
	 * @param request
	 * @param model
	 */
	public ModelAndView payforGouwuche(ModelMap model, HttpServletRequest request,
			HttpServletResponse response,CacheWechatUser cacheChatUser);

	/**
	 * 微信账户 提交 一条意见
	 * 
	 * @param request
	 * @param response
	 */
	public void addNewSuggestion(HttpServletRequest request,
			HttpServletResponse response);
	
	/**
	 * 处理 微信 支付的异步回调请求
	 * 
	 * @param request
	 * @param model
	 */
	public void processWechatPayBack(ModelMap model, HttpServletRequest request,
			HttpServletResponse response);

	/**
	 * staff查询委派给自己的订单
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List staffGetTransaction(Map<String,Object> model ,TbMchStaff staff, HttpServletRequest request,
			HttpServletResponse response);
	
	
	/**
	 * wechat查询自己的订单
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List wechatGetTransactions(Map<String,Object> model ,TbWechatUser wechat, HttpServletRequest request,
			HttpServletResponse response);
	
	/**
	 * staff完成委派给自己的订单
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public boolean  staffFinishTransaction(Map<String,Object> model ,TbTransactionRecord transaction ,TbMchStaff staff, HttpServletRequest request,
			HttpServletResponse response);

	/**
	 * 根据 request 里面的信息 分页或者全部 显示 商家自己的兑换码信息
	 * 
	 * @author happylife
	 * @param request
	 * @param model
	 */
	@SuppressWarnings("unchecked")
	public List<CacheRedeemCode> generateRedeemCodeList(
			HttpServletRequest request, Map<String, Object> model); 
	
	
	/**
	 * 微信用户查看自己的排队情况
	 * 
	 * @param request
	 * @param model
	 */
	public ModelAndView  querySelfQueueOrder(ModelMap model, HttpServletRequest request,
			CacheWechatUser cacheWechatUser);
	
	/**
	 * 微信用户修改排队信息：商家完成或者 普通用户取消排队等
	 * 
	 * @param request
	 * @param model
	 */
	public void  changeQueueOrder(ModelMap model, HttpServletRequest request,HttpServletResponse response,CacheWechatUser cacheWechatUser);


	/*
	 * 查询一个实体
	 */
	public Object getById(Class classT, int id)throws HappyLifeException; 
	
	
	/*
	 * 更新一个实体
	 */
	public void  wechatUpdate(Object objct); 
	
}
