package happylife.util.requestandresponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import happylife.model.TbAdmin;
import happylife.model.TbMch;
import happylife.model.TbMchStaff;
import happylife.model.TbProduct;
import happylife.model.TbTransactionRecord;
import happylife.model.TbWechatUser;
import happylife.model.servicemodel.CacheProduct;
import happylife.model.servicemodel.CacheWechatUser;
import happylife.model.servicemodel.MchSearchCondition;
import happylife.model.servicemodel.MchServiceStatusEnum;
import happylife.model.servicemodel.ProductSearchCondition;
import happylife.service.exception.RequestInvalidException;
import happylife.util.DesUtil;
import happylife.util.MuiltFileUploadUtil;
import happylife.util.StrUtil;
import happylife.util.cache.MchStaffProductCacheManager;
import happylife.util.config.IndexConfig;
import happylife.util.config.WinterOrangeSysConf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jodd.util.StringUtil;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSON;

/**
 * @author 闫朝喜
 * 
 *         by 2016-5-21
 */
public class ParseRequest {

	private static final Log logger = LogFactory.getLog(ParseRequest.class);

	/**
	 * 解析 admin账户的登录信息
	 * 
	 * @param request
	 * @return
	 */
	public static TbAdmin generateAdminInfo(HttpServletRequest request) {
		if (null == request) {
			logger.error("the request is null");
			return null;
		}

		TbAdmin adminInfo = new TbAdmin();
		String name = request.getParameter("name");
		adminInfo.setAdminName(name);
		String passwd = request.getParameter("passwd");
		adminInfo.setAdminPasswd(passwd);
		logger.info("name:" + name + " and passwd:" + passwd);

		return adminInfo;
	}

	/**
	 * 解析 商家账户的登录信息
	 * 
	 * @param request
	 * @return
	 */
	public static TbMch generateMchUserLoginInfo(HttpServletRequest request) {
		if (null == request) {
			logger.error("the request is null");
			return null;
		}

		TbMch mchUserInfo = new TbMch();
		String name = request.getParameter("name");
		mchUserInfo.setMchName(name);
		String passwd = request.getParameter("passwd");
		mchUserInfo.setMchPasswd(passwd);
		logger.info("name:" + name + " and passwd:" + passwd);

		return mchUserInfo;
	}
	
	/**
	 * 解析 商家账户的登录信息
	 * 
	 * @param request
	 * @return
	 */
	public static TbAdmin generateAdminLoginInfo(HttpServletRequest request) {
		if (null == request) {
			logger.error("the request is null");
			return null;
		}

		TbAdmin admin = new TbAdmin();
		String name = parseRequestByType("name", true, request);
		admin.setAdminName(name);
		String passwd = parseRequestByType("passwd", true, request);
		admin.setAdminPasswd(passwd);
		logger.info("name:" + name + " and passwd:" + passwd);

		return admin;
	}
	

	/**
	 * 解析 商家账户的登录信息
	 * 
	 * @param request
	 * @return
	 * @throws RequestInvalidException
	 */
	public static TbMch generateNewMchUserInfo(HttpServletRequest request)
			throws RequestInvalidException {

		if (null == request) {
			logger.error("the request is null");
			throw new RequestInvalidException("request is null");
		}

		TbMch mchUserInfo = new TbMch();

		String mchShopName = request.getParameter("shopName");
		mchUserInfo.setShopName(mchShopName);
		String mchShopAddress = request.getParameter("shopAddress");
		mchUserInfo.setShopAddress(mchShopAddress);
		String mchPhoneNum = request.getParameter("phoneNum");
		mchUserInfo.setPhoneNum(mchPhoneNum);
		
		String seviceStatus = request.getParameter("serviceStatus");
		mchUserInfo.setServiceStatus(seviceStatus);
		
		String serviceTime = request.getParameter("serviceTime");
		mchUserInfo.setExtProps(serviceTime);
		
		String phoneNum = request.getParameter("phoneNum");
        mchUserInfo.setPhoneNum(phoneNum);
        
        String  fkOpenId = request.getParameter("fkOpenId");
        mchUserInfo.setFkOpenId(fkOpenId);
        
        String email = request.getParameter("email");
        mchUserInfo.setEmail(email);
        
        String shopDetail =  request.getParameter("shopDetail");
        mchUserInfo.setShopDetail(shopDetail);
        
        

		logger.info("newShopName:" + mchShopName + " and new mchShopAddress:"
				+ mchShopAddress + "new mchPhoneNum" + mchPhoneNum);

		return mchUserInfo;
	}

