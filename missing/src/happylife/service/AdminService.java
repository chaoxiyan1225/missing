package happylife.service;

import happylife.model.TbActivity;
import happylife.model.TbMch;
import happylife.model.TbSuggestion;
import happylife.model.servicemodel.CacheTransaction;
import happylife.model.servicemodel.TransactionReportBean;
import happylife.service.exception.HappyLifeException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;

import java.util.List;
import java.util.Map;

/** 管理员业务层
 * @author 闫朝喜
 *
 * by 2016-5-21
 */
public interface AdminService<TbAdmin> extends GenericService<TbAdmin>{
	
	/** 验证登录的admin 用户名以及密码是否正确
	 * @param adminInfo
	 * @return
	 */
	public boolean checkLogin(TbAdmin adminInfo);

	
	
	/** 修改密码
	 * @param request
	 * @param response
	 */
	public void changePasswd(HttpServletRequest request,
			HttpServletResponse response) ;
	
	/** 查询意见 表，支持分页方式
	 * @param request
	 * @param response
	 */
	public List<TbSuggestion> getSuggestions(HttpServletRequest request,
			HttpServletResponse response,Map<String, Object> model)throws HappyLifeException;
	
	/** 管理员账户查活动列表，支持分页方式
	 * @param request
	 * @param response
	 */
	public List<TbActivity> getActivities(HttpServletRequest request,
			HttpServletResponse response,Map<String, Object> model)throws HappyLifeException;
	
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
	 * 管理员查看所有商家一周流水 图表数据
	 * 
	 * @param request
	 * @param model
	 * @return 当前日期往前的一周的流水数据
	 */
	public List<TransactionReportBean> generateOneWeekTransactionRecords(
			HttpServletRequest request, Map<String, Object> model);
	
	/** 查询所有商户，支持分页方式
	 * @param request
	 * @param response
	 */
	public List<TbMch> getMchUsers(HttpServletRequest request,
								   HttpServletResponse response, Map<String, Object> model)throws HappyLifeException;

	
	/**
	 * 管理员查询商品
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws HappyLifeException
	 */
	public List queryListByClassType(HttpServletRequest request,
			   HttpServletResponse response, Map<String, Object> model,Class objClass,String orderName)throws HappyLifeException;

	
	/**
	 * 新增或者更新一个 商户信息
	 * @param tbMch
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws HappyLifeException
	 */
	public boolean saveOrUpdateMchUser(HttpServletRequest request,
			HttpServletResponse response,ModelMap model)throws HappyLifeException;
	
	
}
