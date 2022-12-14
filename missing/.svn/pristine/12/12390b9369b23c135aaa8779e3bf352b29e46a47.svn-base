package happylife.util.config;

import org.apache.commons.lang.StringUtils;

/**
 * 业务ID配置生成器
 * @author orange
 *
 */
public class ServiceIdGenerator {
	
	private static final String SPLIT_DEFAULT = "-"; //分割符号
	
	
	/**
	 * 生成排队取号的ID 字符串
	 * @param type
	 * @param split
	 * @param id
	 * @return
	 */
	public static String genQueueOrderId(String type,String split,Integer id){
		
		String queueID = "";
		
		if(StringUtils.isNotBlank(type)){
			queueID += type;
		}
		
		split = StringUtils.isBlank(split)?SPLIT_DEFAULT:split;
		
		queueID += split ;
		queueID += String.valueOf(id);
	
		return queueID;
	}
	
	
	/**
	 * 反向解析出排队的ID  int 类型
	 * @param queueIDStr
	 * @param split
	 * @return
	 */
	public  static Integer getQueueOrderIdInt(String queueIDStr,String split){
		if(StringUtils.isBlank(queueIDStr)){
			
			return null ;
		}
		
		split = StringUtils.isBlank(split)?SPLIT_DEFAULT:split;
			
		String[] idSplits = queueIDStr.split(split);
		
		if(null == idSplits || idSplits.length == 0){
			return null ;
		}
		
		return new Integer(idSplits[idSplits.length-1]);
		
	}

}
