package happylife.util.config;


public class WeChatConfig {
	
	/**
	 * 微信公众号APPID  云祭思
	 */
	public final static String APP_ID = "wx3b39e9ae74227f03";
	
	/*
	 * 微信公众号APP密码
	 */
	public final static String APP_SECRET = "65fad8a3f2b1a9dd64e8233a6d23410d";
	
	/**
	 * 微信公众号APP access_token每30天更换一次
	 */
	public static  String APP_ACCESS_TOKEN = "LCcRVfsye1q27JPMFTu7S0CXFxymuR3lvQechUWfmT2";
	
	
	public static  long ACCESS_TOKEN_TIMEOUT_MISSECS =  -1; //access_token超期时间
	
	/**
	 * 微信支付APPID
	 */
	public static final String APPID_WXPAY="wx3b39e9ae74227f03";
	
	
	/**
	 * 微信支付MCH_ID
	 */
	public static final String MCH_ID="1607903573";
	
	
    /**
     * 微信界面设置的token
     */
    public static final String WECHAT_TOKEN = "film888";
    
    public static final String WECHAT_ATTACK = "wechatuser";
    
	/**
	 * 如果客户在微信商户平台更改，这个地方也需要马上更改
	 * 微信支付PARTNERKEY                     hJ6JiTVE6GZJI451HF2ThnrM9QNdBYQLsXreKkacdbO
	 */
	public static final String PARTNERKEY="Wangjianlizhanglei13722128886888";
    
	public static final String WEBSITE_INDEX_URL="http://www.mfqq.club/missing";
	
	public static final String HOST= "http://www.mfqq.club";
	
	public static final String WEBSITE_WECHAT_PREFIX = WEBSITE_INDEX_URL+PageConfigUtil.WECHAT_PREFIX;
	
	public static final String TEMPLATE_ID = "wF-EuBZep4hZmsWXIcK-1SPGQKlfXsysxteT9yHDw9o";
    
    /**
     * 微信异步通知的URL,这里根据域名 配置实际的链接
     */
    public static final String  WECHAT_NOTIFY_URL = WEBSITE_INDEX_URL+PageConfigUtil.WECHAT_PREFIX+PageConfigUtil.WechatUserPage.WECHAT_PAY_CALL_BACK;
   

	public static final String UNIFIEDORDER_URL="https://api.mch.weixin.qq.com/pay/unifiedorder";//签名URL地址
	
	/**
	 * 获取access_token的接口地址（GET） 限200（次/天）
	 */
	public static String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/"
			+ "cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";

	/**
	 * 菜单创建（POST） 限100（次/天）
	 */
	public static String MENU_CREATE_URL = "https://api.weixin.qq.com/cgi-bin/menu/"
			+ "create?access_token=ACCESS_TOKEN";

	/**
	 * 菜单删除
	 */
	public final static String MENU_DELETE_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";

	/**
	 * 获取用户基本信息
	 */
	public final static String WEIXIN_USER_INFO_URL = "https://api.weixin.qq.com/cgi-bin"
			+ "/user/info?access_token=ACCESS_TOKEN&openid=OPENID";

	/**
	 * 具体而言，就是在调用接口时，将上一次调用得到的返回中的next_openid值，作为下一次调用中的next_openid值。
	 */
	public final static String WEIXIN_GETLIST_URL = "https://api.weixin.qq.com/cgi-bin/user/get?"
			+ "access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID";

	/**
	 * 获取code
	 */
	public final static String WEIXIN_CODE_URL = "https://open.weixin.qq.com/connect/oauth2/authorize"
			+ "?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";

	/**
	 * 通过code获取access_token
	 */

	public final static String WEIXIN_ACCESSTOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?"
			+ "appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	/**
	 * 刷新access_token
	 */
	public final static String WEIXIN_REFRESHTOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/refresh_token?"
			+ "appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN";

	/**
	 * 获取用户信息
	 */
	public final static String WEIXIN_GETUSER_URL = "https://api.weixin.qq.com/sns/userinfo?access_token="
			+ "ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	/**
	 * 获取二维码TICKET
	 */
	public final static String WEIXIN_TICKET_URL = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
	/**
	 * 通过TICKET获取二维码
	 */
	public final static String WEIXIN_BARTWOCODE_URL = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=ACCESS_TICKET";
	
	
	/**
	 * 模版消息
	 */
	
	public final static String WEIXIN_TEMPLATE_MSG = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
	
	
}
