package happylife.util;

import happylife.service.exception.SDKRuntimeException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.SortedMap;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jodd.util.StringUtil;
import jodd.util.URLDecoder;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class StrUtil {
	private static final Log logger = LogFactory
			.getLog(StrUtil.class);
	
	public static final  String SPLIT_STR = ",";
	public static final  String CONTENT_FILE_STR = "contentFile";
	
	
	/**
	 * 获取UUID
	 * 
	 * @return
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString();
	}
	
	/**
	 * 6位随机验证码
	 * @return
	 */
	public static String getRandomString(){
		int[] array = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
		Random rand = new Random();
		for (int i = 10; i > 1; i--) {
			int index = rand.nextInt(i);
			int tmp = array[index];
			array[index] = array[i - 1];
			array[i - 1] = tmp;
		}
		int result = 0;
		for (int i = 0; i < 6; i++){
			result = result * 10 + array[i];
		}
		String code = String.valueOf(result);
		if(code.length()<6){
			code+="0";
		}
		return code;
	}
	
	public static String getRancode(){
		String uuid = getUUID();
		String rancode = DesUtil.encrypt(uuid);
		return rancode;
	}
	
	public static String getRandomHead(){
		int index =(int)(Math.random()*6);
		
		return index>0?String.valueOf(index):"1";
	}
	
	public static String getVideoUrl(String iframehtml){
		try{
			if(iframehtml.indexOf("'")!=0){
				String video = iframehtml.substring(iframehtml.indexOf("\"")+1, iframehtml.lastIndexOf("\""));
				return video;
			}else{
				return null;
			}
		}catch (Exception e) {
			return null;
		}
		
	}
	
	//随即生成邀请码
	public static String rand(){
		String codeValue = "";
		for (int i = 0; i < 10; i++) {
			String rand = getRandomChar();
			codeValue = codeValue.concat(rand);
		}
		return codeValue;
	}
	//随即生成邀请码
	private static String getRandomChar() {
		Random random = new Random();
		String codeList = "ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnpqrstuvwxyz123456789";
		int a = random.nextInt(codeList.length() - 1);
		return codeList.substring(a, a + 1);
	}
	
	//随即生成邀请码
	public static String getPassword(){
		String codeValue = "";
		for (int i = 0; i < 6; i++) {
			String rand = getRandPassword();
			codeValue = codeValue.concat(rand);
		}
		return codeValue;
	}
	//随即生成邀请码
	private static String getRandPassword() {
		Random random = new Random();
		String codeList = "123456789";
		int a = random.nextInt(codeList.length() - 1);
		return codeList.substring(a, a + 1);
	}
	
	/**
	 * 过滤字符串
	 * @return
	 */
	public static String fileString(String string){
		if(StringUtil.isNotBlank(string)){
			if(string.contains("🎀")){
				string = string.replaceAll("🎀","");
			}
			if(string.contains("?")){
				string = string.replaceAll("?","");
			}
			return string;
		}
		return null;
	}
	
	/**
	 * 生成2D兑换码
	 * @return
	 */
	public static String get2DRandomCode(){
		StringBuilder builder =  new StringBuilder("2D");
		Random rand = new Random();
		for (int i = 0; i<8; i++) {
			int random = rand.nextInt(10);
			builder.append(random);
		}
		return builder.toString();
	}
	/**
	 * 生成3D兑换码
	 * @return
	 */
	public static String get3DRandomCode(){
		StringBuilder builder =  new StringBuilder("3D");
		Random rand = new Random();
		for (int i = 0; i<8; i++) {
			int random = rand.nextInt(10);
			builder.append(random);
		}
		return builder.toString();
	}
	
	/**
	 * 生成随机流水号（时间+随机字符串）
	 * @return
	 */
	public static String getRandomTsr(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd-mm-hh-ss");  
		Date date = new Date();
		StringBuilder builder =  new StringBuilder(sdf.format(date));
		Random rand = new Random();
		for (int i = 0; i<10; i++) {
			int random = rand.nextInt(10);
			builder.append(random);
		}
		logger.info("the random tsr is:"+builder.toString());
		return builder.toString();
	}
	
	/**
	 * 创建md5摘要,规则是:按参数名称a-z排序,遇到空值的参数不参加签名。
	 */
	@SuppressWarnings("rawtypes")
	public static String createSign(SortedMap<String, String> packageParams,String partnerKey) {
		StringBuffer sb = new StringBuffer();
		Set es = packageParams.entrySet();
		Iterator it = es.iterator();
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			String k = (String) entry.getKey();
			String v = (String) entry.getValue();
			if (null != v && !"".equals(v) ) {
				sb.append(k + "=" + v + "&");
			}
		}
		try {
			return MD5SignUtil.Sign(sb.toString(), partnerKey);
		} catch (SDKRuntimeException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public  static boolean isPasswdValid(String passwd)
	{

		Pattern pattern = Pattern.compile("^[a-zA-Z_0-9]+$");
		Matcher matcher = pattern.matcher(passwd);
		if (matcher.find() && passwd.length() >3 && passwd.length() < 20)
		{
			return true ;
		}
		
		return false ;
	}
	
	
	public static void main(String[] args) {
		
		String head = "http://addddd/dddd/eeee/fffff/0";
		
		String headUrl = head.substring(0,head.lastIndexOf("/"))+"/96";
		
	
		
		System.out.print(headUrl);
		
		
	}
}