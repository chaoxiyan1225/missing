package happylife.model.servicemodel;

public enum QueueOrderStatusEnum {
	
	WAITING(0,"等待中"),RUNNING(1,"进行中"),FINISHED(2,"已完成"),CACELED(3,"已取消"),OUTING(4,"已过号");
	
	private QueueOrderStatusEnum(int statusInt,String statusMsg){
		this.statusInt = statusInt;
		this.statusMsg = statusMsg; 
	
	}
	
	private int statusInt;
	private String statusMsg;
	
    // 覆盖方法
    @Override
    public String toString() {
       return this.statusMsg + this.statusInt;
      
    }

	public int getStatusInt() {
		return statusInt;
	}

	public String getStatusMsg() {
		return statusMsg;
	}
   
	
}
