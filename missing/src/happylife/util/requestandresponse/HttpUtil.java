package happylife.util.requestandresponse;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSONObject;

import happylife.util.MyX509TrustManager;
import happylife.util.ValidateUtil;

public class HttpUtil {

	private static final Log logger = LogFactory.getLog(HttpUtil.class);
	// 请求服务器端的url
	private static String PATH = "http://localhost/weixin/playReception";
	private static URL url;

	public HttpUtil() {
	}

	static {
		try {
			url = new URL(PATH);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param params
	 *            填写的url的参数
	 * @param encode
	 *            字节编码
	 * @return
	 */
	public static String sendPostMessage(Map<String, String> params,
			String encode) {
		// 作为StringBuffer初始化的字符串
		StringBuffer buffer = new StringBuffer();
		try {
			if (params != null && !params.isEmpty()) {
				for (Map.Entry<String, String> entry : params.entrySet()) {
					// 完成转码操作
					buffer.append(entry.getKey())
							.append("=")
							.append(URLEncoder.encode(entry.getValue(), encode))
							.append("&");
				}
				buffer.deleteCharAt(buffer.length() - 1);
			}
			// System.out.println(buffer.toString());
			// 删除掉最有一个&

			System.out.println("-->>" + buffer.toString());
			HttpURLConnection urlConnection = (HttpURLConnection) url
					.openConnection();
			urlConnection.setConnectTimeout(3000);
			urlConnection.setRequestMethod("POST");
			urlConnection.setDoInput(true);// 表示从服务器获取数据
			urlConnection.setDoOutput(true);// 表示向服务器写数据
			// 获得上传信息的字节大小以及长度
			byte[] mydata = buffer.toString().getBytes();
			// 表示设置请求体的类型是文本类型
			urlConnection.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			urlConnection.setRequestProperty("Content-Length",
					String.valueOf(mydata.length));
			// 获得输出流,向服务器输出数据
			OutputStream outputStream = urlConnection.getOutputStream();
			outputStream.write(mydata, 0, mydata.length);
			outputStream.close();
			// 获得服务器响应的结果和状态码
			int responseCode = urlConnection.getResponseCode();
			if (responseCode == 200) {
				return changeInputStream(urlConnection.getInputStream(), encode);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * @param params
	 *            填写的url的参数
	 * @param encode
	 *            字节编码
	 * @return
	 */
	public static String sendPostMessage(String path, String content,
			String encode) {
		try {
			String string = null;
			if (content != null) {
				string = content;
			}
			URL url = new URL(path);
			HttpURLConnection urlConnection = (HttpURLConnection) url
					.openConnection();
			urlConnection.setConnectTimeout(3000);
			urlConnection.setRequestMethod("POST");
			urlConnection.setRequestProperty("Content-type", "application/xml");
			urlConnection.setRequestProperty("Accept-Charset", "utf-8");
			urlConnection.setRequestProperty("contentType", "utf-8");
			urlConnection.setDoInput(true);// 表示从服务器获取数据
			urlConnection.setDoOutput(true);// 表示向服务器写数据
			// 获得上传信息的字节大小以及长度
			byte[] mydata = string.getBytes();
			// 表示设置请求体的类型是文本类型
			urlConnection.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			urlConnection.setRequestProperty("Content-Length",
					String.valueOf(mydata.length));
			// 获得输出流,向服务器输出数据
			OutputStream outputStream = urlConnection.getOutputStream();
			outputStream.write(mydata, 0, mydata.length);
			// outputStream.close();
			// 获得服务器响应的结果和状态码
			int responseCode = urlConnection.getResponseCode();
			if (responseCode == 200) {
				return changeInputStream(urlConnection.getInputStream(), encode);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

		}
		return "";
	}

	/**
	 * @param path
	 *            url地址
	 * @param encode
	 *            字节编码
	 * @return
	 */
	public static String sendGetMessage(String path, String encode) {
		try {
			URL url = new URL(path);
			HttpURLConnection urlConnection = (HttpURLConnection) url
					.openConnection();
			urlConnection.setConnectTimeout(30000);
			urlConnection.setRequestMethod("GET");
			urlConnection.setDoInput(true);// 表示从服务器获取数据
			// 获得服务器响应的结果和状态码
			int responseCode = urlConnection.getResponseCode();
			if (responseCode == 200) {
				return changeInputStream(urlConnection.getInputStream(), encode);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

		}
		return "";
	}

	/**
	 * 将一个输入流转换成指定编码的字符串
	 * 
	 * @param inputStream
	 * @param encode
	 * @return
	 */
	public static String changeInputStream(InputStream inputStream,
			String encode) {
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		byte[] data = new byte[1024];
		int len = 0;
		String result = "";
		if (inputStream != null) {
			try {
				while ((len = inputStream.read(data)) != -1) {
					outputStream.write(data, 0, len);
				}
				result = new String(outputStream.toByteArray(), encode);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * 发送HTTP请求取得返回的输入流
	 * 
	 * @param requestUrl
	 *            请求地址
	 * @return InputStream
	 */
	public static InputStream sendGetRequest(String requestUrl) {
		InputStream inputStream = null;
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection httpUrlConn = (HttpURLConnection) url
					.openConnection();
			httpUrlConn.setDoInput(true);
			httpUrlConn.setRequestMethod("GET");
			httpUrlConn.connect();
			// 获得返回的输入流
			inputStream = httpUrlConn.getInputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return inputStream;
	}
	
	
	/**
	 * 发起https请求并获取结果
	 * 
	 * @param requestUrl
	 *            请求地址
	 * @param requestMethod
	 *            请求方式（GET、POST）
	 * @param outputStr
	 *            提交的数据
	 * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
	 */
	public static JSONObject httpsRequest(String requestUrl,
			String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		try {
			System.setProperty("https.protocols", "TLSv1");
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			TrustManager[] tm = { new MyX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();
			System.setProperty("jsse.enableSNIExtension", "false");
			URL url = new URL(requestUrl);
			HttpsURLConnection httpUrlConn = (HttpsURLConnection) url
					.openConnection();
			httpUrlConn.setSSLSocketFactory(ssf);

			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod);

			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();

			// 当有数据需要提交时
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			// 将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			String string = HttpUtil.changeInputStream(inputStream, "UTF-8");

			httpUrlConn.disconnect();
			jsonObject = JSONObject.parseObject(string);
		} catch (ConnectException ce) {
			logger.error(ce);
			
			return null;
		} catch (Exception e) {
			logger.error(e);
			
			return null;
		}
		return jsonObject;
	}


	/**
	 * @param args
	 */
	public static void main(String[] args) {

		// String result =
		// HttpUtils.sendGetMessage("http://localhost/weixin/CoreServlet",
		// "utf-8");
		// System.out.println(result);
	}

	// /获取用户IP
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ValidateUtil.isnullStr(ip)) {
			ip = "127.0.0.1";
		} else {
			String[] ips = ip.split(",");
			ip = ips[ips.length - 1].trim();
		}
		return ip;
	}

}
