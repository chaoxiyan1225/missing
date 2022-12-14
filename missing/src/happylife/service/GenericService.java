package happylife.service;

import java.io.Serializable;
import java.util.List;

public interface GenericService<T> {
	
	/**
	 * 保存对象
	 * @param obj
	 * @return
	 */
	public Integer save(T obj);
	
	/**
	 * 获取所有结果集，带缓存
	 * @param clazz
	 * @return
	 */
	public List<T> getAll(Class<T> clazz);
	
	/**
	 * 删除对象
	 * @param obj
	 */
	public void delete(T obj);
	
	/**
	 * 修改对象
	 * @param obj
	 */
	public void update(T obj);
	
	/**
	 * 根据Id获取对象
	 * @param clazz
	 * @param oid
	 * @return
	 */
	public T getObject(Class<T> clazz, Serializable oid);
	
	/**
	 * 获取所有结果集，不带缓存
	 * @param clazz
	 * @return
	 */
	public List<T> findAll(Class<T> clazz);
	
	/**
	 * 保存对象
	 * @param clazz
	 */
	public void add(T clazz);	
	
	/**
	 * 保存对象
	 * @param obj
	 */
	public void addPersist(T obj);
	
	/**
	 * 根据主键获取对象
	 * @param obj
	 */
	public T get(Class clazz,int id);
	

	/**
	 * 根据属性和属性值获取结果集
	 * @param classes
	 * @param key
	 * @param value
	 * @return
	 */
	public  List<T> getListByProperty(Class<T> classes,String key, Object value);
	
	/**
	 * 根据属性和属性值获取单个结果
	 * @param classes
	 * @param key
	 * @param value
	 * @return
	 */
	public  T getObjectByProperty(Class<T> classes,String key, Object value);
	
	/**
	 * 保存或更新对象
	 * @param obj
	 */
	public void saveOrupdate(T obj);
	
	/**
	 * 保存或更新对象集合
	 * @param obj
	 */
	public void saveOrupdate(List<T>obj);
	
	
	/**
	 * 获取结果集分页按时间降幂排序
	 * @param pageNum
	 * @param pageSize
	 * @param classes
	 * @return
	 */
	public List<T> getByPageDescTime(int pageNum,int pageSize,Class<T> classes);
	
	/**
	 * 获取结果集分页按时间升幂排序
	 * @param pageNum
	 * @param pageSize
	 * @param classes
	 * @return
	 */
	public List<T> getByPageAscTime(int pageNum,int pageSize,Class<T> classes);
	
	/**
	 * 获取所有结果集按时间升幂排序
	 * @param classes
	 * @return
	 */
	public List<T> getAllDescTime(Class<T> classes);
	
	/**
	 * 获取所有结果集按时间升幂排序
	 * @param classes
	 * @return
	 */
	public List<T> getAllAscTime(Class<T> classes);
	
	/**
	 * 根据属性和属性值获取对象结果集时间升幂排序
	 * @param classes
	 * @param key
	 * @param value
	 * @return
	 */
	public List<T> getListByPropertyAsc(Class<T> classes,String key, Object value);
	
	/**
	 * 根据属性和属性值获取对象结果集时间降幂排序
	 * @param classes
	 * @param key
	 * @param value
	 * @return
	 */
	public List<T> getListByPropertyDesc(Class<T> classes,String key, Object value);
}
