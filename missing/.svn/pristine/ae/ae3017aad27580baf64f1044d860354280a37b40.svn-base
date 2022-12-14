package happylife.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

public class MuiltFileUploadUtil {
	private static final Log logger = LogFactory
			.getLog(MuiltFileUploadUtil.class);

	// 设置最多只允许在内存中存储的数据,单位:字节，这个参数不要设置太大
	private static int sizeThreshold = 4096;
	// 设置允许用户上传文件大小,单位:字节,共10M
	private static long sizeMax = 10485760;

	private static boolean isSmallPic = false;
	
	private static AtomicInteger count = new AtomicInteger(0);
	
	private static final int MAX_UPLOAD_COUNT = 10; //至多允许10个并发上传文件
	// 设置编码方式
	private static String encodeType = "UTF-8";
	// 需要过滤掉的文件类型
	private static String[] errorType = { ".exe", ".com", ".cgi", ".asp",
			".php", ".jsp" };

	/**
	 * 生成servletFileUpload请求
	 * 
	 * @param tempPath
	 * @param dstPath
	 * @param fileuploadReq
	 * @return
	 */
	private static ServletFileUpload generateUploadServlet(
			final String tempPath, final String dstPath,
			final HttpServletRequest fileuploadReq) {
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// 如果没有上传目的目录，则创建它
		FileUtil.makeDirectory(dstPath + "/ddd");

		// 如果没有临时目录，则创建它
		FileUtil.makeDirectory(tempPath + "/ddd");

		// 上传图片只要足够小保留在内存里,
		// 较大的图片应该被写在硬盘的临时文件上,非常大的上传请求应该避免,限制项目在内存中所占的空间，限制最大的上传请求，并且设定临时文件的位置。
		// 设置最多只允许在内存中存储的数据,单位:字节
		factory.setSizeThreshold(sizeThreshold);
		// the location for saving data that is larger than
		// getSizeThreshold()
		factory.setRepository(new File(tempPath));
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 设置允许用户上传文件大小,单位:字节
		upload.setSizeMax(sizeMax);

		return upload;

	}

	/**
	 * 依次上传文件
	 * 
	 * @param iter
	 *            ： 包含表单文件的的迭代器
	 * @param newFilePrefix
	 *            :新生成的路径前缀
	 * @param dstPath
	 *            ：上传的目的路径，绝对路径
	 * @throws IOException
	 *             ： 上传某个文件失败则异常退出
	 */

	@SuppressWarnings("rawtypes")
	private static Map<String, String> uploadFile(Iterator iter,
			String newFilePrefix, String dstPath,
			HttpServletRequest fileUploadReq) throws IOException {
		Map<String, String> filds = new HashMap<String, String>();
		// 图片文件序号
		int picSeqNo = 0;

		while (iter.hasNext()) {
			FileItem item = (FileItem) iter.next();

			String fildName = item.getFieldName();
			// 生成所有未生成的目录
			logger.info("the filedName=" + fildName);
			// 忽略其他不是文件域的所有表单信息
			if (!item.isFormField()) {
				String name = item.getName();
				logger.info("the filed name=" + name);
				long size = item.getSize();
				// 有多个文件域时，只上传有文件的
				if ((StringUtils.isBlank(name)) && size == 0)
					continue;

				for (int temp = 0; temp < errorType.length; temp++) {
					if (name.endsWith(errorType[temp])) {
						throw new IOException(name + ": Wrong File Type");
					}
				}
				String ext = "." + FileUtil.getTypePart(name);

				try {
					// 保存上传的文件到指定的目录
					StringBuilder sb = new StringBuilder(dstPath);
					String uploadfilename = sb.append(File.separator)
							.append(newFilePrefix).append("_").append(picSeqNo)
							.append(ext).toString();

					// 生成所有未生成的目录
					logger.info("the abstract filename=" + uploadfilename);

					//FileUtil.makeDirectory(uploadfilename);
					item.write(new File(uploadfilename));
					// 文件属性的值为其生成的绝对路径本身
					filds.put(fildName, new StringBuilder(newFilePrefix)
							.append("_").append(picSeqNo).append(ext)
							.toString());
					picSeqNo++;
				} catch (Exception e) {
					throw new IOException(e.getMessage());
				}

			} else {
				// 解析到的字段放到
				filds.put(fildName, item.getString(encodeType));
			}
		}

		return filds;
	}

