package happylife.model.servicemodel;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import happylife.model.TbQueueRecord;

public class CacheMchUserQueueOrder {
	private List<TbQueueRecord>  runningQueue; //进行中的服务队列
	
	private List<TbQueueRecord>  waitingQueue; //等待中的服务队列
	
	private List<TbQueueRecord>  outingQueue; //过号队列队列

	private AtomicInteger queueNum; //当前取号到哪个号码了

	public List<TbQueueRecord> getRunningQueue() {
		return runningQueue;
	}

	public void setRunningQueue(List<TbQueueRecord> runningQueue) {
		this.runningQueue = runningQueue;
	}

	public List<TbQueueRecord> getWaitingQueue() {
		return waitingQueue;
	}

	public void setWaitingQueue(List<TbQueueRecord> waitingQueue) {
		this.waitingQueue = waitingQueue;
	}

	public AtomicInteger getQueueNum() {
		return queueNum;
	}

	public void setQueueNum(AtomicInteger queueNum) {
		this.queueNum = queueNum;
	}

	public List<TbQueueRecord> getOutingQueue() {
		return outingQueue;
	}

	public void setOutingQueue(List<TbQueueRecord> outingQueue) {
		this.outingQueue = outingQueue;
	}
}
