package happylife.dao;

import happylife.model.servicemodel.HqlQueryCondition;

import java.io.Serializable;
import java.util.List;

public interface GenericDao<T> {
	
	/**
	 * ���id��ȡ����
	 * @param clazz
	 * @param id
	 * @return
	 */
	public T get(Class<T> clazz ,int id);
	
	/**
	 * �������
	 * @param obj
	 * @return
	 */
	public Integer persist(T obj);
	
	/**
	 * �������
	 * @param obj
	 */
	public Serializable add(T obj);
	
	/**
	 * ɾ�����
	 * @param obj
	 */
	public void delete(T obj);
	
	/**
	 * ���¶���
	 * @param obj
	 */
	public void update(T obj);

	/**
	 * ���id��ȡ����
	 * @param classzz
	 * @param oid
	 * @return
	 */
	public T getObject(Class<T> classzz, Serializable oid);
	
	/**
	 * ��ȡ�������н�������
	 * @param classzz
	 * @return
	 */
	public List<T> findAll(Class<T> classzz);
	
	/**
	 * ��ȡ�������н�����
	 * @param classzz
	 * @return
	 */
	public List<T> getAll(Class<T> classzz);
	
	/**
	 * �������¶���
	 * @param obj
	 */
	public void saveOrupdate(T obj);
	
	/**
	 * ��ȡ����ҳ��ʱ�併������
	 * @param pageNum
	 * @param pageSize
	 * @param classes
	 * @return
	 */
	public List<T> getByPageDescTime(int pageNum,int pageSize,Class<T> classes);
	
	/**
	 * ��ȡ����ҳ��ʱ����������
	 * @param pageNum
	 * @param pageSize
	 * @param classes
	 * @return
	 */
	public List<T> getByPageAscTime(int pageNum,int pageSize,Class<T> classes);
	
	/**
	 * ��ȡ���н��ʱ����������
	 * @param classes
	 * @return
	 */
	public List<T> getAllDescTime(Class<T> classes);
	
	/**
	 * ��ȡ���н��ʱ����������
	 * @param classes
	 * @return
	 */
	public List<T> getAllAscTime(Class<T> classes);
	
	/**
	 * ������Ժ�����ֵ��ȡ��������
	 * @param classes
	 * @param key
	 * @param value
	 * @return
	 */
	public T getObjectByProperty(Class<T> classes, String key, Object value);
	
	/**
	 * ������Ժ�����ֵ��ȡ������
	 * @param classes
	 * @param key
	 * @param value
	 * @return
	 */
	public List<T> getListByProperty(Class<T> classes,String key, Object value);
	
	/**
	 * ������Ժ�����ֵ��ȡ������ʱ����������
	 * @param classes
	 * @param key
	 * @param value
	 * @return
	 */
	public List<T> getListByPropertyAsc(Class<T> classes,String key, Object value);
	
	/**
	 * 查询满足单一条件的 记录数目
	 * @param classes
	 * @param key
	 * @param value
	 * @return
	 */
	public List<T> getListByPropertyDesc(Class<T> classes,String key, Object value);
	
	/**
	 * 查询所有记录个数
	 * @param classes
	 * @return
	 */
	public Long getCount(String classes);
	

	/** 根据条件查询 符合的记录
	 * @param classes
	 * @param condition
	 * @return
	 */
	public List<T> getListByQueryCondtion(Class<T> classes , HqlQueryCondition condition) ;
	
	/** 根据条件查询 符合的数目
	 * @param classes
	 * @param condition
	 * @return
	 */
	public long getCountByQueryCondtion(Class<T> classes , HqlQueryCondition condition) ;
	
	/** 根据条件计算某列总和
	 * @param classes
	 * @param condition
	 * @return
	 */
	public int  sumByQueryCondtion(Class<T> classes , HqlQueryCondition condition ,String sumProperty) ;
	
	
	
	
	
}