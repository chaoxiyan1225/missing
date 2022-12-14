package happylife.model.servicemodel;

/** 条件检索的基类
 * @author 闫朝喜
 *
 */
public class SearchCondition {
	
	/**
	 * 条件查询支持的集中关系
	 *
	 */
    public static enum  RelationType
	{
		EQUAL , //相等， 需要调用 conditionName 对应的 conditionValue值 equals = true
		CONTAIN, // 包含 ，一般用于字符串 ，包含 条件中的 字符串
		LESS_THAN,// 小于
		GREATER_THAN,//大于
		NO_MORE_THAN,//小于等于
		NO_LESS_THAN,//大于等于
	}
	
	private RelationType relationType ;
	private Object conditionName;
	private Object conditionValue;
	
	public SearchCondition(RelationType relationType, Object conditionName ,Object conditionValue)
	{
		this.relationType = relationType ;
		this.conditionName = conditionName;
		this.conditionValue = conditionValue;
	}
	
	public RelationType getRelationType() {
		return relationType;
	}
	
	public Object getConditionName() {
		return conditionName;
	}
	public Object getConditionValue() {
		return conditionValue;
	}
	
	
	

}
