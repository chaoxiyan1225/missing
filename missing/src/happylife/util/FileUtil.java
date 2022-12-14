package happylife.util;

import java.io.File;

import org.apache.commons.lang.StringUtils;

public class FileUtil {
	
	/** 创建指定的绝对路径的文件
	 * @param path
	 * @return true 创建成功 ，false 创建失败
	 */
	public static boolean makeDirectory(String path)
	{
		if(StringUtils.isBlank(path))
		{
			return false;
		}
		
		
		File directory = new File(path);
		if(directory.exists())
		{
			return true;
		}
		
		directory.mkdirs();
		
		return true;
		
	}
	
	/**
	 * @param name
	 * @return 获取文件类型
	 */
	public static String getTypePart(String name){
		if(StringUtils.isBlank(name))
		{
			return null;
		}
		
		return name.substring(name.lastIndexOf(".")+1);
	}

}
