package happylife.model.servicemodel;

import java.util.List;

import happylife.model.TbMch;
import happylife.model.TbMchStaff;
import happylife.model.TbProduct;

public class CacheMchUser {
	@Override
	public String toString() {
		return "CacheMchUser [mchUser=" + mchUser + ", products=" + products
				+ "]";
	}

	private TbMch mchUser ;
	
	private List<TbProduct> products ;
	
	private List<TbMchStaff> staffs ;
	
	private boolean inService = true;
	
	private String[] contentPictures ;
	
	public TbMch getMchUser() {
		return mchUser;
	}

	public void setMchUser(TbMch mchUser) {
		this.mchUser = mchUser;
	}

	public List<TbProduct> getProducts() {
		return products;
	}

	public void setProducts(List<TbProduct> products) {
		this.products = products;
	}

	public List<TbMchStaff> getStaffs() {
		return staffs;
	}

	public void setStaffs(List<TbMchStaff> staffs) {
		this.staffs = staffs;
	}

	public boolean isInService() {
		return inService;
	}

	public void setInService(boolean inService) {
		this.inService = inService;
	}

	public String[] getContentPictures() {
		return contentPictures;
	}

	public void setContentPictures(String[] contentPictures) {
		this.contentPictures = contentPictures;
	}
}
