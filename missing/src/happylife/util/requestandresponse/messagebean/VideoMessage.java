package happylife.util.requestandresponse.messagebean;

/**
 * 视频消息
 * @author Administrator
 *
 */
public class VideoMessage extends BaseMessage {
	
	//通过上传得到的ID
	private String MediaId;
	//视频缩略图
	private String ThumbMediaId;
	
	public String getMediaId() {
		return MediaId;
	}
	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}
	public String getThumbMediaId() {
		return ThumbMediaId;
	}
	public void setThumbMediaId(String thumbMediaId) {
		ThumbMediaId = thumbMediaId;
	}
	
	
	
}