	/**
	 * 商家账户新增一个商品，通过请求封装一个商品信息
	 * 
	 * @param request
	 * @return
	 */
	public static TbProduct generateNewProductInfo(HttpServletRequest request,
			String newFilePreFix) {
		Map<String, String> formFilds = null;
		TbProduct newProduct = null;
		try {
			
			String pathPrefix = IndexConfig.PROJECT_ABSTRACT_PATH_ALIYUN_STRING;//默认是阿里云的
			if(WinterOrangeSysConf.IN_TEST_MODEL){
				pathPrefix = IndexConfig.PROJECT_ABSTRACT_PATH_TEST_STRING;
			}
			
			logger.info("generateNewProductInfo,now system is in testmodel="+WinterOrangeSysConf.IN_TEST_MODEL+",and pathPrefix="+pathPrefix);
			
			formFilds = MuiltFileUploadUtil.parseRequestAndUploadFile(pathPrefix+
						IndexConfig.MCHUSER_PRODUCTS_PICTURE_TMEP_BASEPATH,pathPrefix+
						IndexConfig.MCHUSER_PRODUCTS_PICTURE_SAVE_BASEPATH,
						newFilePreFix, request);
		
			
			newProduct = new TbProduct();
			newProduct.setCreateTime(new Date());
			if(StringUtils.isBlank(formFilds.get("discountPrice"))||StringUtils.isBlank(formFilds.get("productPrice"))
					||StringUtils.isBlank(formFilds.get("productType"))){
				logger.error("the input illegall,return null");
				return null ;
			}
			
				
			newProduct.setDiscountPrice(Integer.valueOf(formFilds.get("discountPrice")));
			formFilds.remove("discountPrice");
			newProduct.setProductName(formFilds.get("productName"));
			formFilds.remove("productName");
			newProduct.setProductPrice(Integer.valueOf(formFilds.get("productPrice")));
			formFilds.remove("productPrice");
			newProduct.setProductDescription(formFilds.get("productDescription"));
			formFilds.remove("productDescription");
			newProduct.setProductType(formFilds.get("productType"));
			formFilds.remove("productType");
			newProduct.setProductHeadPicture((IndexConfig.MCHUSER_PRODUCT_PICTURE_IN_DB+formFilds.get("headFile")).replace("\\", "/"));
			formFilds.remove("headFile");
			newProduct.setDislikeCounts(0);
			newProduct.setDiscountPercent((int)((double)newProduct.getDiscountPrice()/newProduct.getProductPrice()) * 100);
			newProduct.setProductType("jisi");
			newProduct.setSaleTotalMoney(0);
			newProduct.setSaleTotalTimes(0);
			newProduct.setProductStatus(0);
			newProduct.setModifyTime(new Date());
			newProduct.setLikeCounts(0);
			
			StringBuilder sb = new StringBuilder();
			Iterator<String> it = formFilds.keySet().iterator();
			while(it.hasNext())
			{
				String key = it.next();
				String value = formFilds.get(key);
				if(key.contains(StrUtil.CONTENT_FILE_STR))
				{
					sb.append(IndexConfig.MCHUSER_PRODUCT_PICTURE_IN_DB);
					sb.append(value);
					sb.append(StrUtil.SPLIT_STR);
				}
				
			}
			
			String contentPicture = sb.toString().substring(0, sb.toString().lastIndexOf(StrUtil.SPLIT_STR)).replace("\\", "/");
			newProduct.setProductContentPicture(contentPicture);
		
		} catch (FileUploadException e) {
			logger.error(e.getMessage());
			return null;
			// e.printStackTrace();
		} catch (IOException e) {
			logger.error(e.getMessage());
			return null;
		}

		return newProduct;
	}
	
	
	/**
	 * 商家账户新增一个商品，通过请求封装一个商品信息
	 * 
	 * @param request
	 * @return
	 */
	public static TbMch generateNewMchInfo(HttpServletRequest request,
			String newFilePreFix) {
		Map<String, String> formFilds = null;
		TbMch newMch = null;
		try {
			
			String pathPrefix = IndexConfig.PROJECT_ABSTRACT_PATH_ALIYUN_STRING;
			if(WinterOrangeSysConf.IN_TEST_MODEL){
				pathPrefix = IndexConfig.PROJECT_ABSTRACT_PATH_TEST_STRING;
			}
			logger.info("generateNewMchInfo,now system is in testmodel="+WinterOrangeSysConf.IN_TEST_MODEL+",and pathPrefix="+pathPrefix);

			formFilds = MuiltFileUploadUtil.parseRequestAndUploadFile(pathPrefix+
					IndexConfig.MCHUSER_PICTURE_TMEP_BASEPATH,pathPrefix+
					IndexConfig.MCHUSER_PICTURE_SAVE_BASEPATH,
					newFilePreFix, request);
			
			newMch = new TbMch();
			newMch.setRegisterTime(new Date());
			newMch.setTotalFans(0);
			newMch.setTotalMoney(0);
			newMch.setAverageTime(30);
			newMch.setTotalSaleCount(0);
			newMch.setTotalVisitor(0);
			newMch.setMchStatus(1);
			newMch.setPoints(5);
			newMch.setPoints(0);
			newMch.setServiceType(0);;
			newMch.setModifyTime(new Date());
			newMch.setServiceStatus(MchServiceStatusEnum.IN_SERVICE.getStatusMsg());

			//一些必填属性
			if(StringUtils.isBlank(formFilds.get("mchName"))||StringUtils.isBlank(formFilds.get("phoneNum"))
					||StringUtils.isBlank(formFilds.get("fkOpenId"))||StringUtils.isBlank("shopDetail") 
							|| StringUtils.isBlank("shopName")|| StringUtils.isBlank("shopAddress")){
			logger.error("the input illegall,return null");
				return null ;
			}
			
			newMch.setMchLelvel(Integer.valueOf(formFilds.get("mchLevel")));
			formFilds.remove("mchLelvel");
	
			newMch.setEmail(formFilds.get("email"));
			formFilds.remove("email");
			
			newMch.setShopName(formFilds.get("shopName"));
			formFilds.remove("shopName");
			
			newMch.setMchName(formFilds.get("mchName"));
			formFilds.remove("mchName");
			
			newMch.setPhoneNum(formFilds.get("phoneNum"));
			formFilds.remove("phoneNum");
			
			newMch.setFkOpenId(formFilds.get("fkOpenId"));
			formFilds.remove("fkOpenId");
			
			newMch.setShopAddress(formFilds.get("shopAddress"));
			formFilds.remove("shopAddress");
			
			newMch.setShopDetail(formFilds.get("shopDetail"));
			formFilds.remove("shoDetail");

			
			newMch.setMchPasswd(DesUtil.encrypt("666666"));
			
			StringBuilder sb = new StringBuilder();
			Iterator<String> it = formFilds.keySet().iterator();
			while(it.hasNext())
			{
				String key = it.next();
				String value = formFilds.get(key);
				if(key.contains(StrUtil.CONTENT_FILE_STR))
				{
					sb.append(IndexConfig.MCHUSER_PICTURE_IN_DB);
					sb.append(value);
					sb.append(StrUtil.SPLIT_STR);
				}
				
			}
			
			String contentPicture = sb.toString().substring(0, sb.toString().lastIndexOf(StrUtil.SPLIT_STR));
			newMch.setContentPicture(contentPicture);
			
		} catch (FileUploadException e) {
			logger.error(e.getMessage());
			return null;
		} catch (IOException e) {
			logger.error(e.getMessage());
			return null;
		}
		
		return newMch;
	}
	
	
	/** staff 结束订单需要根据超文本生成一个 包含上传图片的 transaction
	 * @param request
	 * @return
	 */
	public static TbTransactionRecord generateNewTransaction(HttpServletRequest request,
			String newFilePreFix) {
		Map<String, String> formFilds = null;
		TbTransactionRecord record = null;
		try {
			String pathPrefix = IndexConfig.PROJECT_ABSTRACT_PATH_ALIYUN_STRING;
			if(WinterOrangeSysConf.IN_TEST_MODEL){
				pathPrefix = IndexConfig.PROJECT_ABSTRACT_PATH_TEST_STRING;
			}
			
			logger.info("generateNewTransaction,now system is in testmodel="+WinterOrangeSysConf.IN_TEST_MODEL+",and pathPrefix="+pathPrefix);
			formFilds = MuiltFileUploadUtil.parseRequestAndUploadFile(pathPrefix+
					IndexConfig.MCHUSER_PICTURE_TMEP_BASEPATH,pathPrefix+
					IndexConfig.MCHUSER_PICTURE_SAVE_BASEPATH,
					newFilePreFix, request);
			
			record = new TbTransactionRecord();
		
			//一些必填属性
			if(StringUtils.isBlank(formFilds.get("detail"))){
				logger.error("the input illegall,return null");
				return null ;
			}
			
			Map<String,String> extProps = new HashMap();
			
			extProps.put("detail", formFilds.get("detail"));
			formFilds.remove("detail");
			
			
			StringBuilder sb = new StringBuilder();
			Iterator<String> it = formFilds.keySet().iterator();
			while(it.hasNext())
			{
				String key = it.next();
				String value = formFilds.get(key);
				if(key.contains(StrUtil.CONTENT_FILE_STR))
				{
					sb.append(IndexConfig.MCHUSER_PICTURE_IN_DB);
					sb.append(value);
					sb.append(StrUtil.SPLIT_STR);
				}
				
			}
			
			String contentPicture = sb.toString().substring(0, sb.toString().lastIndexOf(StrUtil.SPLIT_STR));
			extProps.put("contentPicture", contentPicture);
			record.setExtProps(JSON.toJSONString(extProps));
		} catch (FileUploadException e) {
			logger.error(e.getMessage());
			return null;
		} catch (IOException e) {
			logger.error(e.getMessage());
			return null;
		}
		
		return record;
	}

