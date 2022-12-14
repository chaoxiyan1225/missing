package happylife.util.requestandresponse.messagebean;

/**
 * 响应音乐消息
 * @author Administrator
 *
 */
public class MusicMessage extends BaseMessage {
	  // 音乐  
    private Music Music;  
  
    public Music getMusic() {  
        return Music;  
    }  
  
    public void setMusic(Music music) {  
        Music = music;  
    } 
}
