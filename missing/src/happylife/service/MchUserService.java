package happylife.service;

import happylife.model.TbMchStaff;
import happylife.model.TbMchWechatRelation;
import happylife.model.TbProduct;
import happylife.model.TbRedeemCode;
import happylife.model.TbSuggestion;
import happylife.model.TbTransactionRecord;
import happylife.model.TbWechatUser;
import happylife.model.servicemodel.CacheProduct;
import happylife.model.servicemodel.CacheRedeemCode;
import happylife.model.servicemodel.CacheTransaction;
import happylife.model.servicemodel.TransactionReportBean;
import happylife.service.exception.HappyLifeException;
import happylife.service.exception.RequestInvalidException;
import happylife.service.exception.SessionInvalidException;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;

/**
 * 商户业务层
 * 
 * @author 闫朝喜
 * 
 *         by 2016-5-21
 */
public interface MchUserService<TbMch> extends GenericService<TbMch> {

	/**
	 * 验证登录商家的用户名以及密码是否正确
	 * 
	 * @param
	 * @return
	 */
	public boolean checkLogin(TbMch mchUserInfo);

	/**
	 * 根据 mchId 获取该用户是否存在
	 * 
	 * @param aid
	 * @return
	 */
	public TbMch getMchUserInfoById(String aid);

	/**
	 * 商家直接获取 自己下面的所有产品信息 ：原则上这个商品信息不会太多，无需分页，全部显示 如果查询不到 则 在model 层里面把对应的
	 * 数据信息填充为空即可
	 * 
	 * @param request
	 * @param
	 * @return
	 */
	public List<TbProduct> generateProductsList(HttpServletRequest request,
			ModelMap map) throws SessionInvalidException;

	/**
	 * 根据request里面的信息添加一个新的商品
	 * 
	 * @author happylife
	 * @param requst
	 * @return
	 */
	public CacheProduct addNewSingleProduct(HttpServletRequest requst);

	/**
	 * 根据request里面的信息 更新一个商品信息
	 * 
	 * @author happylife
	 * @param requst
	 * @return 返回更新成功的商品实体信息， 返回 null 表示更新失败
	 */
	public CacheProduct updateProductInfo(HttpServletRequest requst);
	
	/*
	 * 获取关注的微信用户列表
	 */
	public List<TbWechatUser>  getMchWechatUsers(HttpServletRequest request,
			HttpServletResponse response,Map<String, Object> model)throws HappyLifeException;
	

	/**
	 * 根据 request 里面的信息 分页或者全部 显示 商家自己的兑换码信息
	 * 
	 * @author happylife
	 * @param request
	 * @param model
	 */
	public List<CacheRedeemCode> generateRedeemCodeList(
			HttpServletRequest request, Map<String, Object> model);

	/**
	 * 更新某个兑换码信息
	 * 
	 * @author happylife
	 * @param request
	 * @return: 返回跟新后的 兑换码信息
	 * @since JDK 1.7
	 */
	public TbRedeemCode updateRedeemCodeInfo(HttpServletRequest request);

	/**
	 * 根据查询条件 ： 分页或者全部显示的方式查询具体的商家账户的 流水
	 * 
	 * @author snnile2012
	 * @param request
	 * @return
	 */
	public List<TbTransactionRecord> generateTransactionList(
			HttpServletRequest request, Map<String, Object> model,
			boolean isExportData);

	/**
	 * 根据查询条件： 分页或者全部显示具体商家的流水， 这里会返回商品名称以及商家名等信息
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	public List<CacheTransaction> generateCacheTransactionList(
			HttpServletRequest request, Map<String, Object> model,
			boolean isExportData);
	
	/**
	 * 商家界面生成自己的一周流水 图表数据
	 * 
	 * @param request
	 * @param model
	 * @return 当前日期往前的一周的流水数据
	 */
	public List<TransactionReportBean> generateOneWeekTransactionRecords(
			HttpServletRequest request, Map<String, Object> model);

	/**
	 * 商家账户更新自己的密码
	 * 
	 * @param request
	 * @param response
	 */
	public void changeMchUserPasswd(HttpServletRequest request,
			HttpServletResponse response);

	/**
	 * ajax验证原密码
	 * 
	 * @param request
	 * @param response
	 */
	public void validateMchUserPasswd(HttpServletRequest request,
			HttpServletResponse response);

	/**
	 * 商家账户更新自己个人信息
	 * 
	 * @param request
	 * @param response
	 */
	public void updateMchUserInfo(HttpServletRequest request,TbMch mch,
			HttpServletResponse response) throws RequestInvalidException;
	
	/** 更新产品的状态： 由 下架到上架等。出错会直接通过response 返回
	 * @param request
	 * @param response
	 */
	public void changeProductStatus(HttpServletRequest request,
			HttpServletResponse response);
	
	/** 更新兑换码的状态： 已使用 未使用等,或者兑换码未发送成功则重新发送。出错会直接通过response 返回
	 * @param request
	 * @param response
	 */
	public void changeRedeemCodeStatus(HttpServletRequest request,
			HttpServletResponse response,boolean isResend);
	
	
	/** 更新订单状态： 更新为完成。出错会直接通过response 返回
	 * @param request
	 * @param response
	 */
	public void changeTransactionStatus(HttpServletRequest request,
			HttpServletResponse response,int  newStatus);
	
	/** 商家账户查询意见 表，支持分页方式
	 * @param request
	 * @param response
	 */
	public List<TbSuggestion> getSuggestions(HttpServletRequest request,
			HttpServletResponse response,Map<String, Object> model)throws HappyLifeException;
	
	
	/*
	 * 获取员工列表
	 */
	public List<TbMchStaff>  getStaffs(HttpServletRequest request,
			HttpServletResponse response,Map<String, Object> model)throws HappyLifeException;
	
	
	
	/*
	 * 新增或者更新一个staff信息
	 */
	public boolean  saveOrUpdateStaff(TbMchStaff staff,HttpServletRequest request,
			HttpServletResponse response,Map<String, Object> model)throws HappyLifeException;
	
	/*
	 * 新增或者更新一个staff信息
	 */
	public Object getById(Class classT, int id)throws HappyLifeException;
	
	
	/*
	 * 新增或者更新一个属性信息
	 */
	public void saveOrUpdateObject(Object obj)throws HappyLifeException;
	
	

}
