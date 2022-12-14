package happylife.util.requestandresponse;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSON;

public class ResponseToClient {
	
	private static final Log logger = LogFactory.getLog(ResponseToClient.class);
	
	
	/** 往客户的 写 json格式的响应数据
	 * @param response
	 * @param object
	 */
	public static void writeJsonMsg(HttpServletResponse response, Object object)
	{
		if(null == response || null == object)
		{
			logger.error("the response is null or object is null");
			return ;
		}
		
		//设置响应的格式为 json 且 UTF-8 格式
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out = null;
		try {
			String text = JSON.toJSONString(object);
			out = response.getWriter();
			out.write(text);
		} catch (IOException e) {
			logger.error("io exception+"+e.toString());
		}finally
		{
			out.flush();
			//out.close();			
		}

	}
	
}
