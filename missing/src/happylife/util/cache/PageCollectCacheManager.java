package happylife.util.cache;

import happylife.controller.AdminController;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PageCollectCacheManager {
	
	private static final Log logger = LogFactory.getLog(PageCollectCacheManager.class);
	
	private static Map<String,AtomicInteger> pageCounter;
	
	private static PageCollectCacheManager INSTANCE ;
	private static Object  lock = new Object() ;
	
	
	private PageCollectCacheManager()
	{
		pageCounter = new ConcurrentHashMap<String, AtomicInteger>();
		
		for(String index:CacheIndex.YunjisiPageCaculate.PageCountIndex)
		{
			pageCounter.put(index, new AtomicInteger());
		}
		
	}
	
	public static  PageCollectCacheManager getInstance(){
		if(null == INSTANCE){
			synchronized(lock){
				INSTANCE = new  PageCollectCacheManager();
				
				logger.warn("PageCollectCacheManager instance now to be create..");
				return INSTANCE;
			}
			
		}else{
			return INSTANCE;
		}
		
	}
	
	
	public void addByOne(String index){
		
		if(!pageCounter.containsKey(index))
			return ;
		
		pageCounter.get(index).getAndIncrement();
		
	}
	
	
	public void reset(){
		synchronized(lock){
			
			for(String index:CacheIndex.YunjisiPageCaculate.PageCountIndex)
			{
				pageCounter.put(index, new AtomicInteger());
			}
		}
	}
	
	
	
	
	
	
	
	

}