	/**
	 * 解析 商家账户 修改密码信息,解析有误则返回
	 * 
	 * @param request
	 * @return
	 */
	public static String[] genChangePasswdInfo(HttpServletRequest request) {
		if (null == request) {
			logger.error("the request is null");
			return null;
		}

		String[] changPasswdInfo = new String[3];
		String oldPasswd = request.getParameter("oldPasswd");
		changPasswdInfo[0] = oldPasswd;
		String newPasswd = request.getParameter("newPasswd");
		changPasswdInfo[1] = newPasswd;
		String confirmPasswd = request.getParameter("confirmPasswd");
		changPasswdInfo[2] = confirmPasswd;
		if (StringUtils.isBlank(oldPasswd) || StringUtils.isBlank(newPasswd)
				|| StringUtils.isBlank(confirmPasswd)) {
			return null;
		}

		return changPasswdInfo;
	}

	/**
	 * 解析美食广场查询 美食的条件
	 * 
	 * @param request
	 * @return
	 */
	public static List<ProductSearchCondition> generateSearchConditions(
			HttpServletRequest request) {
		List<ProductSearchCondition> foodSearchConditions = null;
		if (null == request) {
			logger.error("the request is null");
			return foodSearchConditions;
		}
		String mchId = request
				.getParameter(ProductSearchCondition.ConditionName.MCHUSER_ID);
		foodSearchConditions = new ArrayList<ProductSearchCondition>();
		boolean isConditionValid = false;
		// 先判断传入的商家Id是否正确
		if (StringUtils.isNotBlank(mchId) && StringUtils.isNumeric(mchId)) {
			isConditionValid = true;
			foodSearchConditions.add(new ProductSearchCondition(
					ProductSearchCondition.RelationType.EQUAL,
					ProductSearchCondition.ConditionName.MCHUSER_ID, Integer
							.valueOf(mchId)));
		}

		String type = request
				.getParameter(ProductSearchCondition.ConditionName.TYPE);
		if (StringUtils.isNotBlank(type)) {
			isConditionValid = true;
			foodSearchConditions.add(new ProductSearchCondition(
					ProductSearchCondition.RelationType.CONTAIN,
					ProductSearchCondition.ConditionName.TYPE, type));
		}

		logger.info("fkmchId=" + mchId + ",type=" + type);
		return isConditionValid ? foodSearchConditions : null;

	}
	
	
	/**
	 * 解析商家检索的条件
	 * 
	 * @param request
	 * @return
	 */
	public static List<MchSearchCondition> generateMchSearchConditions(
			HttpServletRequest request) {
		List<MchSearchCondition> mchSearchConditions = null;
		if (null == request) {
			logger.error("the request is null");
			return mchSearchConditions;
		}
		String mchName = request
				.getParameter(MchSearchCondition.ConditionName.MCH_NAME);
		mchSearchConditions = new ArrayList<MchSearchCondition>();
		boolean isConditionValid = false;
		// 先判断传入的商家名是否正确
		if (StringUtils.isNotBlank(mchName)) {
			isConditionValid = true;
			mchSearchConditions.add(new MchSearchCondition(
					MchSearchCondition.RelationType.CONTAIN,
					MchSearchCondition.ConditionName.MCH_NAME,mchName));
		}
		
		String address = request
				.getParameter(MchSearchCondition.ConditionName.MCH_ADDRESS);
		if (StringUtils.isNotBlank(address)) {
			isConditionValid = true;
			mchSearchConditions.add(new MchSearchCondition(
					MchSearchCondition.RelationType.CONTAIN,
					MchSearchCondition.ConditionName.MCH_ADDRESS, address));
		}
		
		logger.info("mchName=" + mchName + ",address=" + address);
		return isConditionValid ? mchSearchConditions : null;
		
	}

