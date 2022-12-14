package happylife.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import jodd.util.StringUtil;

/**
 * 时间工具类
 * 
 * @author
 */
public class DateUtil {

	public static final DateFormat dateStringFormat = new SimpleDateFormat(
			"yyyy-MM-dd");

	public static final DateFormat dateTimeStringFormat = new SimpleDateFormat(
			"yyyy-MM-dd kk:mm:ss");

	public static final DateFormat fileNameDateStringFromcat = new SimpleDateFormat(
			"kk_mm_ss_SS");

	public static final DateFormat timeStringFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	public static final DateFormat noSecondsStringFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm");

	/**
	 * 获取日期字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String getDateString(Date date) {
		return dateStringFormat.format(date);
	}

	/**
	 * 月份开始
	 * 
	 * @param date
	 * @return
	 */
	public static Date getMonthBegin(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.set(Calendar.HOUR_OF_DAY, 1);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		return calendar.getTime();
	}

	/**
	 * 获取时间
	 * 
	 * @param date
	 * @return
	 */
	public static Date getDateWithOutTime(Date date) {
		try {
			return dateStringFormat.parse(dateStringFormat.format(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 以友好的方式显示时间
	 * 
	 * @param req
	 * @param time
	 * @return
	 */
	public static String friendly_time(Date time) {
		if (time == null)
			return "未知时间";
		int ct = (int) ((System.currentTimeMillis() - time.getTime()) / 1000);
		if (ct < 3600)
			return Math.max(ct / 60, 1) + "分钟前";
		if (ct >= 3600 && ct < 86400)
			return ct / 3600 + "小时前";
		if (ct >= 86400 && ct < 2592000) { // 86400 * 30
			int day = ct / 86400;
			return day == 1 ? "昨天" : (day + "天前");
		}
		if (ct >= 2592000 && ct < 31104000) // 86400 * 30
			return ct / 2592000 + "个月前";
		return ct / 31104000 + "年前";
	}

	/**
	 * lja
	 * 
	 * @param time
	 * @return [今天||昨天||前天||更前] HH:mm;
	 */
	public static String friendtime(Date time) {
		String unknown = "未知时间";
		if (time == null)
			return unknown;
		try {
			int ct = (int) ((System.currentTimeMillis() - time.getTime()) / 1000);
			if (ct < 3600) {
				return Math.max(ct / 60, 1) + "分钟前";
			}
			String stringTime = format("yyyy-MM-dd").format(time);
			Calendar c = Calendar.getInstance();
			if (stringTime.equals(format("yyyy-MM-dd").format(c.getTime()))) {
				return format("今天 HH:mm").format(time);
			}
			c.add(Calendar.DATE, -1);
			if (stringTime.equals(format("yyyy-MM-dd").format(c.getTime()))) {
				return format("昨天 HH:mm").format(time);
			}
			c.add(Calendar.DATE, -1);
			if (stringTime.equals(format("yyyy-MM-dd").format(c.getTime()))) {
				return format("前天 HH:mm").format(time);
			}
			// 判断文章是否是今年的如不是就在前边加年份
			if (!format("yyyy").format(time).equals(
					Calendar.getInstance().get(Calendar.YEAR) + "")) {
				return format("yyyy-MM-dd HH:mm").format(time);
			}
			return format("MM-dd HH:mm").format(time);
		} catch (Exception e) {
			return unknown;
		}
	}

	/**
	 * 格式化日期
	 * 
	 * @param format
	 * @return
	 */
	public static SimpleDateFormat format(String format) {
		return new SimpleDateFormat(format);
	}

	/**
	 * 获取时间差
	 * 
	 * @param comeDate
	 * @param toDate
	 * @return
	 */
	public static int timeDiffence(Date comeDate, Date toDate) {
		long timeDiffence = (comeDate.getTime() - toDate.getTime()) / 1000;
		return (int) timeDiffence;
	}

	/**
	 * 字符串转日期
	 * 
	 * @param dateStr
	 * @param formatStr
	 * @return
	 */
	public static Date StringToDate(String dateStr, String formatStr) {
		DateFormat dd = new SimpleDateFormat(formatStr);
		Date date = null;
		try {
			date = dd.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * 获取周一日期
	 * 
	 * @return
	 */
	public static Date getMonday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY); // 获取本周一的日期
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = df.format(cal.getTime());
		try {
			return df.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new Date();
	}

	/**
	 * 获取周日日期
	 * 
	 * @return
	 */
	public static Date getSunday() {
		Calendar cal = Calendar.getInstance();
		// 这种输出的是上个星期周日的日期，因为老外那边把周日当成第一天
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		// 增加一个星期，才是我们中国人理解的本周日的日期
		cal.add(Calendar.WEEK_OF_YEAR, 1);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = df.format(cal.getTime());
		try {
			return df.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new Date();
	}

	/**
	 * 获取日期字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String DateToString(Date date) {
		return noSecondsStringFormat.format(date);
	}

	/**
	 * 获取日期字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String dateToString(Date date) {
		return dateStringFormat.format(date);
	}

	/**
	 * 获取日期字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String DateToString(Date date, DateFormat dateFormat) {
		return dateFormat.format(date);
	}

	/**
	 * 过去几个小时的时间
	 * 
	 * @return
	 */
	public static Date getOverTime(int time) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.HOUR, time);
		Date date = cal.getTime();
		return date;
	}

	/**
	 * 过去或将来几天时间
	 * 
	 * @return time 将来或者过去的几天
	 */
	public static String getDayOverTime(int time) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, time);
		String datestr = dateStringFormat.format(cal.getTime());
		return datestr;
	}

	/**
	 * 过去或将来几天时间
	 * 
	 * @return time 将来或者过去的几天
	 */
	public static Date getDayOverTimeDate(int offsetTime) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, offsetTime);
		String datestr = dateStringFormat.format(cal.getTime());
		return StringToDate(datestr, "yyyy-MM-dd");
	}

