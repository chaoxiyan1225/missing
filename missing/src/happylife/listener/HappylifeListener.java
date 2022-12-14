package happylife.listener;

import happylife.util.cache.MchStaffProductCacheManager;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


@WebListener
public class HappylifeListener  implements ServletRequestListener{
	
	

	private static final Log logger = LogFactory
			.getLog(HappylifeListener.class);

	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void requestInitialized(ServletRequestEvent arg0) {
		// TODO Auto-generated method stub
		
		
		MchStaffProductCacheManager.getInstance();
		logger.warn("init MchStaffProductCacheManager finish");
		
		
		
	}

}