	/**
	 * 解析请求中的当前页参数 并放到 request中
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	public static int parseCurrentPage(HttpServletRequest request,
			Map<String, Object> model) {
		int currentPage = 0;
		if (null == request || null == model) {
			logger.error("request or model can not be null");
			model.put("currentPage", currentPage);
			return currentPage;
		}

		String currentPageStr = request.getParameter("currentPage");
		logger.debug("the currentPageStr=" + currentPageStr);
		if (StringUtils.isNotBlank(currentPageStr)
				&& StringUtils.isNumeric(currentPageStr)) {
			currentPage = Integer.valueOf(currentPageStr);
			currentPage = currentPage < 0 ? 0: currentPage;
		}

		model.put("currentPage", currentPage);
		return currentPage;
	}
	
	/** 从 request 中解析含有指定 key的值是否存在，如果是 希望数字 则 会判断解析的数值是否为 数字： 不是数字则返回null
	 * @param key
	 * @param isString
	 * @param request
	 * @return
	 */
	public static String  parseRequestByType (String key ,boolean isString, HttpServletRequest request)
	{
		if(null == key || null == request)
		{
			logger.error("key or request is invalid");
			return null ;
		}
	
		String value = request.getParameter(key);
		if(null == value)
		{
			logger.error("request does not have the key:"+key);
			return null ;
		}
		
		logger.debug("the value is ="+value);
		//如果期望的value类型是字符串 则直接返回
		if(isString)
		{
			return value ;
		}
		
		//不是字符串 则只能是数字类型
		if (StringUtils.isNotBlank(value)
				&& StringUtils.isNumeric(value)) {
			return value;
		}
		
		logger.debug("wish is numric, but not.");
		return null;
		
	}
	
