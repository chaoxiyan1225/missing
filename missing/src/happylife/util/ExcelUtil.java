package happylife.util;
import happylife.model.servicemodel.CacheTransaction;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelUtil {
	private static final Log logger = LogFactory
			.getLog(ExcelUtil.class);
	
	@SuppressWarnings("deprecation")
	public static void exportTsrExcel(List<CacheTransaction> list,
			HttpServletResponse response) {
		if(null == list)
		{
			logger.error("list can not be null.");
			return ;
		}
		try {
			// 第一步，创建一个webbook，对应一个Excel文件
			HSSFWorkbook wb = new HSSFWorkbook();
			// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
			HSSFSheet sheet = wb.createSheet("流水统计");
			// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
			HSSFRow row = sheet.createRow((int) 0);
			// 第四步，创建单元格，并设置值表头 设置表头居中
			HSSFCellStyle style = wb.createCellStyle();
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

			HSSFCell cell = row.createCell((short) 0);
			cell.setCellValue("日期");
			cell.setCellStyle(style);
			cell = row.createCell((short) 1);
			cell.setCellValue("交易号");
			cell.setCellStyle(style);
			cell = row.createCell((short) 2);
			cell.setCellValue("交易金额（元）");
			cell.setCellStyle(style);
			cell = row.createCell((short) 3);
			cell.setCellValue("交易状态");
			cell.setCellStyle(style);
			// 第五步，写入实体数据 实际应用中这些数据从数据库得到，
			SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd: HH:mm:ss");
			for (int i = 0; i < list.size(); i++) {
				row = sheet.createRow((int) i + 1);
				CacheTransaction count = list.get(i);
				// 第四步，创建单元格，并设置值
				row.createCell((short) 0).setCellValue(
						DateUtil.DateToString(count.getTransaction().getRecordTime(),dd));
				row.createCell((short) 1).setCellValue(count.getTransaction().getOutTradeNo());
				row.createCell((short) 2).setCellValue(((double)count.getTransaction().getRecordMoney())/100);
				row.createCell((short) 3).setCellValue(count.getTransaction().getRecordStatus());
			}
			// 第六步，将文件存到指定位置
			String filename = DateUtil.dateToString(new Date())+".xls";// 设置下载时客户端Excel的名称
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition", "attachment;filename="
					+ filename);
			OutputStream fout = response.getOutputStream();
			wb.write(fout);
			fout.flush();
			fout.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
