package happylife.model.servicemodel;

import happylife.model.TbActivity;
import happylife.model.TbProductActivityRecord;

public class CacheProductActivity extends TbProductActivityRecord {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7904352960034380520L;
	private TbActivity activity;
	private TbProductActivityRecord record;

	public CacheProductActivity(TbActivity activity,
			TbProductActivityRecord record) {
		super();
		this.activity = activity;
		this.record = record;
	}

	public TbActivity getActivity() {
		return activity;
	}

	public void setActivity(TbActivity activity) {
		this.activity = activity;
	}

	public TbProductActivityRecord getRecord() {
		return record;
	}

	public void setRecord(TbProductActivityRecord record) {
		this.record = record;
	}

}
