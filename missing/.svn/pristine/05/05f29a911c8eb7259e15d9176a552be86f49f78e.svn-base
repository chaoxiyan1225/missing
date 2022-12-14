package happylife.timer;

import happylife.util.cache.MchStaffProductCacheManager;

import java.util.TimerTask;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 定时刷新 商品以及商家的信息
 * @author 闫朝喜
 *
 */
public class ProductAndMchInfoTimer extends TimerTask {

	private static final Log logger = LogFactory.getLog(ProductAndMchInfoTimer.class);

//	private  MchProductsActivityManager managerInstance = null ;

	public ProductAndMchInfoTimer()
	{
		logger.warn("init the mchandproductsmanager instance start....");
		//genericService.ge
		logger.warn("init the mchandproductsmanager instance finished.");
	}


	/* 
	 * 定时刷新  商品 以及商家信息
	 */
	@Override
	public void run() {
		try {
			logger.warn("missing  ProductAndMchInfoTimer start ");
			
			
//			//刷新 每个单品的 访问次数
//			logger.warn("missing update all products visitor counts starting.....");
//			MchStaffProductCacheManager.getInstance().updateProductsVisitorCounts();
//			logger.warn("missing update all products visitor counts finished.");
//
//			//TODO 刷新每个单品的 销售金额 
//			logger.warn("missing update all products sale info  starting.....");
//			MchStaffProductCacheManager.getInstance().scanRecordsAndUpdate();
//			logger.warn("missing update all products sale info finished.");
//			
//			// //刷新商家销售金额(元)
//			logger.warn("missing update all mchuser sale info  starting.....");
//			MchStaffProductCacheManager.getInstance().updateMchSales();
//			logger.warn("missing update all mchuser sale info finished.");
//			
//			logger.warn("missing ProductAndMchInfoTimer finish one cycle.");
			Thread.sleep(5000);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			logger.error("missing error happened wait for next cycle.");
		}
	}

}
