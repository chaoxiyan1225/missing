package happylife.service.exception;

@SuppressWarnings("serial")
public class HappyLifeException  extends Exception{
	private String message ;
	
	public HappyLifeException(String message)
	{
		this.message = message;
	}
	
}
