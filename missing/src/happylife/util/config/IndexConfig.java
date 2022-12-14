package happylife.util.config;

/** 该配置类 配置了系统的索引 key 值
 * @author 闫朝喜
 * 
 * by  2016-5-22
 *
 */
public class IndexConfig {

	/**
	 * 存储在COOKIE中的后台管理员ID
	 */
	public static final String ADMIN_SESSION_KEY="systemAdmin";
	
	/**
	 * 存储在COOKIE中的商户信息
	 */
	public static final String MCHUSER_SESSION_KEY="mchUser";
	
	/**
	 * 存储在COOKIE中的微信用户ID
	 */
	public static final String SESSION_WECHATUSER_KEY = "wechatuser";//用户ID
	
	public static final String RELATIVE_PATH = "\\missing\\staticfile\\wechatimages";
	
	public static final String RELATIVE_PATH_PREFIX = "/missing/staticfile/wechatimages";
	
	//这个是本地测试时候的路径
	public static final String PROJECT_ABSTRACT_PATH_TEST_STRING = "D:\\workspace\\missing\\WebContent\\staticfile\\wechatimages";
	
	//这个是实际阿里云下面的工程里面的tomcat绝对路径下面
	public static final String PROJECT_ABSTRACT_PATH_ALIYUN_STRING = "C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\missing\\staticfile\\wechatimages";
	
	/**
	 * 商家的商品图片存储路径
	 */
	public static final String MCHUSER_PRODUCTS_PICTURE_SAVE_BASEPATH ="";
	
	/**
	 * 商家的商品图片存储路径
	 */
	public static final String MCHUSER_PRODUCTS_PICTURE_TMEP_BASEPATH = "\\tem";
	
	/**
	 * 商家自己的图片存储路径
	 */
	public static final String MCHUSER_PICTURE_TMEP_BASEPATH = "\\mchusers\\tem";
	
	/**
	 * 商家的自己的图片存储路径
	 */
	public static final String MCHUSER_PICTURE_SAVE_BASEPATH = "\\mchusers";
	
	
	//商家放到数据库中的地址 
	public static final String MCHUSER_PICTURE_IN_DB = "staticfile\\wechatimages\\mchusers\\";
	
	//商家放到数据库中的地址 
	public static final String MCHUSER_PRODUCT_PICTURE_IN_DB = "staticfile\\wechatimages\\";
	
	/**
	 * 从 微信接入的链接的公共前缀
	 */
	public static String  USER_FROM_WECHAT_URI_PREFIX= "/wechatuser"; //

	/**
	 * 工程URL
	 */
	public static final String HOME_URL_TEST="http://127.0.0.1:8080/missing";
	
	//实际的项目运行时候的URL，阿里云下面的
	public static final String HOME_URL_ALIYUN="http://www.mfqq.club/missing";

	public static void main(String[] args) {

    	String content = "{\"data\":[{\"date\":\"2020-04-02 12:30:56\",\"address\":\"四川省成都市高新区\",\"content\":\"今天隆重开业了，大家都来吧\",\"path\":\"https://gss0.bdstatic.com/7Ls0a8Sm1A5BphGlnYG/sys/portrait/item/00000000.jpg\",\"href\":\"https://blog.csdn.net/daren0017/article/details/85128601\"}]}";
    	
    	
    	System.out.println(content);
	}
}
