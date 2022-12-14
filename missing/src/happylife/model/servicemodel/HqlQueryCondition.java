package happylife.model.servicemodel;

import java.util.ArrayList;
import java.util.List;


public class HqlQueryCondition {
	private int firstResult = -1 ;
	private int maxResults  = -1 ;
	private List<Property> properties;
	private String orderName = null;
	private boolean isAesc = true;
	
	public HqlQueryCondition(){
		properties = new ArrayList<Property>();
	}
	
	public int getFirstResult() {
		return firstResult;
	}
	public void setFirstResult(int firstResult) {
		this.firstResult = firstResult;
	}
	public int getMaxResults() {
		return maxResults;
	}
	public void setMaxResults(int maxResults) {
		this.maxResults = maxResults;
	}

	public List<Property> getProperties() {
		return properties;
	}

	public void setProperties(List<Property> properties) {
		this.properties = properties;
	}

	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public boolean isAesc() {
		return isAesc;
	}
	public void setAesc(boolean isAesc) {
		this.isAesc = isAesc;
	}
	
	public static  class Property
	{
		private Relation relation ;
		private String key ;
		private Object  value;
		
		public Property(Relation relation, String key, Object value) {
			super();
			this.relation = relation;
			this.key = key;
			this.value = value;
		}

		public Relation getRelation() {
			return relation;
		}

		public String getKey() {
			return key;
		}

		public Object getValue() {
			return value;
		}
		
	}
	
	public static enum Relation{
		EQ ,GE,LE,
	}
	
}
