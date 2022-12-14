package happylife.timer;

import happylife.util.cache.MchStaffProductCacheManager;

import java.util.TimerTask;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 定时check 兑换码是否发生成功， 未成功自动发送一次
 *
 */
public class CheckRedeemStatusTimer extends TimerTask {

	private static final Log logger = LogFactory.getLog(CheckRedeemStatusTimer.class);
	
	private  MchStaffProductCacheManager managerInstance = null ;
	
	public CheckRedeemStatusTimer()
	{
		logger.warn("init the mchandproductsmanager instance start....");
		//genericService.getClass();
		managerInstance = MchStaffProductCacheManager.getInstance();
		logger.warn("init the mchandproductsmanager instance finished.");
	}
	
	/* 
	 * 定时刷新  商品 以及商家信息
	 */
	@Override
	public void run() {
		try {
			logger.warn("the timer start ");
			
			//TODO 刷新每个单品的 销售金额 
			logger.warn("update all products sale info  starting.....");
			managerInstance.scanRecordsAndUpdate();
			logger.warn("update all products sale info finished.");
			
			logger.warn("finish one cycle.");
			Thread.sleep(5000);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			logger.error("error happened wait for next cycle.");
		}
	}

}
