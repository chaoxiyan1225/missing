package happylife.controller;

import happylife.model.TbMchStaff;
import happylife.model.TbTransactionRecord;
import happylife.model.TbWechatUser;
import happylife.model.servicemodel.CacheProduct;
import happylife.model.servicemodel.CacheTransaction;
import happylife.model.servicemodel.CacheWechatUser;
import happylife.model.servicemodel.TbMuweihao;
import happylife.model.servicemodel.TransactionStatusEnum;
import happylife.service.WeChatUserService;
import happylife.service.exception.HappyLifeException;
import happylife.util.StrUtil;
import happylife.util.cache.MchStaffProductCacheManager;
import happylife.util.config.IndexConfig;
import happylife.util.config.PageConfigUtil;
import happylife.util.config.WinterOrangeSysConf;
import happylife.util.requestandresponse.ParseRequest;
import happylife.util.requestandresponse.ResponseToClient;
import happylife.util.requestandresponse.WeChatRequestUtil;
import happylife.util.requestandresponse.messagebean.ResultMsgBean;
import happylife.util.service.WechatUserUtil;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 微信用户的controller类，处理微信界面转接来的各种请求上面的用户的各类请求
 * 
 * @author 闫朝喜
 */
@Controller
@RequestMapping(PageConfigUtil.WECHAT_PREFIX)
public class WechatYunjisiController {
	private static final Log logger = LogFactory
			.getLog(WechatYunjisiController.class);

	@SuppressWarnings("rawtypes")
	@Autowired
	private WeChatUserService wechatUserService;

	/**
	 * wechat用户查看单一订单信息
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/daijisi")
	public ModelAndView toYunjisiIndex(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return null;
			}

			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
							.getUserId());
			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return null;
			}

			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}

			// 生成购物车数据
			genGouwucheCnt(extPropsMap, model);
			return new ModelAndView("daijisiindex");
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return null;
		}

	}

	/**
	 * wechat用户查看单一订单信息
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/index")
	public ModelAndView toIndex(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("index");
	}

	/**
	 * wechat用户查看单一订单信息
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/fuluyuan")
	public ModelAndView toFuluyuan(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {

		return new ModelAndView("fuluyuan");
	}
	
	/**
	 * wechat生命晶石
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/jingshi")
	public ModelAndView toJingshi(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("jingshi");
	}
	
	
	/**
	 * wechat 到安息堂界面
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/anxitang")
	public ModelAndView toAnxitang(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("anxitang");
	}
	
	/**
	 * wechat 到安息堂界面
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/huimin")
	public ModelAndView toHuimin(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		
		return new ModelAndView("huimin");
	}
	
	/**
	 * wechat用户查看单一订单信息
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/xianhua")
	public ModelAndView xianHualiebiao(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("xianhualist");
	}

	/**
	 * wechat用户查看单一订单信息
	 */
	@RequestMapping("/wode")
	public ModelAndView wode(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {

		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return null;
			}

			// 从ext_props里面解析 字段
			String extPropsStr = cacheChatUser.getWechatUser().getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}
			
			
			boolean  needShow = true;
			
			//判断该用户什么类型？ staff  mch 或者admin?  后续扩展
	    	TbMchStaff staff = MchStaffProductCacheManager.getInstance().getStaff(null, cacheChatUser.getWechatUser().getUserOpenid());
	    	if(null != staff){
	    		logger.warn("the wechat user is staff, user openId="+cacheChatUser.getWechatUser().getUserOpenid());
	    		//该用户同时也是staff 跳转到员工的staff页面
	    		needShow = false;
	    	}
	    	
	    	model.put("needShow", needShow);

