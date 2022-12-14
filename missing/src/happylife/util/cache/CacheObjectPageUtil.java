package happylife.util.cache;

import java.util.List;

public class CacheObjectPageUtil {
	
	/** 把输入的原列表按分页方式返回给定的列表
	 * @param srcList
	 * @param start 
	 * @param pageSize
	 * @return
	 */
	public static  List getObjectByPage(List<?> srcList,int startIndex, int pageSize){
		if(null == srcList || srcList.size() == 0){
			return null ;
		}
		
		if(startIndex <0 || pageSize <1){
			return null;
		}
		
		
		int srcLength = srcList.size();
		if(startIndex >srcLength -1){
			return null ;
		}
		
		int endIndex = startIndex+pageSize ;
		
		endIndex = endIndex > srcLength? srcLength:endIndex;
		
		return srcList.subList(startIndex, endIndex) ;
	}

}
