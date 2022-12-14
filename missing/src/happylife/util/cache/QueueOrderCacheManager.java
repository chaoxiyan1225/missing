package happylife.util.cache;

import happylife.model.TbQueueRecord;
import happylife.model.servicemodel.CacheMchUserQueueOrder;
import happylife.model.servicemodel.QueueOrderStatusEnum;
import happylife.util.config.ServiceIdGenerator;
import happylife.util.requestandresponse.WechatMessageUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class QueueOrderCacheManager {
	
	private static final Log logger = LogFactory
			.getLog(QueueOrderCacheManager.class);
	
	/*
	 * 只提供单例方式
	 */
	private static  final QueueOrderCacheManager instance = new QueueOrderCacheManager();

	/**
	 * 商家排队队列
	 */
	private  ConcurrentHashMap<Integer, CacheMchUserQueueOrder> mchUserOrderMap ;
	
	private boolean isCacheInitFinish = false ;// 是否排队信息加载完成
	
	
	/**
	 * 私有化构造器
	 */
	private QueueOrderCacheManager() {
		logger.warn("cache init starting....");
		initCache();
	}

	/**
	 * 初始化缓存数据 ,私有化 仅仅处理一次
	 */
	private  void initCache() {
		mchUserOrderMap = new ConcurrentHashMap<>(16);
	}
	
	/**
	 * 单例方式获取 实例
	 * 
	 * @return
	 */
	public static QueueOrderCacheManager getInstance() {
		return instance;
	}

	/**
	 * MchStaffProductCacheManager 设置各个商家的排队完成回复完成后设置OK，这里默认是给系统异常重启时用
	 */
     void setInitFinish(){
		this.isCacheInitFinish = true ;//设置缓存加载完成，这里默认是从数据库加载的，在
	}
	
	/**
	 * 更新某个商户下面的排队情况，传进来的 allOrders 一定要按排队顺序来的
	 * @param mchId
	 * @param allOrders
	 * @return
	 */
	synchronized boolean cacheManageUpdateMchOrder(Integer mchId,
			List<TbQueueRecord> allOrders) {
		CacheMchUserQueueOrder cacheQueueOrder = this.mchUserOrderMap
				.get(mchId);
		if (null == cacheQueueOrder) {
			cacheQueueOrder = new CacheMchUserQueueOrder();
		}
		// 那就初始化好这个数据
		List<TbQueueRecord> runningQueue = new ArrayList<>();
		// 那就初始化好这个数据
		List<TbQueueRecord> waitingQueue = new ArrayList<>();
		
		List<TbQueueRecord> outingQueue = new ArrayList<>();
		
		TbQueueRecord maxIdRecord = null;

		// 如果传入的是有效的数据
		if (null != allOrders && allOrders.size() > 0) {
			for (TbQueueRecord order : allOrders) {
				if (order.getStatus() == QueueOrderStatusEnum.WAITING.getStatusInt()) {
					waitingQueue.add(order);
				}else if(order.getStatus() == QueueOrderStatusEnum.RUNNING.getStatusInt()) {
					runningQueue.add(order);
				}else if(order.getStatus() == QueueOrderStatusEnum.OUTING.getStatusInt()){
					outingQueue.add(order);
				}

				if (null == maxIdRecord || order.getRecordId() > maxIdRecord.getRecordId()) {
					maxIdRecord = order;
				}
			}

		}
	
		AtomicInteger queueNum = new AtomicInteger(1);
		if(null != maxIdRecord){
			String orderId = maxIdRecord.getOrderId();
			Integer idInt = ServiceIdGenerator.getQueueOrderIdInt(orderId, null);
			if(null != idInt){
				queueNum = new AtomicInteger(idInt+1);
			}
		}
	
		cacheQueueOrder.setQueueNum(queueNum);
		cacheQueueOrder.setRunningQueue(runningQueue);
		cacheQueueOrder.setWaitingQueue(waitingQueue);
		cacheQueueOrder.setOutingQueue(outingQueue);
		
		mchUserOrderMap.put(mchId, cacheQueueOrder);

		return true;
	}
	
	//wechat user 查询自己的排序 ： 是否一个user只能在一个商家排序 ，可以在不同商家，需要在排队的
	
	public CacheMchUserQueueOrder  getCacheMchUserQueue(Integer mchId){
		
		CacheMchUserQueueOrder order = mchUserOrderMap.get(mchId);
			return order;
	}
	
	/**
	 * 删除某个商户下某个排队的 order ;
	 * @param mchId
	 * @param orderId
	 * @return
	 */
	public boolean  deleteSingleOrderById(Integer mchId,Integer orderId){
		if(null == mchId || null == orderId){
			return false ;
		}
	
		CacheMchUserQueueOrder cacheMchOrder = mchUserOrderMap.get(mchId);
		if(null == cacheMchOrder){
			logger.error("has no orderqueue of the mchId="+mchId);
			return false;
		}
		
		synchronized(cacheMchOrder){
			List<TbQueueRecord> runningQueue = cacheMchOrder.getRunningQueue();
			boolean isDelete =false;
			if(null != runningQueue){
				for(TbQueueRecord record:runningQueue){
					if(record.getRecordId().intValue() == orderId.intValue()){
						runningQueue.remove(record);
						isDelete= true;
						break;
					}
				}
			}
			
			if(isDelete){
				return true;
			}
			
			List<TbQueueRecord> waitingQueue = cacheMchOrder.getWaitingQueue();
			if(null != waitingQueue){
				for(TbQueueRecord record:waitingQueue){
					if(record.getRecordId().intValue() == orderId.intValue()){
						waitingQueue.remove(record);
						isDelete= true;
						break;
					}
				}
			}
			
			
			if(isDelete){
				return true;
			}
			
			List<TbQueueRecord> outingQueue = cacheMchOrder.getOutingQueue();
			if(null != outingQueue){
				for(TbQueueRecord record:outingQueue){
					if(record.getRecordId().intValue() == orderId.intValue()){
						outingQueue.remove(record);
						isDelete= true;
						break;
					}
				}
			}
			
			return isDelete;
			
		}
		
	}
	
	/**是否给定的取号信息属于某个商家
	 * 
	 * @param mchId
	 * @param orderId
	 * @return
	 */
	public TbQueueRecord isOrderInGivenMch(Integer mchId,Integer orderId){
		if(null == mchId || null == orderId){
			return null ;
		}
	
		CacheMchUserQueueOrder cacheMchOrder = mchUserOrderMap.get(mchId);
		if(null == cacheMchOrder){
			logger.error("has no orderqueue of the mchId="+mchId);
			return null;
		}
		
		TbQueueRecord exitRecord = null ;
		synchronized(cacheMchOrder){
			List<TbQueueRecord> runningQueue = cacheMchOrder.getRunningQueue();
			if(null != runningQueue){
				for(TbQueueRecord record:runningQueue){
					if(record.getRecordId().equals(orderId)){
						exitRecord = record ;
						break;
					}
				}
			}
			
			if(null != exitRecord){
				return exitRecord;
			}
			
			List<TbQueueRecord> waitingQueue = cacheMchOrder.getWaitingQueue();
			if(null != waitingQueue){
				for(TbQueueRecord record:waitingQueue){
					if(record.getRecordId().equals(orderId)){
						exitRecord= record;
						break;
					}
				}
			}
			
			if(null != exitRecord){
				return exitRecord;
			}
			
			List<TbQueueRecord> outtingQueue = cacheMchOrder.getOutingQueue();
			if(null != outtingQueue){
				for(TbQueueRecord record:outtingQueue){
					if(record.getRecordId().equals(orderId)){
						exitRecord= record;
						break;
					}
				}
			}
			
			return exitRecord;
			
		}
	}
	
	
	/**把取号信息在 等候队列 与服务中队列之间移动 现在只支持从  waiting--> running  
	 *                                          --> outing
	 *                                   running -->waiting
	 *                                   running--->finish 在另一个接口实现
	 * @param toEnum 把取号移动到某个状态的队列，有可能商家操作错误后提供的弥补措施
	 * @return
	 */

	public TbQueueRecord moveRecordBetween(Integer mchId,Integer orderId,QueueOrderStatusEnum toEnum,boolean needSendMessage){
		if(null == mchId || null == orderId){
			return null ;
		}
		
		CacheMchUserQueueOrder cacheMchOrder = mchUserOrderMap.get(mchId);
		if(null == cacheMchOrder){
			logger.error("has no orderqueue of the mchId="+mchId);
			return null;
		}
		
		TbQueueRecord exitRecord = null ;
		synchronized(cacheMchOrder){
			List<TbQueueRecord> runningQueue = cacheMchOrder.getRunningQueue();
			List<TbQueueRecord> waitingQueue = cacheMchOrder.getWaitingQueue();
			List<TbQueueRecord> outingQueue = cacheMchOrder.getOutingQueue();
			
			if(null != runningQueue){
				for(TbQueueRecord record:runningQueue){
					if(record.getRecordId().intValue() == orderId.intValue()){
						exitRecord = record ;
						break;
					}
				}
			}
			
			//从服务中队列退还到等待中队列
			switch(toEnum){
				case WAITING:
					if (null != exitRecord) {
						runningQueue.remove(exitRecord);
						exitRecord.setStatus(QueueOrderStatusEnum.WAITING.getStatusInt());
						waitingQueue.add(0, exitRecord);
						return exitRecord;
					}else{
						logger.error("move to waiting queue error,can not find record,record id="+orderId+",or the record status error,");
						return null; //不存在
					}
				case FINISHED:
					 logger.warn("move queue  to finish ,do nothing, exit");
					 return null;
				case RUNNING: 
					//从等待中队列 移动到 服务中队列
					if(null != waitingQueue){
						for(TbQueueRecord record:waitingQueue){
							if(record.getRecordId().intValue() == orderId.intValue()){
								exitRecord= record;
								break;
							}
						}
					}
					int index = -1;
					if (null != exitRecord ) {
						index = waitingQueue.indexOf(exitRecord);
						waitingQueue.remove(exitRecord);
						exitRecord.setStatus(QueueOrderStatusEnum.RUNNING.getStatusInt());
						//runningQueue.add(exitRecord); //加到running队列的最后给
						if (needSendMessage) {
							// 给后面的三个排号发信息，通知他们做准备
							sendMessToNextRecord(waitingQueue, 0, 2);
						}
					
						return exitRecord;
					}else{
			            //再从 outing队列中看下
						if(null != outingQueue){
							for(TbQueueRecord record:outingQueue){
								if(record.getRecordId().intValue() == orderId.intValue()){
									exitRecord= record;
									break;
								}
							}
						}
						if (null != exitRecord ) {
							index = outingQueue.indexOf(exitRecord);
							outingQueue.remove(exitRecord);
							exitRecord.setStatus(QueueOrderStatusEnum.RUNNING.getStatusInt());
							//runningQueue.add(exitRecord); //加到running队列的最后给
							return exitRecord;
						}
						
						
						logger.error("move to running queue error,can not find record,record id="+orderId+",or the record status error,");
						return null; //不存在
					}
					
				case OUTING:
					//从等待中队列 移动到  outing队列
					if(null != waitingQueue){
						for(TbQueueRecord record:waitingQueue){
							if(record.getRecordId().intValue() == orderId.intValue()){
								exitRecord= record;
								break;
							}
						}
					}
					
					if (null != exitRecord) {
						index = waitingQueue.indexOf(exitRecord);
						waitingQueue.remove(exitRecord);
						exitRecord.setStatus(QueueOrderStatusEnum.OUTING.getStatusInt());
						outingQueue.add(exitRecord); //加到out队列的最后
						
						if (needSendMessage) {
							//给当前排号人发消息说过号 尽快过来
							WechatMessageUtil.sendOutingMsgToWechat(exitRecord);
						}
					
						return exitRecord;
					}else{
						logger.error("move to outing queue error,can not find record,record id="+orderId+",or the record status error,");
						return null; //不存在
					}
					
				default : 
					logger.error("do not support this case ");
				 return null;
				
			}
		}
	}
	
	//给 等候队列中的指定位置的order发消息，通知他们做准备 ，end 必须大于等于 start ，且 都属于 waitingQueue的范围
	private boolean sendMessToNextRecord(List<TbQueueRecord> waitingQueue, int start ,int  end){
		if(null == waitingQueue || waitingQueue.size() == 0){
			logger.warn("the waiting queue is emty,return false");
			return false ;
		}
		int s = start<0?0:start;
		int e =(end>(waitingQueue.size()-1))?(waitingQueue.size()-1):end;
		e= e<s?s:e;

		for(int i=s;i<=e;i++){
			TbQueueRecord record = waitingQueue.get(i);
			//说明是付费的 需要发送消息
			if(record.getFkTransactionId() >0){
				WechatMessageUtil.sendPrepareMsgToWechat(record,i);
			}
		}
	
		return true ;
		
	}

}