	/**
	 * 获取某一时间后五天
	 * 
	 * @param time
	 * @return
	 */
	public static Date getDayOverTime(Date date, int time) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, time);
		Date date1 = cal.getTime();
		return date1;
	}

	/**
	 * 时间比较
	 * 
	 * @param date
	 * @return
	 */
	public static boolean complane(Date date) {
		long time = date.getTime() - getOverTime(-12).getTime();

		return time > 0 ? true : false;
	}

	/**
	 * 判断是否在60分钟内
	 * 
	 * @param date
	 * @return
	 */
	public static boolean checkIn60Minute(Date date) {
		long time = new Date().getTime() - date.getTime();

		long diffent = time / 1000;
		System.out.println(diffent);
		return time / 1000 < 3600 ? true : false;
	}

	/**
	 * 倒计时
	 */
	public static String countdown(Date date) {
		String dateStr = "";
		long nowTime = new Date().getTime();
		long dateTime = date.getTime() - nowTime;
		long day = dateTime / (1000 * 60 * 60 * 24);
		long hour = (dateTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60);
		if (day > 0) {
			dateStr = String.valueOf(day) + "天";
		}
		if (hour > 0) {
			dateStr += String.valueOf(hour) + "小时";
		}
		return StringUtil.isNotBlank(dateStr) ? dateStr : "0天";
	}

	/**
	 * 支付时间离现在过去多久
	 * 
	 * @param date
	 * @return
	 */
	public static String countdownFromNow(Date date) {
		String dateStr = "";
		long nowTime = new Date().getTime();
		long dateTime = nowTime - date.getTime();
		long day = dateTime / (1000 * 60 * 60 * 24);
		long hour = (dateTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60);
		if (day > 0) {
			dateStr = String.valueOf(day) + "天";
		}
		if (hour > 0) {
			dateStr += String.valueOf(hour) + "小时";
		}
		return StringUtil.isNotBlank(dateStr) ? dateStr : "0小时";
	}

	// 获得当天几点时间
	public static Date getTimesmorning(int time) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, time);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 获取日期中的月
	 * 
	 * @param date
	 * @return
	 */
	public static String getYear(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		String year = cal.get(Calendar.YEAR) + "";
		return year;
	}

	/**
	 * 获取日期中的月
	 * 
	 * @param date
	 * @return
	 */
	public static String getMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		String month = cal.get(Calendar.MONTH) + 1 + "";
		return month;
	}

	/**
	 * 获取日期中的日
	 * 
	 * @param date
	 * @return
	 */
	public static String getDay(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		String day = cal.get(Calendar.DAY_OF_MONTH) + "";
		return day;
	}

	/**
	 * 几年前或几年后
	 * 
	 * @param time
	 * @return
	 */
	public static Date getYearOverTime(int time) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.YEAR, time);
		Date date = cal.getTime();
		return date;
	}

	public static String getYearMonthDay(Date date) {
		String str = getYear(date) + "年" + getMonth(date) + "月" + getDay(date)
				+ "日";
		return str;
	}

	/**
	 * 获取本月第一天
	 * 
	 * @return
	 */
	public static Date getFirstDayOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
		String datestr = dateStringFormat.format(c.getTime());
		return StringToDate(datestr, "yyyy-MM-dd");
	}

	/**
	 * 获取本月最后一天
	 * 
	 * @return
	 */
	public static Date getLastDayOfMonth(Date date) {
		// 获取当前月最后一天
		Calendar ca = Calendar.getInstance();
		ca.setTime(date);
		ca.set(Calendar.DAY_OF_MONTH,
				ca.getActualMaximum(Calendar.DAY_OF_MONTH));
		ca.add(Calendar.DATE, 1);
		return ca.getTime();
	}

	/**
	 * 获取下月第一天
	 * 
	 * @return
	 */
	public static Date getFirstDayOfNextMonth() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 1);
		c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
		String date = dateStringFormat.format(c.getTime());
		return StringToDate(date, "yyyy-MM-dd");
	}

	/**
	 * 几小时前或几小时后
	 * 
	 * @param time
	 * @return
	 */
	public static Date getHourOverTime(int time) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.HOUR, time);
		Date date = cal.getTime();
		return date;
	}

	public static void main(String[] args) {

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY); // 获取本周一的日期

		System.out.println(df.format(cal.getTime()));
		// 这种输出的是上个星期周日的日期，因为老外那边把周日当成第一天
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		// 增加一个星期，才是我们中国人理解的本周日的日期
		cal.add(Calendar.WEEK_OF_YEAR, 1);
		System.out.println(df.format(cal.getTime()));

	}

}
