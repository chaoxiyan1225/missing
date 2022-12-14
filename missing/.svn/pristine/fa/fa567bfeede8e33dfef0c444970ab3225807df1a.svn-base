package happylife.util.service;

import happylife.model.TbMchStaff;
import jodd.util.StringUtil;

public class MchUserCareOfUtil {
	
	
	/**
	 * 把新staff 信息更新到 旧staff中 覆盖部分字段
	 * @param request
	 * @return
	 */
	public static void copyChangedProps(TbMchStaff oldStaff,TbMchStaff newStaff ){
		if(oldStaff == null  || newStaff == null)
			return  ;
		
	
		if(StringUtil.isNotBlank(newStaff.getName())){
			oldStaff.setName(newStaff.getName());
		}
		
		if(StringUtil.isNotBlank(newStaff.getNickName())){
			oldStaff.setNickName(newStaff.getNickName());
		}
		
		if(StringUtil.isNotBlank(newStaff.getDetail())){
			oldStaff.setDetail(newStaff.getDetail());
		}
		
		
		if(StringUtil.isNotBlank(newStaff.getStatus())){
			oldStaff.setStatus(newStaff.getStatus());
		}
		
		
		if(StringUtil.isNotBlank(newStaff.getPhoneNum())){
			oldStaff.setPhoneNum(newStaff.getPhoneNum());
		}
		
		if(StringUtil.isNotBlank(newStaff.getFkOpenId())){
			oldStaff.setFkOpenId(newStaff.getFkOpenId());
		}
		
	}
	
	
	

}
