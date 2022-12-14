package happylife.util.cache;

/**
 * 该类记录缓存中的索引信息
 * 
 * @author 闫朝喜
 * 
 */
public class CacheIndex {

	/** 超级管理的缓存信息
	 * @author lenovo
	 *
	 */
	public static class Admin {
		public static final Integer CACHE_INDEX = 1;
		public static final String TOTAL_VISIT_COUNT = "total_visit_count";
		public static final String TODAY_VISIT_COUNT = "today_visit_count";
		public static final String MCHUSER_COUNTS = "mchuser_counts";
		public static final String TOTAL_SALL_COUNTS = "total_sall_counts";
		public static final String TOTAL_SALL_MONEY = "total_sall_money";
		public static final String TOTAL_FANS_COUNT = "total_fans_count";
	}
	
	/** 商家账户的缓存
	 * @author lenovo
	 *
	 */
	public static class MchUser{
		public static final String TOTAL_VISIT_COUNT = "mchuser_total_visitors";
		public static final String TODAY_VISIT_COUNT = "mchuser_today_visitors";
		public static final String TOTAL_SALL_COUNTS = "mchuser_total_sall_counts";
		public static final String TOTAL_FANS_COUNTS = "mchuser_total_fans_counts";//总的关注用户数
		public static final String TOTAL_SALL_MONEY = "mchuser_total_sall_money";
	}
	
	public static class YunjisiPageCaculate{
		
		public static final String DAI_JI_SI = "代祭祀";
		public static final String GONG_MU = "购买公墓";
		public static final String JING_SHI = "生命晶石";
		public static final String AN_XI_TANG = "安息堂";
		
		public static final String[] PageCountIndex = {DAI_JI_SI,GONG_MU,JING_SHI,AN_XI_TANG};
		
	}
	
	
}