			// 生成购物车数据
			genGouwucheCnt(extPropsMap, model);
			return new ModelAndView("user");
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return null;
		}

	}
	
	
    /**
     * wechat用户查看单一订单信息
     */
    @SuppressWarnings("unused")
	@RequestMapping("/todingdanjisi")
    public ModelAndView toWechatsingleTran(ModelMap map, Map<String, Object> model,
    		HttpServletRequest request, HttpServletResponse response) {
    	logger.info("start query  wechat user transactions...");
    	
    	CacheWechatUser cacheChatUser = null ;
    	if(!WinterOrangeSysConf.IN_TEST_MODEL){
    		cacheChatUser = ParseRequest.getWechatUserFromSession(request);
    		if (null == cacheChatUser
    				|| StringUtils.isBlank(cacheChatUser.getWechatUser().getUserOpenid())) {
    			logger.error("wechat user session timeout,re auth");
    			WeChatRequestUtil.redirectToAuthorize(response);
    			return null;
    		}
    	}else{
    		logger.debug("current in test model");
    		cacheChatUser = new CacheWechatUser();
    		TbWechatUser wechatUser = new TbWechatUser();
    		wechatUser.setUserOpenid("st0628");
    		cacheChatUser.setWechatUser(wechatUser);
    	}
    	
 		
		String recordId = ParseRequest.parseRequestByType("recordId",
				false, request);
		if (StringUtils.isBlank(recordId)) {
			logger.error("must query one transaction info ,request has no recordId");
			return new ModelAndView(PageConfigUtil.ERROR_404_PAGE);
		}
		
		@SuppressWarnings("unchecked")
		TbTransactionRecord record;
		try {
			record = (TbTransactionRecord) wechatUserService
			.getById(TbTransactionRecord.class,Integer.valueOf(recordId));
		} catch (NumberFormatException e) {
			logger.error("format  error ,e"+e.getMessage());
			return new ModelAndView(PageConfigUtil.ERROR_500_PAGE);
		} catch (HappyLifeException e) {
			logger.error("get record error ,id="+recordId+","+e.getMessage());
			return new ModelAndView(PageConfigUtil.ERROR_500_PAGE);
		}
		
		if(!WinterOrangeSysConf.IN_TEST_MODEL && 
				(null == cacheChatUser || !record.getFkOpenId().equals(cacheChatUser.getWechatUser().getUserOpenid()))){
			logger.error("the current wechat use have no pernision ,can not query transaction id="+recordId);
			return new ModelAndView(PageConfigUtil.ERROR_403_PAGE);
		}
		
		StringBuilder tmpProductName = new StringBuilder();
		
		CacheTransaction tmpCacheTransaction = null;
		MchStaffProductCacheManager manager = MchStaffProductCacheManager
				.getInstance();

		tmpCacheTransaction = new CacheTransaction();
		tmpCacheTransaction.setTransaction(record);

		TransactionStatusEnum[] statusEnums = TransactionStatusEnum.values();
		for (TransactionStatusEnum tran : statusEnums) {
			if (tran.getStatusInt() == record.getRecordStatus()) {
				tmpCacheTransaction.setStatusMsg(tran.getStatusMsg());
				break;
			}
		}
		
		String tmpMchShopName = manager.getMchUserById(record.getFkMchId()).getShopName();

		tmpCacheTransaction.setMchShopName(tmpMchShopName);
	
		String extPropsStr = record.getExtProps();
		Map<String, Object> extPropsMap = null ;
		if(StringUtils.isNotBlank(extPropsStr)){
			extPropsMap = JSON.parseObject(extPropsStr, Map.class);
		}
		extPropsMap = (extPropsMap == null)? new HashMap():extPropsMap;
		tmpCacheTransaction.setProcessMsg((String)extPropsMap.get("detail"));
		JSONObject jsonmuweihao = (JSONObject) extPropsMap.get("muweihaos");
		jsonmuweihao = jsonmuweihao == null? new JSONObject():jsonmuweihao;
		tmpCacheTransaction.setMuweihao(jsonmuweihao);
		
		String contentPictures = (String)extPropsMap.get("contentPicture");
		String[] pictures = null ;
		if(StringUtils.isNotBlank(contentPictures)){
		   pictures = contentPictures.replace("\\", "/").split(StrUtil.SPLIT_STR);
		}
		
		JSONArray gouwucheIds = (JSONArray)extPropsMap.get("gouwucheIds");
		if(null == gouwucheIds || gouwucheIds.size() == 0){
			logger.warn("the  record have no product, record id="+record.getRecordId());
			return new ModelAndView(PageConfigUtil.ERROR_500_PAGE);
		}
		
		// 生成购物车的商品列表，按单个商品以及对应的数量去组织数据
		ArrayList<CacheProduct> cacheProducts = WechatUserUtil.genCacheProductsForGouwuche(gouwucheIds);
	    for(CacheProduct p:cacheProducts){
	    	tmpProductName.append(p.getProduct().getProductName());
	    	tmpProductName.append("  ");
	    }
	    
	    tmpCacheTransaction.setProductName(tmpProductName.toString());
		tmpCacheTransaction.setContentPictures(pictures);
		model.put("cacheTransaction", tmpCacheTransaction);
    	return new ModelAndView(PageConfigUtil.WECHAT_PREFIX+
    			PageConfigUtil.WechatUserPage.TRANSACTION_WECHAT_ONE_PAGE);
    	
    }

	/**
	 * wechat用户查看单一订单信息
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/gouwuche")
	public ModelAndView gouwuche(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return null;
			}

			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
							.getUserId());
			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return null;
			}

			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}

			JSONArray productIds = (JSONArray) extPropsMap.get("gouwucheIds");

			int productCnt = productIds == null ? 0 : productIds.size();

			model.put("gowuchecnt", productCnt);

			// 生成购物车的商品列表，按单个商品以及对应的数量去组织数据

			if (0 == productCnt) {
				model.put("cacheProducts", new ArrayList());
			} else {

				ArrayList<CacheProduct> cacheProducts = WechatUserUtil.genCacheProductsForGouwuche(productIds);
				model.put("cacheProducts", cacheProducts);
				model.put("mchId", cacheProducts.get(0).getMchUser().getMchId());

				// 计算下总金额以及节省的金额
				calcTotalMoneyAndDiscount(model, cacheProducts);
			}

			JSONArray muweihaos = (JSONArray) extPropsMap.get("muweihaos");

			if (null == muweihaos) {
				model.put("muweihaos", new ArrayList());
			} else {
				model.put("muweihaos", muweihaos);
			}

			return new ModelAndView("gouwuche");
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return null;
		}

	}
	

	/**
	 * 查看所有订单
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/todingdans")
	public ModelAndView todingdans(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				logger.warn("the wechat user is null!");
				return null;
			}
			
			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
							.getUserId());
			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return null;
			}
			
			//判断该用户什么类型？ staff  mch 或者admin?  后续扩展
	    	TbMchStaff staff = MchStaffProductCacheManager.getInstance().getStaff(null, cacheChatUser.getWechatUser().getUserOpenid());
	    	if(null != staff){
	    		logger.warn("the wechat user is staff ,to  staff transaciton page");
	    		//该用户同时也是staff 跳转到员工的staff页面
	    		return toStaffTransactionList(model,request,response,staff);
	    	}

			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}

			// 生成购物车数据
			genGouwucheCnt(extPropsMap, model);
			
			List<CacheTransaction> records = wechatUserService.wechatGetTransactions(model, cacheChatUser.getWechatUser(), request, response);

			model.put("cacheTransactions", records);
			return new ModelAndView("dingdanlist");
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return null;
		}
	}
	
	
    //如果微信用户同时是员工，则需要跳转到员工的订单处理页面
    @SuppressWarnings("unchecked")
	private ModelAndView toStaffTransactionList(Map<String, Object> model,
            HttpServletRequest request, HttpServletResponse response,TbMchStaff staff){
    	
    	//查询staff自己的订单，从数据库查
    	List<CacheTransaction> staffTransaction = wechatUserService.staffGetTransaction(model,staff , request, response);
    	
    	model.put("staff", staff);
    	model.put("cacheTransactions", staffTransaction);
    	return new ModelAndView(PageConfigUtil.WECHAT_PREFIX+
                PageConfigUtil.WechatUserPage.TRANSACTION_LIST_STAFF_PAGE);
    }
	/**
	 * 删除订单
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/deleteDingdan")
	public ModelAndView deleteDingdan(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				logger.warn("the wechat user is null!");
				return null;
			}
			
			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
					.getUserId());
			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return null;
			}
			
			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}
			
			// 生成购物车数据
			genGouwucheCnt(extPropsMap, model);
			
			List<CacheTransaction> records = wechatUserService.wechatGetTransactions(model, cacheChatUser.getWechatUser(), request, response);
			
			model.put("cacheTransactions", records);
			return new ModelAndView("dingdanlist");
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return null;
		}
	}
	
	/**
	 * 查看墓位号
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/muweihao")
	public ModelAndView muweihao(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return null;
			}
			
			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
					.getUserId());
			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return null;
			}
			
			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}
			
			extPropsMap = extPropsMap == null?new HashMap():extPropsMap;
			
			
			JSONArray muweihaos = (JSONArray) extPropsMap.get("muweihaos");
			if (null != muweihaos) {
				map.put("muweihaos", muweihaos);
			} else {
				map.put("muweihaos", new ArrayList());
			}
			
			map.put("muweihaoCnt", muweihaos.size());
			
			// 生成购物车数据
			genGouwucheCnt(extPropsMap, model);
			
			return new ModelAndView("muweihaolist");
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return null;
		}
	}

	/**
	 * 查看墓位号
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/muweihao/add", method = RequestMethod.POST)
	public void addMuweihao(String muweihaoEntry, ModelMap map,
			Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return;
			}

			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
							.getUserId());
			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}

			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}

			JSONArray muweihaos = (JSONArray) extPropsMap.get("muweihaos");
			muweihaos = (muweihaos == null) ? new JSONArray() : muweihaos;

			if (StringUtils.isBlank(muweihaoEntry)) {
				logger.error("muweihao entry error  is null");
				ResultMsgBean Msg = new ResultMsgBean(false, "添加失败请重试");
				ResponseToClient.writeJsonMsg(response, Msg);

				return;
			}

			TbMuweihao muweihao = JSON.parseObject(muweihaoEntry,
					TbMuweihao.class);
			if(StringUtils.isBlank(muweihao.getJisaoBeizhu())){
				muweihao.setJisaoBeizhu("无特殊备注说明");
			}
			
			muweihao.setUuid(String.valueOf(System.currentTimeMillis()));
			// 如果存在不允许添加
			if (WechatUserUtil.queryMuweihao(muweihaos, muweihao) != -1) {
				logger.error("muhaowei exit , muwiehao=" + muweihao.toString());
				ResultMsgBean Msg = new ResultMsgBean(false, "墓位号已存在");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}

			muweihaos.add(muweihao);

			extPropsMap.put("muweihaos", muweihaos);

			user.setExtProps(JSON.toJSONString(extPropsMap));
			
			user.setUserTelNum(muweihao.getJisaoTel());

			wechatUserService.wechatUpdate(user);

			cacheChatUser.setWechatUser(user);

			// 生成购物车数据
			genGouwucheCnt(extPropsMap, model);

			// 更新下session
			cacheChatUser.setWechatUser(user);
			HttpSession session = request.getSession();
			session.setAttribute(IndexConfig.SESSION_WECHATUSER_KEY,
					cacheChatUser);
			ResultMsgBean Msg = new ResultMsgBean(true, "添加成功");
			ResponseToClient.writeJsonMsg(response, Msg);
			return;
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return;
		}
	}

	/**
	 * 删除墓位号
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/muweihao/del", method = RequestMethod.POST)
	public void deleteMuweihao(TbMuweihao muweihao, ModelMap map,
			Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return;
			}
			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
							.getUserId());
			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}

			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}

			JSONArray muweihaos = (JSONArray) extPropsMap.get("muweihaos");
			muweihaos = (muweihaos == null) ? new JSONArray() : muweihaos;

			// 如果不存在不允许添加
			int index = WechatUserUtil.queryMuweihao(muweihaos, muweihao);

			if (index == -1) {
				logger.error("muhaowei not exit , muwiehao="
						+ muweihao.toString());
				ResultMsgBean Msg = new ResultMsgBean(false, "墓位号不存在！");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}

			// 更新墓位号
			muweihaos.remove(index);

			extPropsMap.put("muweihaos", muweihaos);

			user.setExtProps(JSON.toJSONString(extPropsMap));

			wechatUserService.wechatUpdate(user);

			cacheChatUser.setWechatUser(user);

			// 生成购物车数据
			genGouwucheCnt(extPropsMap, model);

			// 更新下session
			cacheChatUser.setWechatUser(user);
			HttpSession session = request.getSession();
			session.setAttribute(IndexConfig.SESSION_WECHATUSER_KEY,
					cacheChatUser);

			ResultMsgBean Msg = new ResultMsgBean(true, "删除成功");
			ResponseToClient.writeJsonMsg(response, Msg);
			return;
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return;
		}
	}
	
	
	/**
	 * 跳转到 更新墓位号界面
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/updateMuweihao")
	public ModelAndView toUpdateMuweihao(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return null;
			}
			
			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
							.getUserId());
			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return null;
			}
			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}
			
			JSONArray muweihaos = (JSONArray) extPropsMap.get("muweihaos");
			muweihaos = (muweihaos == null) ? new JSONArray() : muweihaos;

			
			
			String uuid = request.getParameter("uuid");
			if (StringUtils.isBlank(uuid)) {
				logger.error("paremeter error, uuid is null");
				ResultMsgBean Msg = new ResultMsgBean(false, "未选择商品");
				ResponseToClient.writeJsonMsg(response, Msg);
				return new ModelAndView("404");
			}
			
			
			// 如果不存在不允许添加
			int index = WechatUserUtil.queryMuweihaoBylUuid(muweihaos, uuid);

			if (index == -1) {
				logger.error("muhaowei not exit , uuid="
						+ uuid);
				ResultMsgBean Msg = new ResultMsgBean(false, "墓位号不存在！");
				ResponseToClient.writeJsonMsg(response, Msg);
				return new ModelAndView("404");
			}
			
			
			model.put("muweihao", muweihaos.get(index));
			
			// 生成购物车数据
			genGouwucheCnt(extPropsMap, model);
			return new ModelAndView("updatemuweihao");
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return new ModelAndView(PageConfigUtil.ERROR_500_PAGE);
		}
		
	}
	
	
    //跳转到完成祭祀的完成订单界面，给staff类型的员工使用
    @SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/tofinishjisidingdan")
	public ModelAndView staffToFinishJisidingdan(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			// TODO : 需要查询 所有的 美食类商家以及每个商家先的 美食种类
			// 不是测试模式
			if (!WinterOrangeSysConf.IN_TEST_MODEL) {
				// TODO : 需要查询 所有的 美食类商家以及每个商家先的 美食种类
				CacheWechatUser cacheChatUser = ParseRequest
						.getWechatUserFromSession(request);
				if (null == cacheChatUser
						|| StringUtils.isBlank(cacheChatUser.getWechatUser()
								.getUserOpenid())) {
					logger.error("wechat user session timeout,re auth");
					WeChatRequestUtil.redirectToAuthorize(response);
					return null;
				}
			} else {
				logger.debug("current in test model");
			}

			String recordId = ParseRequest.parseRequestByType("recordId",
					false, request);

			if (StringUtils.isBlank(recordId)) {
				logger.error("must query one transaction info ,request has no recordId");
				return new ModelAndView(PageConfigUtil.ERROR_404_PAGE);
			}

			@SuppressWarnings("unchecked")
			TbTransactionRecord record = (TbTransactionRecord) wechatUserService
					.getById(TbTransactionRecord.class,
							Integer.valueOf(recordId));

			CacheTransaction tmpCacheTransaction = null;

			MchStaffProductCacheManager manager = MchStaffProductCacheManager
					.getInstance();
			tmpCacheTransaction = new CacheTransaction();
			tmpCacheTransaction.setTransaction(record);

			TransactionStatusEnum[] statusEnums = TransactionStatusEnum
					.values();
			for (TransactionStatusEnum tran : statusEnums) {
				if (tran.getStatusInt() == record.getRecordStatus()) {
					tmpCacheTransaction.setStatusMsg(tran.getStatusMsg());
					break;
				}
			}
			
			StringBuilder tmpProductName = new StringBuilder();
			String tmpMchShopName = manager.getMchUserById(record.getFkMchId()).getShopName();
			tmpCacheTransaction.setMchShopName(tmpMchShopName);
		
			String extPropsStr = record.getExtProps();
			Map<String, Object> extPropsMap = null ;
			if(StringUtils.isNotBlank(extPropsStr)){
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}
			extPropsMap = (extPropsMap == null)? new HashMap():extPropsMap;
			tmpCacheTransaction.setProcessMsg((String)extPropsMap.get("detail"));
			JSONObject jsonmuweihao = (JSONObject) extPropsMap.get("muweihaos");
			jsonmuweihao = jsonmuweihao == null? new JSONObject():jsonmuweihao;
			tmpCacheTransaction.setMuweihao(jsonmuweihao);
			
			JSONArray gouwucheIds = (JSONArray)extPropsMap.get("gouwucheIds");
			if(null == gouwucheIds || gouwucheIds.size() == 0){
				logger.warn("the  record have no product, record id="+record.getRecordId());
				return new ModelAndView(PageConfigUtil.ERROR_500_PAGE);
			}
			
			// 生成购物车的商品列表，按单个商品以及对应的数量去组织数据
			ArrayList<CacheProduct> cacheProducts = WechatUserUtil.genCacheProductsForGouwuche(gouwucheIds);
		    for(CacheProduct p:cacheProducts){
		    	tmpProductName.append(p.getProduct().getProductName());
		    	tmpProductName.append("  ");
		    }
		    
		    tmpCacheTransaction.setProductName(tmpProductName.toString());

			TbMchStaff staff = manager.getStaff(record.getFkStaffId(), null);

			if (null != staff) {
				tmpCacheTransaction.setMchStaff(staff);
			}
			
			model.put("cacheTransaction", tmpCacheTransaction);

			return new ModelAndView(PageConfigUtil.WECHAT_PREFIX
					+ PageConfigUtil.WechatUserPage.TRANSACTION_STAFF_ONE_PAGE);

		} catch (Exception e) {
			logger.error(e.getMessage());
			return new ModelAndView(PageConfigUtil.ERROR_500_PAGE);
		}

	}  

	/**
	 * 更新墓位号
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/muweihao/update", method = RequestMethod.POST)
	public void updateMuweihao(String muweihaoEntry, ModelMap map,
			Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return;
			}
			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
							.getUserId());
			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}

			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}

			JSONArray muweihaos = (JSONArray) extPropsMap.get("muweihaos");
			muweihaos = (muweihaos == null) ? new JSONArray() : muweihaos;
			
			if (StringUtils.isBlank(muweihaoEntry)) {
				logger.error("muweihao entry error  is null");
				ResultMsgBean Msg = new ResultMsgBean(false, "更新失败请重试");
				ResponseToClient.writeJsonMsg(response, Msg);

				return;
			}

			TbMuweihao muweihao = JSON.parseObject(muweihaoEntry,
					TbMuweihao.class);

			// 如果不存在不允许修改
			int index = WechatUserUtil.queryMuweihao(muweihaos, muweihao);

			if (index == -1) {
				logger.error("muhaowei not exit , muwiehao="
						+ muweihao.toString());
				ResultMsgBean Msg = new ResultMsgBean(false, "墓位号不存在！");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}

			String uuid = muweihaos.getJSONObject(index).getString("uuid");
			// 更新墓位号，先删除老的
			muweihaos.remove(index);
			muweihao.setUuid(uuid);

			// 再添加新的
			muweihaos.add(muweihao);

			extPropsMap.put("muweihaos", muweihaos);

			user.setExtProps(JSON.toJSONString(extPropsMap));

			wechatUserService.wechatUpdate(user);

			cacheChatUser.setWechatUser(user);

			// 更新下session
			cacheChatUser.setWechatUser(user);
			HttpSession session = request.getSession();
			session.setAttribute(IndexConfig.SESSION_WECHATUSER_KEY,
					cacheChatUser);

			ResultMsgBean Msg = new ResultMsgBean(true, "添加成功");
			ResponseToClient.writeJsonMsg(response, Msg);
			return;
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return;
		}
	}

	/**
	 * wechat用户查看单一订单信息
	 */
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	@RequestMapping("/bangzhuzhongxin")
	public ModelAndView bangZhuZhongxin(ModelMap map,
			Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) {
		
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return null;
			}
			// 从ext_props里面解析 字段
			String extPropsStr = cacheChatUser.getWechatUser().getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}

			// 生成购物车数据
			genGouwucheCnt(extPropsMap, model);
			return new ModelAndView("bangzhu");
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return new ModelAndView("500");
		}

	}

	/**
	 * 跳转到 添加墓位号界面
	 */
	@SuppressWarnings({ "unused", "unchecked", "rawtypes" })
	@RequestMapping("/addMuweihao")
	public ModelAndView toAddMuweihao(ModelMap map, Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return null;
			}
			// 从ext_props里面解析 字段
			String extPropsStr = cacheChatUser.getWechatUser().getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}

			// 生成购物车数据
			genGouwucheCnt(extPropsMap, model);
			return new ModelAndView("addmuweihao");
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return new ModelAndView(PageConfigUtil.ERROR_500_PAGE);
		}
		
	}
	
	
	/**
	 * 购物车结算
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/payforgouwuche")
	public ModelAndView payforGouwuche(ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return null;
			}
			
			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
							.getUserId());
			
			cacheChatUser.setWechatUser(user);
			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}
			
			JSONArray productIds = (JSONArray) extPropsMap.get("gouwucheIds");

			int productCnt = productIds == null ? 0 : productIds.size();

			model.put("gowuchecnt", productCnt);

			// 生成购物车的商品列表，按单个商品以及对应的数量去组织数据
			if (0 == productCnt) {
				logger.warn("has no gouwuche detail,userId="+cacheChatUser.getWechatUser().getUserOpenid());
				return new ModelAndView(PageConfigUtil.ERROR_500_PAGE);
			} else {

				ArrayList<CacheProduct> cacheProducts = WechatUserUtil.genCacheProductsForGouwuche(productIds);
				// 计算下总金额以及节省的金额
				calcTotalMoneyAndDiscount(model, cacheProducts);
		        logger.info("pay for gouwuche ,total money is="+model.get("payForMoney"));
			}
			
	        logger.info("now wechat user pay for gouwuche ....");
			// 生成购物车数据
			genGouwucheCnt(extPropsMap, model);
			
			//清除缓存数据吧 
			ParseRequest.removeWechatUserFromSession(request);
			
	        return wechatUserService.payforGouwuche(model, request, response,cacheChatUser);
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return new ModelAndView(PageConfigUtil.ERROR_500_PAGE);
		}
		
	}

	// 添加购物车
	@SuppressWarnings("unchecked")
	@RequestMapping("/gouwuche/add")
	public void addGouwuche(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {

		try {

			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return;
			}

			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
							.getUserId());

			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}

			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}

			JSONArray productIds = (JSONArray) extPropsMap.get("gouwucheIds");
			productIds = productIds == null ? new JSONArray() : productIds;

			String newProductId = request.getParameter("productId");
			if (StringUtils.isBlank(newProductId)) {
				logger.error("paremeter error, productId is null");
				ResultMsgBean Msg = new ResultMsgBean(false, "未选择商品");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}

			productIds.add(Integer.valueOf(newProductId));

			extPropsMap.put("gouwucheIds", productIds);

			user.setExtProps(JSON.toJSONString(extPropsMap));
			logger.warn("update user gouwuche message ,detail="
					+ JSON.toJSONString(extPropsMap));

			wechatUserService.wechatUpdate(user);

			logger.warn("update user gouwuche sucess");
			ResultMsgBean Msg = new ResultMsgBean(true, "添加成功");
			Msg.setData(productIds.size()); // 把购物车的数字刷新下
			ResponseToClient.writeJsonMsg(response, Msg);

			logger.warn("reponse is = " + JSON.toJSONString(Msg));

			// 更新下session
			cacheChatUser.setWechatUser(user);
			HttpSession session = request.getSession();
			session.setAttribute(IndexConfig.SESSION_WECHATUSER_KEY,
					cacheChatUser);

			return;
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return;
		}
	}
	
	
	// 删除一个商品的购物车全部记录
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/gouwuche/deleteall")
	public void  delAllProductInGouwuche(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {

		try {

			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return;
			}

			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
							.getUserId());

			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}

			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}

			JSONArray productIds = (JSONArray) extPropsMap.get("gouwucheIds");
			productIds = productIds == null ? new JSONArray() : productIds;

			String newProductId = request.getParameter("productId");
			if (StringUtils.isBlank(newProductId)) {
				logger.error("paremeter error, productId is null");
				ResultMsgBean Msg = new ResultMsgBean(false, "未选择商品");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}
			
			
			JSONArray  newProductIds = new JSONArray();
			
			for(int index=0;index<productIds.size();index++){
				if(productIds.getIntValue(index) != Integer.valueOf(newProductId)){
					newProductIds.add(productIds.get(index));
				}
			}
			extPropsMap.put("gouwucheIds", newProductIds);

			user.setExtProps(JSON.toJSONString(extPropsMap));
			logger.warn("update user gouwuche message ,detail="
					+ JSON.toJSONString(extPropsMap));

			wechatUserService.wechatUpdate(user);
			logger.warn("update user gouwuche sucess");
			ResultMsgBean Msg = new ResultMsgBean(true, "删除成功");
			Msg.setData(productIds.size()); // 把购物车的数字刷新下
			ResponseToClient.writeJsonMsg(response, Msg);
			// 更新下session
			cacheChatUser.setWechatUser(user);
			HttpSession session = request.getSession();
			session.setAttribute(IndexConfig.SESSION_WECHATUSER_KEY,
					cacheChatUser);

			return;
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return;
		}
	}
	
	
	// 删除一条商品的购物车记录
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/gouwuche/deleteone")
	public void  delOneProductInGouwuche(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			CacheWechatUser cacheChatUser = genCacheWechatUser(model, request,
					response);
			if (null == cacheChatUser) {
				return;
			}
			
			// 从数据库重新查询
			TbWechatUser user = (TbWechatUser) wechatUserService.getById(
					TbWechatUser.class, cacheChatUser.getWechatUser()
					.getUserId());
			
			if (null == user) {
				logger.error("find the user failed , openId="
						+ cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "用户信息错误");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}
			
			// 从ext_props里面解析 字段
			String extPropsStr = user.getExtProps();
			Map<String, Object> extPropsMap = null;
			if (StringUtils.isBlank(extPropsStr)) {
				extPropsMap = new HashMap();
			} else {
				extPropsMap = JSON.parseObject(extPropsStr, Map.class);
			}
			
			JSONArray productIds = (JSONArray) extPropsMap.get("gouwucheIds");
			productIds = productIds == null ? new JSONArray() : productIds;
			
			String newProductId = request.getParameter("productId");
			if (StringUtils.isBlank(newProductId)) {
				logger.error("paremeter error, productId is null");
				ResultMsgBean Msg = new ResultMsgBean(false, "未选择商品");
				ResponseToClient.writeJsonMsg(response, Msg);
				return;
			}
			
	
			int findIndex= -1;
			
			for(int index=0;index<productIds.size();index++){
				if(productIds.getIntValue(index) == Integer.valueOf(newProductId)){
					findIndex = index;
				}
			}
			
			if(findIndex != -1){
				productIds.remove(findIndex);
			}else{
				logger.error("does not exit product id=" + newProductId+", for user openId="+cacheChatUser.getWechatUser().getUserOpenid());
				ResultMsgBean Msg = new ResultMsgBean(false, "删除成功");
				ResponseToClient.writeJsonMsg(response, Msg);
				
				return ;
			}
			
			extPropsMap.put("gouwucheIds", productIds);
			user.setExtProps(JSON.toJSONString(extPropsMap));
			logger.warn("update user gouwuche message ,detail="
					+ JSON.toJSONString(extPropsMap));
			
			wechatUserService.wechatUpdate(user);
			logger.warn("update user gouwuche sucess");
			ResultMsgBean Msg = new ResultMsgBean(true, "删除成功");
			Msg.setData(productIds.size()); // 把购物车的数字刷新下
			ResponseToClient.writeJsonMsg(response, Msg);
			// 更新下session
			cacheChatUser.setWechatUser(user);
			HttpSession session = request.getSession();
			session.setAttribute(IndexConfig.SESSION_WECHATUSER_KEY,
					cacheChatUser);
			
			return;
		} catch (Exception e) {
			logger.error("toMchsListPage error happends," + e.getMessage());
			ResultMsgBean Msg = new ResultMsgBean(false, "系统繁忙请稍后重试");
			ResponseToClient.writeJsonMsg(response, Msg);
			return;
		}
	}
	
	// 生成cacheUser信息
	private CacheWechatUser genCacheWechatUser(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) {
		CacheWechatUser cacheChatUser = null;
		// 不是测试模式
		if (!WinterOrangeSysConf.IN_TEST_MODEL) {
			// TODO : 需要查询 所有的 美食类商家以及每个商家先的 美食种类
			cacheChatUser = ParseRequest.getWechatUserFromSession(request);
			if (null == cacheChatUser
					|| StringUtils.isBlank(cacheChatUser.getWechatUser()
							.getUserOpenid())) {
				logger.error("wechat user session timeout,re auth");
				WeChatRequestUtil.redirectToAuthorize(response);
				return null;
			}
		} else {
			logger.debug("current in test model");
			TbWechatUser chatUser = new TbWechatUser();
			chatUser.setUserId(93);
			// chatUser.setUserOpenid("666666");//员工
			chatUser.setUserOpenid("okRbT5pPMcFvZQpQesNozycSSpzo");// 员工
			cacheChatUser = new CacheWechatUser();
			cacheChatUser.setWechatUser(chatUser);
		}

		return cacheChatUser;
	}



	// 计算总的金额以及节省的金额
	private void calcTotalMoneyAndDiscount(Map<String, Object> map,
			ArrayList<CacheProduct> cacheProducts) {

		int totalDiscountMoney = 0, totalMoney = 0;
		for (int i = 0; i < cacheProducts.size(); i++) {
			totalDiscountMoney = totalDiscountMoney
					+ cacheProducts.get(i).getProduct().getDiscountPrice()
					* cacheProducts.get(i).getBuyCnt();

			totalMoney = totalMoney
					+ cacheProducts.get(i).getProduct().getProductPrice()
					* cacheProducts.get(i).getBuyCnt();
			;

		}

		int totalSaveMoney = totalMoney - totalDiscountMoney;

		map.put("payForMoney", totalDiscountMoney);
		map.put("saveMoney", totalSaveMoney);

	}

	private void genGouwucheCnt(Map extPropsMap, Map<String, Object> model) {

		JSONArray productIds = (JSONArray) extPropsMap.get("gouwucheIds");
		int productCnt = productIds == null ? 0 : productIds.size();
		model.put("gowuchecnt", productCnt);
	}

}