package happylife.model.servicemodel;

public class MchSearchCondition extends SearchCondition {
	
	public static class ConditionName
	{
		public static final String  MCH_NAME = "name";
		public static final String  MCH_ADDRESS = "address";
	}
	

	public MchSearchCondition(RelationType relationType, Object conditionName,
			Object conditionValue) {
		super(relationType, conditionName, conditionValue);
		// TODO Auto-generated constructor stub
	}

}
