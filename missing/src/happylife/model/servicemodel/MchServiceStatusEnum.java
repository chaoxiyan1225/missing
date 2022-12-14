package happylife.model.servicemodel;

public enum MchServiceStatusEnum {

	
	IN_SERVICE(0,"正常营业中"),OUT_SERVICE(1,"已打烊"),SUSPEND_SERVICE(2,"暂停服务");
	
	private MchServiceStatusEnum(int statusInt,String statusMsg){
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