	/**从 session中解析对象
	 * @param key
	 * @param type
	 * @param request
	 * @return
	 */
	public static Object getObjectFromSession(String key ,Class<?> type,HttpServletRequest request){
		if(StringUtils.isBlank(key) || null == request)
		{
			logger.error("key or request is invalid");
			return null ;
		}
		
		Object returnObj = request.getSession().getAttribute(key);
		
		if(null == returnObj)
		{
			logger.error("does not have key="+key);
			return null;
		}
		
		if(type.isInstance(returnObj))
		{
			return returnObj;
		}
		
		logger.error("the session does not have the right type");
		
		return null;
	}
	
	/**
	 * 从缓存根据 productId 查询一条 商品记录
	 * 
	 * @param request
	 * @return
	 */
	public static CacheProduct findCacheProduct(HttpServletRequest request) {
		if(null == request)
		{
			logger.error("request can not be null ");
			return null ;
		}
		
		String productId = ParseRequest.parseRequestByType("productId", false,
				request);
		if (null == productId) {
			return null;
		}
		CacheProduct product = MchStaffProductCacheManager.getInstance()
				.getProductById(Integer.valueOf(productId));

		return product;

	}
	
	//从session解密商家的fkId
	public static  Integer getMchUserIdFromSession(HttpServletRequest request) {
		String fkMchIdDes = (String) request.getSession().getAttribute(
				IndexConfig.MCHUSER_SESSION_KEY);
		/* 这样的方式默认按照 以 商家为维度 查询商品的方式 */
		if (StringUtils.isBlank(fkMchIdDes)) {
			logger.error("fkMchId can not be null,return");
			return null;
		}

		String fkMchId = DesUtil.decrypt(fkMchIdDes);
		logger.info("fkMchId is:" + fkMchId);
		if (!StringUtils.isNumeric(fkMchId)) {
			logger.error("fkMchId must be numeric,return");
			return null;
		}

		return Integer.valueOf(fkMchId);
	}
	
	
	
