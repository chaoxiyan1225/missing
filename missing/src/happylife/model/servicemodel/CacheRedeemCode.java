package happylife.model.servicemodel;

import happylife.model.TbRedeemCode;

public class CacheRedeemCode {
	private TbRedeemCode redeemCode ;
	private String productName ;
	public TbRedeemCode getRedeemCode() {
		return redeemCode;
	}
	public void setRedeemCode(TbRedeemCode redeemCode) {
		this.redeemCode = redeemCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
}
