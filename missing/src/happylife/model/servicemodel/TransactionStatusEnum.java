package happylife.model.servicemodel;

public enum TransactionStatusEnum {
	
	NOT_PAY(0,"待支付"),PAYED_NOASSIGNED(1,"待安排受理人"),ASSIGED_STAFF(2,"待受理人完成订单"),FINISHED_FOR_CONFIRM(3,"已完成待确认"),FINISHED(4,"确认完成");
	
	private TransactionStatusEnum(int statusInt,String statusMsg){
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