	/**
	 * 从request解析新增或者更新的staff信息
	 * @param request
	 * @return
	 */
	public static TbMchStaff getMchStaffFromRequest(HttpServletRequest request){
		if(request == null)
			return null ;
	
		String  temStr = request.getParameter("id");
		
		TbMchStaff newStaff = new TbMchStaff();
		if(StringUtil.isNotBlank(temStr)){
			newStaff.setId(Integer.valueOf(temStr));
		}
		
		temStr = request.getParameter("fkMchId");
		if(StringUtil.isNotBlank(temStr)){
			newStaff.setFkMchId(Integer.valueOf(temStr));
		}
		
		temStr = request.getParameter("name");
		if(StringUtil.isNotBlank(temStr)){
			newStaff.setName(temStr);
		}
		
		temStr = request.getParameter("nickName");
		if(StringUtil.isNotBlank(temStr)){
			newStaff.setNickName(temStr);
		}
		
		temStr = request.getParameter("status");
		if(StringUtil.isNotBlank(temStr)){
			newStaff.setStatus(temStr);
		}
		
		temStr = request.getParameter("phoneNum");
		if(StringUtil.isNotBlank(temStr)){
			newStaff.setPhoneNum(temStr);
		}
		
		temStr = request.getParameter("detail");
		if(StringUtil.isNotBlank(temStr)){
			newStaff.setDetail(temStr);
		}
		
		temStr = request.getParameter("fkOpenId");
		if(StringUtil.isNotBlank(temStr)){
			newStaff.setFkOpenId(temStr);
		}
		
		return newStaff;
	}
	
	

	/**
	 * 从session中取用户信息
	 * 
	 * @param request
	 * @return
	 */
	public static  CacheWechatUser getWechatUserFromSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		CacheWechatUser wechatUser = (CacheWechatUser) session
				.getAttribute(IndexConfig.SESSION_WECHATUSER_KEY);
		return wechatUser;
	}
	
	
	/**
	 * 从session中取用户信息
	 * 
	 * @param request
	 * @return
	 */
	public static  void removeWechatUserFromSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
        session.removeAttribute(IndexConfig.SESSION_WECHATUSER_KEY);
	
	}
	
	

}
