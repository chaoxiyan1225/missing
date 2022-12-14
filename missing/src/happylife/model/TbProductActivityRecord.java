package happylife.model;

// Generated 2016-5-21 15:47:52 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * TbProduct generated by hbm2java
 */
public class TbProductActivityRecord implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6414088976126783504L;
	private Integer id;
	private int fkActivityId;
	private int fkProductId;
	private int thresholdValue;
	private Date startTime;
	private Date endTime;
	private String extProps;

	public TbProductActivityRecord() {
	}

	public TbProductActivityRecord(int id, int fkActivityId, int fkProductId,
			int thresholdValue, Date startTime, Date endTime) {
		this.fkActivityId = fkActivityId;
		this.fkProductId = fkProductId;
		this.thresholdValue = thresholdValue;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getFkActivityId() {
		return fkActivityId;
	}

	public void setFkActivityId(int fkActivityId) {
		this.fkActivityId = fkActivityId;
	}

	public int getFkProductId() {
		return fkProductId;
	}

	public void setFkProductId(int fkProductId) {
		this.fkProductId = fkProductId;
	}

	public int getThresholdValue() {
		return thresholdValue;
	}

	public void setThresholdValue(int thresholdValue) {
		this.thresholdValue = thresholdValue;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getExtProps() {
		return extProps;
	}

	public void setExtProps(String extProps) {
		this.extProps = extProps;
	}

	@Override
	public String toString() {
		return "TbProductActivityRecord [id=" + id + ", fkActivityId="
				+ fkActivityId + ", fkProductId=" + fkProductId
				+ ", thresholdValue=" + thresholdValue + ", startTime="
				+ startTime + ", endTime=" + endTime + "]";
	}

}
