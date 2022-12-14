package happylife.util.config;

public enum OrderTypeConfigEnum {
	


	XIJIAN("A", "洗剪"), XICHUI("B", "洗吹"), TANGTOU("C", "烫头"), 	RANFA("D", "染发"), TANGRAN("E", "烫染");

	private OrderTypeConfigEnum(String typeStr, String typeMsg) {
		this.typeStr = typeStr;
		this.typeMsg = typeMsg;

	}

	private String typeStr;
	private String typeMsg;

	// 覆盖方法
	@Override
	public String toString() {
		return this.typeStr + this.typeMsg;

	}

	public String getTypeStr() {
		return typeStr;
	}



	public void setTypeStr(String typeStr) {
		this.typeStr = typeStr;
	}



	public String getTypeMsg() {
		return typeMsg;
	}



	public void setTypeMsg(String typeMsg) {
		this.typeMsg = typeMsg;
	}
}
