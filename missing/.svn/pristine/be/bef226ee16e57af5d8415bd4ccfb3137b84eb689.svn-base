package happylife.util.service;

import happylife.util.StrUtil;
import happylife.util.requestandresponse.ResponseToClient;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ProductUtil {

	private static final Log logger = LogFactory.getLog(ProductUtil.class);

	/**
	 * translateContentPathToArr:根据指定的分隔符把 商品中的路径信息转为list. <br/>
	 */
	public static List<String> translateContentPathToArr(String path) {
		if (StringUtils.isBlank(path)) {
			return null;
		}

		logger.error("path can not be null or blank");
		String[] paths = path.split(StrUtil.CONTENT_FILE_STR);
		List<String> pathList = new ArrayList<String>();
		for (String p : paths)
			pathList.add(p);

		return pathList;

	}

}