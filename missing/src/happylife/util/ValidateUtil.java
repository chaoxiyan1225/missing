package happylife.util;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jodd.util.StringUtil;

/**
 * 验证工具
 * 
 * @author Imoen
 * @version 
 */
public class ValidateUtil {
	private static SimpleDateFormat hsdf = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm");
	private static SimpleDateFormat ssdf = new SimpleDateFormat("yyyy-MM-dd");
	private static String[] images = new String[] { "image", "png", "jpg",
			"jpeg", "pjpeg", "x-png" };

	public static boolean isInteger(String value) {
		try {
			Integer.parseInt(value);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	public static int[] isIntegerArray(String value) {
		String[] cs = value.split(";");
		int[] cids = new int[cs.length];
		for (int i = 0; i < cs.length; i++) {
			try {
				cids[i] = Integer.parseInt(cs[i]);
			} catch (NumberFormatException e) {
				return null;
			}
		}
		return cids;
	}

	public static int[] isIntegerArray(String[] value) {
		int[] cids = new int[value.length];
		for (int i = 0; i < value.length; i++) {
			try {
				cids[i] = Integer.parseInt(value[i]);
			} catch (NumberFormatException e) {
				return null;
			}
		}
		return cids;
	}

	public static Calendar validateCalendar(String value) {
		try {
			Calendar c = Calendar.getInstance();
			c.setTime(ssdf.parse(value));
			return c;
		} catch (NumberFormatException e) {
			return null;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Calendar validateCalendarWithHour(String value) {
		try {
			Calendar c = Calendar.getInstance();
			c.setTime(hsdf.parse(value));
			return c;
		} catch (NumberFormatException e) {
			return null;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static boolean isBoolean(String value) {
		try {
			Boolean.parseBoolean(value);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	/**
	 * 审查是不是图�?
	 */
	public static boolean validateImage(String imageName) {
		for (String s : images) {
			if (s.equals(imageName)) {
				return true;
			}
		}
		return false;
	}

	// 得到前几天，后几天（月，年）的时�?
	// 年月日标�?正数前几�?负数后几�?
	public static Timestamp getBeforeTime(int nyr, int nyrNum) {
		long newlong = System.currentTimeMillis();
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTimeInMillis(newlong);

		calendar.add(nyr, nyrNum);
		Timestamp time = new Timestamp(calendar.getTimeInMillis());

		// System.out.println(UtilBean.getBeforeTime(Calendar.DAY_OF_MONTH,
		// 100));
		// calendar.add(Calendar.MONTH, 1)

		return time;
	}

	public static boolean isFloat(String value) {
		try {
			Float.parseFloat(value);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
	public static boolean isDouble(String value) {
		try {
			Double.parseDouble(value);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
	public static String getSixIntStr() {
		Random r = new Random();
		int sint = r.nextInt(1000000);
		DecimalFormat dfInt = new DecimalFormat("000000");
		String str = dfInt.format(sint);
		return str;
	}

	public static boolean regex(String regex, String value) {
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(value);
		return m.find();
	}

	public static boolean checkMobile(String value) {
		// 手机号码
		String regex = "\\d{11}"; // 11�?
		return regex(regex, value);
	}

	public static boolean checkUser2(String value) {
		String regex = "[a-zA-Z1-9_]{5,20}";
		return regex(regex, value);
	}

	public static boolean checkUser(String value) {
		String regex = "\\w{5,20}";
		return regex(regex, value);
	}

	public static boolean checkEmail(String value) {
		String regex = "[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+";
		return regex(regex, value);
	}

	public static boolean checkPsw(String value) {
		String regex = "\\w{6}";
		return regex(regex, value);
	}

	public static boolean checkStr(String content, String filter) {
		// 要过虑的字符,用|分隔
		Matcher m = Pattern.compile(filter).matcher(content);
		if (m.find()) {
			return true; // 有非法字�?
		} else {
			return false;
		}
	}

	public static boolean checkPostNo(String value) {
		String regex = "[0-9]{6}";
		return regex(regex, value);
	}

	public static boolean checkCertificate(String value) {
		String regex = "^[0-9]{15}$|^[0-9]{18}$";
		return regex(regex, value);
	}

	public static boolean checkTelno(String value) {
		if(StringUtil.isNotBlank(value)){
			// 电话
			String regex = "^[0-9]{6,20}$";
			return regex(regex, value);
		}else{
			return false;
		}
		
	}

	public static boolean checkAddress(String value) {
		// 地址
		// String regex = "^\\w{1,100}$";
		// return regex(regex,value);

		if (value.length() < 100 && value.length() > 0)
			return true;
		return false;
	}

	public static boolean checkPerson(String value) {
		// String regex = "^\\w{1,20}$";
		// return regex(regex,value);
		if (value.length() < 20 && value.length() > 0)
			return true;
		return false;
	}

	public static boolean isFloat2(String value) // 价格不超�?0位数�?可含两位小数)
	{
		String regex = "^[0-9]{1,10}$|^[0-9]{1,9}[.][0-9]{1}$|^[0-9]{1,8}[.][0-9]{1,2}$";
		return regex(regex, value);
	}

	public static boolean isFloat7(String value) // 价格不超�?位数�?可含两位小数)
	{
		String regex = "^[0-9]{1,7}$|^[0-9]{1,6}[.][0-9]{1}$|^[0-9]{1,5}[.][0-9]{1,2}$";
		return regex(regex, value);
	}

	public static boolean String20(String value) {
		// String regex = "^\\w{1,20}$";
		// return regex(regex,value);
		if (value.length() < 20 && value.length() > 0)
			return true;
		return false;
	}

	public static boolean StringLength(String value, int minLength,
			int maxLength) {
		
		if (StringUtil.isNotBlank(value)&&value.length() <= maxLength && value.length() >= minLength)
			return true;
		return false;
	}

	public static boolean String7int(String value) {
		// String regex = "^\\w{1,20}$";
		// return regex(regex,value);
		if (value.length() < 7 && value.length() > 0 && isInteger(value))
			return true;
		return false;
	}

	public static boolean String500(String value) {
		if (value.length() < 500 && value.length() > 0)
			return true;
		return false;
	}

	public static boolean String30(String value) {
		if (value.length() < 30 && value.length() > 0)
			return true;
		return false;
	}

	public static boolean checkNum(String value) {
		String regex = "^[0-9]{1,4}$";
		return regex(regex, value);
	}
	
	public static boolean checkUid(String value) {
		String regex = "^[0-9]{7,10}$";
		return regex(regex, value);
	}

	public static boolean checkskren(String value) {
		if (value.length() < 25 && value.length() > 0)
			return true;
		return false;
	}

	public static boolean checkNum(String value, int rangeStart, int rangeEnd) {
		if (isInteger(value)) {
			int v = Integer.valueOf(value);
			if (v >= rangeStart && v <= rangeEnd)
				return true;
			return false;
		}
		return false;
	}
	
	
	public static boolean checkCourseNum(String value){
		String regex = "^[0-9]{10}$";
		return regex(regex, value);
	}

	public static boolean checkNumberAndLetter(String value) {
		String regex = "^[A-Za-z0-9]+$";
		return regex(regex, value);
	}

	public static boolean checkChiness(String value) {
		String regex = "^[\u4e00-\u9fa5-a-zA-Z0-9]+$";
		return regex(regex, value);
	}
	public static <T> boolean checkListIsNotEmpty(List<T>list) {
		if(list!=null&&!list.isEmpty()){
			return true;
		}
		return false;
	}
	
	public static boolean isnullStr(String str){
		if(str!=null && str.trim().length()>0)
			return false;
		return true;
		
	}
}
