package happylife.model.servicemodel;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

import happylife.model.TbMchStaff;
import happylife.model.TbTransactionRecord;

public class CacheTransaction {
	private TbTransactionRecord  transaction;
	private String productName;
	private String mchShopName;
	private TbMchStaff  mchStaff;
	
	private CacheMchUser cacheMch ;
	
	private JSONObject muweihao;
	
	private String statusMsg;
	
	private String processMsg;
	
	private String[] contentPictures;
	
	public TbTransactionRecord getTransaction() {
		return transaction;
	}
	public void setTransaction(TbTransactionRecord transaction) {
		this.transaction = transaction;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getMchShopName() {
		return mchShopName;
	}
	public void setMchShopName(String mchShopName) {
		this.mchShopName = mchShopName;
	}
	public TbMchStaff getMchStaff() {
		return mchStaff;
	}
	public void setMchStaff(TbMchStaff mchStaff) {
		this.mchStaff = mchStaff;
	}
	public String getStatusMsg() {
		return statusMsg;
	}
	public void setStatusMsg(String statusMsg) {
		this.statusMsg = statusMsg;
	}
	public CacheMchUser getCacheMch() {
		return cacheMch;
	}
	public void setCacheMch(CacheMchUser cacheMch) {
		this.cacheMch = cacheMch;
	}
	public String getProcessMsg() {
		return processMsg;
	}
	public void setProcessMsg(String processMsg) {
		this.processMsg = processMsg;
	}
	public String[] getContentPictures() {
		return contentPictures;
	}
	public void setContentPictures(String[] contentPictures) {
		this.contentPictures = contentPictures;
	}
	public JSONObject getMuweihao() {
		return muweihao;
	}
	public void setMuweihao(JSONObject muweihao) {
		this.muweihao = muweihao;
	}
}
