package happylife.model.servicemodel;

public class TransactionReportBean {
	private String date ;
	private double value ;
	
	public TransactionReportBean(String date, double value) {
		super();
		this.date = date;
		this.value = value;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	
	
	
	
	

}
