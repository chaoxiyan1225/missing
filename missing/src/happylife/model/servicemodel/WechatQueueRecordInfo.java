package happylife.model.servicemodel;

import happylife.model.TbQueueRecord;

public class WechatQueueRecordInfo{
	
	private TbQueueRecord  record ;
	private Boolean isQueueIn;
	private String  suggestMsg;
	private String mchShopName;
	
	private int  numFront; //前面人数
	private int  waitMins ; //等待分钟数
	
	public TbQueueRecord getRecord() {
		return record;
	}
	public void setRecord(TbQueueRecord record) {
		this.record = record;
	}
	public Boolean getIsQueueIn() {
		return isQueueIn;
	}
	public void setIsQueueIn(Boolean isQueueIn) {
		this.isQueueIn = isQueueIn;
	}
	public String getSuggestMsg() {
		return suggestMsg;
	}
	public void setSuggestMsg(String suggestMsg) {
		this.suggestMsg = suggestMsg;
	}
	public int getNumFront() {
		return numFront;
	}
	public void setNumFront(int numFront) {
		this.numFront = numFront;
	}
	public int getWaitMins() {
		return waitMins;
	}
	public void setWaitMins(int waitMins) {
		this.waitMins = waitMins;
	}
	public String getMchShopName() {
		return mchShopName;
	}
	public void setMchShopName(String mchShopName) {
		this.mchShopName = mchShopName;
	}

}
