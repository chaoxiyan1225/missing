package happylife.model.servicemodel;

public class ProductSearchCondition extends SearchCondition {
	
	public static class ConditionName
	{
		public static final String  MCHUSER_ID = "fkMchId";
		public static final String  TYPE = "type";
	}
	
	public ProductSearchCondition(RelationType relationType, Object conditionName,
			Object conditionValue) {
		super(relationType, conditionName, conditionValue);
		// TODO Auto-generated constructor stub
	}

}
