package happylife.dao.impl;

import happylife.dao.GenericDao;
import happylife.model.servicemodel.HqlQueryCondition;
import happylife.model.servicemodel.HqlQueryCondition.Relation;
import happylife.util.ValidateUtil;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("unchecked")
public class GenericDaoImpl<T> extends HibernateDaoSupport implements
		GenericDao<T> {

	private GenericDao<T> genericDao;

	public GenericDao<T> getGenericDao() {
		return genericDao;
	}

	public void setGenericDao(GenericDao<T> genericDao) {
		this.genericDao = genericDao;
	}

	public T getObject(Class<T> classzz, Serializable oid) {
		if (oid != null) {
			return getHibernateTemplate().get(classzz, oid);
		} else {
			return null;
		}
	}

	public List<T> findAll(Class<T> classzz) {
		return getHibernateTemplate().loadAll(classzz);
	}

	public List<T> getAll(Class<T> classzz) {
		return getHibernateTemplate().loadAll(classzz);
	}

	public Integer persist(Serializable obj) {
		return (Integer) getHibernateTemplate().save(obj);
	}

	public void add(Serializable obj) {
		getHibernateTemplate().persist(obj);
	}

	public void update(Serializable obj) {
		getHibernateTemplate().update(obj);
	}

	public Integer persist(T obj) {
		return (Integer) getHibernateTemplate().save(obj);
	}

	public Serializable add(T obj) {
		return getHibernateTemplate().save(obj);
	}

	public void update(T obj) {
		getHibernateTemplate().update(obj);
	}

	public T get(@SuppressWarnings("rawtypes") Class clazz, int id) {
		if (id != 0) {
			return (T) getHibernateTemplate().get(clazz, id);
		} else {
			return null;
		}
	}

	public void saveOrupdate(T obj) {
		getHibernateTemplate().saveOrUpdate(obj);
	}

	public List<T> getByPageDescTime(int pageNum, int pageSize, Class<T> classes) {

		Criteria criteria = getSession().createCriteria(classes);
		int first = (pageNum - 1) * pageSize;
		criteria.setFirstResult(first);
		criteria.setMaxResults(pageSize);
		criteria.addOrder(org.hibernate.criterion.Order.desc("time"));
		List<T> list = criteria.list();
		return ValidateUtil.checkListIsNotEmpty(list) ? list : null;
	}

	public List<T> getAllDescTime(Class<T> classes) {

		Criteria criteria = getSession().createCriteria(classes);
		criteria.addOrder(org.hibernate.criterion.Order.desc("time"));
		List<T> list = criteria.list();
		return ValidateUtil.checkListIsNotEmpty(list) ? list : null;
	}

	public List<T> getAllAscTime(Class<T> classes) {

		Criteria criteria = getSession().createCriteria(classes);
		criteria.addOrder(org.hibernate.criterion.Order.asc("time"));
		List<T> list = criteria.list();
		return ValidateUtil.checkListIsNotEmpty(list) ? list : null;
	}

	public List<T> getListByProperty(Class<T> classes, String key, Object value) {
		Criteria criteria = getSession().createCriteria(classes);
		criteria.add(Restrictions.eq(key, value));
		List<T> list = criteria.list();
		return ValidateUtil.checkListIsNotEmpty(list) ? list : null;
	}

	public T getObjectByProperty(Class<T> classes, String key, Object value) {
		Criteria criteria = getSession().createCriteria(classes);
		criteria.add(Restrictions.eq(key, value));
		List<T> list = criteria.list();
		return ValidateUtil.checkListIsNotEmpty(list) ? list.get(0) : null;
	}

	public void delete(T obj) {
		getHibernateTemplate().delete(obj);
	}

	public List<T> getByPageAscTime(int pageNum, int pageSize, Class<T> classes) {
		Criteria criteria = getSession().createCriteria(classes);
		int first = (pageNum - 1) * pageSize;
		criteria.setFirstResult(first);
		criteria.setMaxResults(pageSize);
		criteria.addOrder(org.hibernate.criterion.Order.asc("time"));
		List<T> list = criteria.list();
		return ValidateUtil.checkListIsNotEmpty(list) ? list : null;
	}

	public Long getCount(String classes) {
		String hql = "select count(*) from " + classes;
		return Long.parseLong(super.getSession().createQuery(hql)
				.uniqueResult().toString());
	}

	public List<T> getListByPropertyAsc(Class<T> classes, String key,
			Object value) {
		Criteria criteria = getSession().createCriteria(classes);
		criteria.add(Restrictions.eq(key, value));
		criteria.addOrder(org.hibernate.criterion.Order.asc("time"));
		List<T> list = criteria.list();
		return ValidateUtil.checkListIsNotEmpty(list) ? list : null;
	}

	public List<T> getListByPropertyDesc(Class<T> classes, String key,
			Object value) {
		Criteria criteria = getSession().createCriteria(classes);
		criteria.add(Restrictions.eq(key, value));
		criteria.addOrder(org.hibernate.criterion.Order.desc("time"));
		List<T> list = criteria.list();
		return ValidateUtil.checkListIsNotEmpty(list) ? list : null;

	}

	@Override
	public List<T> getListByQueryCondtion(Class<T> classes,
			HqlQueryCondition condition) {
		
		Criteria criteria = getSession().createCriteria(classes);
		for(HqlQueryCondition.Property p : condition.getProperties())
		{
			String key = p.getKey();
			Object value = p.getValue();
			Relation relation = p.getRelation();
			switch(relation)
			{
				case EQ : criteria.add(Restrictions.eq(key, value)); break ;
				case GE : criteria.add(Restrictions.ge(key, value)); break ;
				case LE : criteria.add(Restrictions.le(key, value)); break ;
				default :  break ;
					
			}
					
		}
		
		if(condition.getFirstResult() != -1)
		{
			criteria.setFirstResult(condition.getFirstResult());
		}
		
		if(condition.getMaxResults() != -1)
		{
			criteria.setMaxResults(condition.getMaxResults());	
		}
		
		if(null != condition.getOrderName())
		{
			if(condition.isAesc())
				criteria.addOrder(org.hibernate.criterion.Order.asc(condition.getOrderName()));
			else
				criteria.addOrder(org.hibernate.criterion.Order.desc(condition.getOrderName()));
		}
		
		List<T> list = criteria.list();
		return ValidateUtil.checkListIsNotEmpty(list) ? list : null;
	}

	@Override
	public long getCountByQueryCondtion(Class<T> classes,
			HqlQueryCondition condition) {
		Criteria criteria = getSession().createCriteria(classes);
		for(HqlQueryCondition.Property p : condition.getProperties())
		{
			String key = p.getKey();
			Object value = p.getValue();
			Relation relation = p.getRelation();
			switch(relation)
			{
				case EQ : criteria.add(Restrictions.eq(key, value)); break ;
				case GE : criteria.add(Restrictions.ge(key, value)); break ;
				case LE : criteria.add(Restrictions.le(key, value)); break ;
				default :  break ;
					
			}
					
		}
		

	
		List<T> list = criteria.list();
		return ValidateUtil.checkListIsNotEmpty(list) ? list.size() : 0;
	}
	
	
	/** 根据条件计算某列总和
	 * @param classes
	 * @param condition
	 * @return
	 */
	public int  sumByQueryCondtion(Class<T> classes , HqlQueryCondition condition ,String sumProperty) {
		
		Criteria criteria = getSession().createCriteria(classes);
		
		for(HqlQueryCondition.Property p : condition.getProperties())
		{
			String key = p.getKey();
			Object value = p.getValue();
			Relation relation = p.getRelation();
			switch(relation)
			{
				case EQ : criteria.add(Restrictions.eq(key, value)); break ;
				case GE : criteria.add(Restrictions.ge(key, value)); break ;
				case LE : criteria.add(Restrictions.le(key, value)); break ;
				default :  break ;
					
			}
					
		}
		
        criteria.setProjection(Projections.sum(sumProperty)); 
        List list=criteria.list(); 

        if(!ValidateUtil.checkListIsNotEmpty(list))
        {
        	return 0;
        }
        
        if(list.get(0) == null)
        	return 0;
        
        return (int) list.get(0);
        
		
	}

}
