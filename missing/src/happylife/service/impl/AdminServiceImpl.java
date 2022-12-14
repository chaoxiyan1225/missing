package happylife.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import happylife.dao.GenericDao;
import happylife.model.*;
import happylife.model.servicemodel.CacheMchUser;
import happylife.model.servicemodel.CacheProduct;
import happylife.model.servicemodel.CacheTransaction;
import happylife.model.servicemodel.HqlQueryCondition;
import happylife.model.servicemodel.TransactionReportBean;
import happylife.model.servicemodel.TransactionStatusEnum;
import happylife.model.servicemodel.HqlQueryCondition.Property;
import happylife.model.servicemodel.HqlQueryCondition.Relation;
import happylife.service.AdminService;
import happylife.service.exception.HappyLifeException;
import happylife.service.exception.RequestInvalidException;
import happylife.util.DateUtil;
import happylife.util.DesUtil;
import happylife.util.StrUtil;
import happylife.util.cache.MchStaffProductCacheManager;
import happylife.util.config.IndexConfig;
import happylife.util.config.PageConfigUtil;
import happylife.util.requestandresponse.ParseRequest;
import jodd.util.StringUtil;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

@Service
public class AdminServiceImpl extends GenericServiceImpl<TbAdmin> implements
		AdminService<TbAdmin> {
	private static final Log logger = LogFactory.getLog(AdminServiceImpl.class);

	@SuppressWarnings("rawtypes")
	private GenericDao adminDAO;

	@SuppressWarnings("rawtypes")
	public void setAdminDAO(GenericDao adminDAO) {
		this.adminDAO = adminDAO;
	}
	

	/** 验证登录的admin 用户名以及密码是否正确，并回显到界面
	 * @param adminInfo
	 * @return
	 */
	@Override
	public boolean checkLogin(TbAdmin adminInfo) {
		if (null == adminInfo || StringUtil.isBlank(adminInfo.getAdminName())
				|| StringUtil.isBlank(adminInfo.getAdminPasswd())) 
		{
			logger.warn("the admin login error");
			//ResponseToUser.writeJsonMsg(response, new ResultMsgBean(false,"登录信息错误"));
			return false;
		}

		@SuppressWarnings("unchecked")
		Object obj = adminDAO.getObjectByProperty(TbAdmin.class, "adminName",
				adminInfo.getAdminName());
		
		if(null == obj)
		{
			logger.warn("the admin info not exit"+adminInfo.getAdminName());
			//ResponseToUser.writeJsonMsg(response, new ResultMsgBean(false,"用户名不存在"));
			return false;
		}
		
		TbAdmin adminTmp = (TbAdmin) obj;
		//数据库中的账户密码是密文存储的，需要对界面的密码加密后比较
		if(DesUtil.encrypt(adminInfo.getAdminPasswd()).equals(adminTmp.getAdminPasswd()))
		{
			adminInfo.setAdminId(adminTmp.getAdminId());
			adminInfo.setAdminLevel(adminTmp.getAdminLevel());
			adminInfo.setStatus(adminTmp.getStatus());
			return true ;
		}
		
		//ResponseToUser.writeJsonMsg(response, new ResultMsgBean(false,"密码错误"));
		//密码错误
		return false;
	}

	/** 修改密码
	 * @param request
	 * @param response
	 */
	public void changePasswd(HttpServletRequest request,
			HttpServletResponse response) {
		
	}
	
	/** 查询意见 表，支持分页方式
	 * @param request
	 * @param response
	 */
	@SuppressWarnings("unchecked")
	public List<TbSuggestion> getSuggestions(HttpServletRequest request,
			HttpServletResponse response,Map<String, Object> model)throws HappyLifeException{
		if (null == request || null == response) {
			logger.error("request or model can not be null");

			throw new RequestInvalidException(
					"request and response can not be null");
		}

		int currentPage = ParseRequest.parseCurrentPage(request, model);

		HqlQueryCondition query = new HqlQueryCondition();

		query.setFirstResult(currentPage * PageConfigUtil.PAGE_COUNT_SIZE_20);
		query.setMaxResults(PageConfigUtil.PAGE_COUNT_SIZE_20);

		query.setOrderName("createTime");
		query.setAesc(false);

		try {

			return adminDAO.getListByQueryCondtion(TbSuggestion.class, query);
		} catch (DataAccessException e) {
			logger.error(e.getMessage());
			return null;
		}
		
		
	}
	
	/** 管理员账户查活动列表，支持分页方式
	 * @param request
	 * @param response
	 */
	@SuppressWarnings("unchecked")
	public List<TbActivity> getActivities(HttpServletRequest request,
			HttpServletResponse response,Map<String, Object> model)throws HappyLifeException{
		
		if (null == request || null == response) {
			logger.error("request or model can not be null");

			throw new RequestInvalidException(
					"request and response can not be null");
		}

		int currentPage = ParseRequest.parseCurrentPage(request, model);

		HqlQueryCondition query = new HqlQueryCondition();

		query.setFirstResult(currentPage * PageConfigUtil.PAGE_COUNT_SIZE_20);
		query.setMaxResults(PageConfigUtil.PAGE_COUNT_SIZE_20);

		query.setOrderName("createTime");
		query.setAesc(false);

		try {

			return adminDAO.getListByQueryCondtion(TbActivity.class, query);
		} catch (DataAccessException e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	
	/**
	 * 根据查询条件： 分页或者全部显示具体商家的流水， 这里会返回商品名称以及商家名等信息
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	public List<CacheTransaction> generateCacheTransactionList(
			HttpServletRequest request, Map<String, Object> model,
			boolean isExportData){
		List<TbTransactionRecord> transactions = generateTransactionList(
				request, model, isExportData);
		// 如果没有查询到 则直接返回
		if (null == transactions || transactions.size() == 0) {
			logger.warn("not find TransactionRecords,return");
			return null;
		}

		List<CacheTransaction> cacheTransactions = new ArrayList<CacheTransaction>();
		String tmpProductName = null;
		String tmpMchShopName = null;
		CacheTransaction tmpCacheTransaction = null;

		MchStaffProductCacheManager manager = MchStaffProductCacheManager
				.getInstance();
		for (TbTransactionRecord transaction : transactions) {
			tmpCacheTransaction = new CacheTransaction();
			tmpCacheTransaction.setTransaction(transaction);

			String extPropsStr = transaction.getExtProps();
			Map<String, Object> userExtPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				userExtPropsMap = new HashMap();
			} else {
				userExtPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}
			
			JSONArray gouwucheIds = (JSONArray)userExtPropsMap.get("gouwucheIds");
			if(null == gouwucheIds ||  gouwucheIds.size() == 0){
				tmpProductName = manager
						.getProductById(transaction.getFkProductId()).getProduct()
						.getProductName();
				tmpCacheTransaction.setProductName(tmpProductName);
			}
			
			tmpMchShopName = manager
					.getMchUserById(transaction.getFkMchId()).getShopName();

			tmpCacheTransaction.setMchShopName(tmpMchShopName);
			
			TbMchStaff staff = manager.getStaff(transaction.getFkStaffId(), null);
			tmpCacheTransaction.setMchStaff(staff);
			
			tmpCacheTransaction.setCacheMch(manager.getCacheMchUserById(transaction.getFkMchId()));
			
			TransactionStatusEnum[] statusEnums = TransactionStatusEnum.values();
			for(TransactionStatusEnum tran:statusEnums){
				if(tran.getStatusInt() == transaction.getRecordStatus()){
					tmpCacheTransaction.setStatusMsg(tran.getStatusMsg());
					break ;
				}
			}
			
			cacheTransactions.add(tmpCacheTransaction);
		}

		return cacheTransactions;
	}
	
	/**
	 * 根据查询条件 ： 分页或者全部显示的方式查询具体的商家账户的 流水
	 * 
	 * @author snnile2012
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private List<TbTransactionRecord> generateTransactionList(
			HttpServletRequest request, Map<String, Object> model,
			boolean isExportData) {
		if (null == request || null == model) {
			logger.error("request or model can not be null");
			return null;
		}

		int currentPage = ParseRequest.parseCurrentPage(request, model);

		HqlQueryCondition query = new HqlQueryCondition();

		// 不是导出数据就分页显示，是导出数据则按照日期检索
		if (!isExportData) {
			query.setFirstResult(currentPage * PageConfigUtil.PAGE_COUNT_SIZE_20);
			query.setMaxResults(PageConfigUtil.PAGE_COUNT_SIZE_20);
		} else {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			if (StringUtils.isBlank(year) || StringUtils.isBlank(month)) {
				logger.error("request must have year and month");
				return null;
			}
			logger.info("year=" + year + ",month=" + month);

			Date selectDate = DateUtil.StringToDate(year + "-" + month,
					"yyyy-MM");
			Date start = DateUtil.getFirstDayOfMonth(selectDate);
			Date end = DateUtil.getLastDayOfMonth(selectDate);
			query.getProperties().add(
					new Property(Relation.GE, "recordTime", start));
			query.getProperties().add(
					new Property(Relation.LE, "recordTime", end));

		}

		query.setOrderName("recordTime");
		query.setAesc(false);

		String fkProductId = request.getParameter("fkProductId");
		if (StringUtils.isNotBlank(fkProductId)
				&& StringUtils.isNumeric(fkProductId)) {
			model.put("fkProductId", fkProductId);
			query.getProperties().add(
					new Property(Relation.EQ, "fkProductId", Integer
							.valueOf(fkProductId)));
		}
		
		
		String fkMchId = request.getParameter("fkMchId");
		if (StringUtils.isNotBlank(fkMchId)
				&& StringUtils.isNumeric(fkMchId)) {
			model.put("fkMchId", fkMchId);
			query.getProperties().add(
					new Property(Relation.EQ, "fkMchId", Integer
							.valueOf(fkMchId)));
		}
		

		long count = adminDAO.getCountByQueryCondtion(TbTransactionRecord.class,
				query);
		
		model.put("allTransactionPages", count);
		
		return adminDAO.getListByQueryCondtion(TbTransactionRecord.class,
				query);
	}
	
	
	/**
	 * 管理员查看所有商家一周流水 图表数据 : 可以做缓存，只实时查询当天的流水
	 * 
	 * @param request
	 * @param model
	 * @return 当前日期往前的一周的流水数据
	 */
	@SuppressWarnings("unchecked")
	public List<TransactionReportBean> generateOneWeekTransactionRecords(
			HttpServletRequest request, Map<String, Object> model){
		HqlQueryCondition query = new HqlQueryCondition();
		Property pStart = null;
		Property pEnd = null;
		List<TransactionReportBean> reports = new ArrayList<TransactionReportBean>();
		for (int i = 0; i < 7; i++) {
			query.getProperties().remove(pStart);
			query.getProperties().remove(pEnd);
			String day = DateUtil.getDayOverTime(-i);
			pStart = new Property(Relation.LE, "recordTime",
					DateUtil.getDayOverTimeDate(-i + 1));
			query.getProperties().add(pStart);
			pEnd = new Property(Relation.GE, "recordTime",
					DateUtil.getDayOverTimeDate(-i));
			query.getProperties().add(pEnd);

			long countFee = adminDAO.sumByQueryCondtion(
					TbTransactionRecord.class, query, "recordMoney");
			logger.info("the day:" + day + ",and the countFee=" + countFee);
			reports.add(new TransactionReportBean(day, countFee));
		}

		return reports;
	}
	
	/** 查询所有商户，支持分页方式
	 * @param request
	 * @param response
	 */
	@SuppressWarnings("unchecked")
	public List<TbMch> getMchUsers(HttpServletRequest request,
								   HttpServletResponse response, Map<String, Object> model)throws HappyLifeException{
		
		if (null == request || null == response) {
			logger.error("request or model can not be null");

			throw new RequestInvalidException(
					"request and response can not be null");
		}

		int currentPage = ParseRequest.parseCurrentPage(request, model);

		HqlQueryCondition query = new HqlQueryCondition();

		query.setFirstResult(currentPage * PageConfigUtil.PAGE_COUNT_SIZE_20);
		query.setMaxResults(PageConfigUtil.PAGE_COUNT_SIZE_20);

		query.setOrderName("registerTime");
		query.setAesc(true);
		
		try {
			return adminDAO.getListByQueryCondtion(TbMch.class, query);
		} catch (DataAccessException e) {
			logger.error(e.getMessage());
			return null;
		}
	}

	
	/**
	 * 根据表类型查询数据
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List queryListByClassType(HttpServletRequest request,
			HttpServletResponse response, Map<String, Object> model,
			Class objClass,String orderName) throws HappyLifeException {
		
		if (null == request || null == response) {
			logger.error("request or model can not be null");

			throw new RequestInvalidException(
					"request and response can not be null");
		}

		int currentPage = ParseRequest.parseCurrentPage(request, model);

		HqlQueryCondition query = new HqlQueryCondition();

		query.setFirstResult(currentPage * PageConfigUtil.PAGE_COUNT_SIZE_20);
		query.setMaxResults(PageConfigUtil.PAGE_COUNT_SIZE_20);

		query.setOrderName(orderName);
		query.setAesc(true);
		
		try {
			return adminDAO.getListByQueryCondtion(objClass, query);
		} catch (DataAccessException e) {
			logger.error(e.getMessage());
			return null;
		}
		
	}

	/**
	 * 新增或者更新一个商户信息
	 */
	@SuppressWarnings("unchecked")
	@Override
	public boolean saveOrUpdateMchUser(HttpServletRequest request,
			HttpServletResponse response, ModelMap model)
			throws HappyLifeException {
		// 从request里面提取商品信息
		// 把商家信息读取出来
		TbAdmin admin = (TbAdmin) request.getSession().getAttribute(
				IndexConfig.ADMIN_SESSION_KEY);
		
		//重定向到登陆
		if(null == admin){
			logger.error("admin session time out ,to login ");
			try {
				response.sendRedirect(request.getContextPath()+PageConfigUtil.AdminPage.TO_LOGIN_URI);
			} catch (IOException e) {
				logger.error(e.getMessage());
			}
			
			return false;
		}

		logger.info("begin to generate  mchuserInfo" );
		String mchUUid = StrUtil.getUUID();
		try {
			// 生成新图片的公共前缀
			String newFilePrefix = mchUUid;
			TbMch newMch = ParseRequest.generateNewMchInfo(request,
					newFilePrefix);
			if (null == newMch) {
				logger.error("generate new mch info failed");
				return false;
			}
			
			newMch.setPoints(5);//默认都是5星商家

			Integer fkAdminId = admin.getAdminId();

			Map<String, Object> extPropsMap = new HashMap<String, Object>();
			extPropsMap.put("mchUUid", mchUUid);
			extPropsMap.put("fkAdminId", fkAdminId);

			newMch.setExtProps(JSON.toJSONString(extPropsMap));

			// 存到数据库
			Integer mchId = adminDAO.persist(newMch);
			newMch.setMchId(mchId);

			logger.warn("add new mch, mch id=" + newMch.getMchId() + " name="
					+ newMch.getMchName() + " , belong to admin id="+ admin.getAdminId());
			// 刷新内存
			MchStaffProductCacheManager.getInstance().addMchUser(newMch);
			return true;
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			
			return false ;
		}
	}
	
	

}