	/**
	 * @param tempPath
	 *            : 临时路径 ，绝对路径
	 * @param dstPath
	 *            ：最终路径 ，绝对路径
	 * @param fileuploadRequest
	 *            ： 上传图片的请求
	 * @return
	 * @throws FileUploadException
	 * @throws IOException
	 */
	@SuppressWarnings("rawtypes")
	public static Map<String, String> parseRequestAndUploadFile(
			String tempPath, String dstPath, String newFilePrefix,
			HttpServletRequest fileUploadReq) throws FileUploadException,
			IOException {

		if (StringUtils.isBlank(tempPath) || StringUtils.isBlank(dstPath)
				|| StringUtils.isBlank(newFilePrefix) || null == fileUploadReq) {
			logger.error(tempPath + "," + dstPath + "," + newFilePrefix);
			throw new IllegalArgumentException("tempPath,dstPath,newFilePrefix");
		}
		
		//超过最大限制 则拒绝上传
		if(count.incrementAndGet() > MAX_UPLOAD_COUNT)
		{
			logger.error("system  is busy");
			
			//释放申请的锁
			count.decrementAndGet();
			throw  new FileUploadException();
		}

		// 根据请求生成 fileUpload
		ServletFileUpload upload = generateUploadServlet(tempPath, dstPath,
				fileUploadReq);

	
		// 从request中解析出来上传的表单元素
		List fileItems = upload.parseRequest(fileUploadReq);
		Iterator iter = fileItems.iterator();

		// 把请求中的所有文件依次上传
		Map filds = uploadFile(iter, newFilePrefix, dstPath, fileUploadReq);
		
		//上传完释放锁
		count.decrementAndGet();
		
		return filds ;

	}

	/** 从路径中获取单独文件 */
	public String GetFileName(String filepath) {
		String returnstr = "*.*";
		int length = filepath.trim().length();
		filepath = filepath.replace('\\', '/');
		if (length > 0) {
			int i = filepath.lastIndexOf("/");
			if (i >= 0) {
				filepath = filepath.substring(i + 1);
				returnstr = filepath;
			}
		}
		return returnstr;
	}
	
	
	/**
	   * 根据设置的宽高等比例压缩图片文件<br> 先保存原文件，再压缩、上传
	   * @param oldFile 要进行压缩的文件
	   * @param newFile 新文件
	   * @param width 宽度 //设置宽度时（高度传入0，等比例缩放）
	   * @param height 高度 //设置高度时（宽度传入0，等比例缩放）
	   * @param quality 质量
	   * @return 返回压缩后的文件的全路径
	   */
	  public static String zipImageFile(File oldFile,File newFile, int width, int height,float quality) {
	    if (oldFile == null) {
	      return null;
	    }
	    try {
	      /** 对服务器上的临时文件进行处理 */
	      Image srcFile = ImageIO.read(oldFile);
	      int w = srcFile.getWidth(null);
	      int h = srcFile.getHeight(null);
	      double bili;
	      if(width>0){
	        bili=width/(double)w;
	        height = (int) (h*bili);
	      }else{
	        if(height>0){
	          bili=height/(double)h;
	          width = (int) (w*bili);
	        }
	      }
	      String srcImgPath = newFile.getAbsoluteFile().toString();
	      System.out.println(srcImgPath);
	      String subfix = "jpg";
	      subfix = srcImgPath.substring(srcImgPath.lastIndexOf(".")+1,srcImgPath.length());
	      BufferedImage buffImg = null;
	      if(subfix.equals("png")){
	        buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
	      }else{
	        buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	      }
	      Graphics2D graphics = buffImg.createGraphics();
	      graphics.setBackground(new Color(255,255,255));
	      graphics.setColor(new Color(255,255,255));
	      graphics.fillRect(0, 0, width, height);
	      graphics.drawImage(srcFile.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);
	      ImageIO.write(buffImg, subfix, new File(srcImgPath));
	    } catch (FileNotFoundException e) {
	      e.printStackTrace();
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
	    return newFile.getAbsolutePath();
	  }
	  /**
	   * 按设置的宽度高度压缩图片文件<br> 先保存原文件，再压缩、上传
	   * @param oldFile 要进行压缩的文件全路径
	   * @param newFile 新文件
	   * @param width 宽度
	   * @param height 高度
	   * @param quality 质量
	   * @return 返回压缩后的文件的全路径
	   */
	  public static String zipWidthHeightImageFile(File oldFile,File newFile, int width, int height,float quality) {
	    if (oldFile == null) {
	      return null;
	    }
	    String newImage = null;
	    try {
	      /** 对服务器上的临时文件进行处理 */
	      Image srcFile = ImageIO.read(oldFile);
	      String srcImgPath = newFile.getAbsoluteFile().toString();
	      System.out.println(srcImgPath);
	      String subfix = "jpg";
	      subfix = srcImgPath.substring(srcImgPath.lastIndexOf(".")+1,srcImgPath.length());
	      BufferedImage buffImg = null;
	      if(subfix.equals("png")){
	        buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
	      }else{
	        buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	      }
	      Graphics2D graphics = buffImg.createGraphics();
	      graphics.setBackground(new Color(255,255,255));
	      graphics.setColor(new Color(255,255,255));
	      graphics.fillRect(0, 0, width, height);
	      graphics.drawImage(srcFile.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);
	      ImageIO.write(buffImg, subfix, new File(srcImgPath));
	    } catch (FileNotFoundException e) {
	      e.printStackTrace();
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
	    return newImage;
	  }


}