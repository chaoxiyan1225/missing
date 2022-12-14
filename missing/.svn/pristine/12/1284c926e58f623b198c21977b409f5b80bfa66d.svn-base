package happylife.service.impl;

import java.io.Serializable;
import java.util.List;

import happylife.dao.GenericDao;
import happylife.service.GenericService;
public class GenericServiceImpl<T extends Serializable> implements GenericService<T> {

	
	@SuppressWarnings("rawtypes")
	private GenericDao<T> genericDao;

	@SuppressWarnings("rawtypes")
	public void setGenericDao(GenericDao genericDao) {
		this.genericDao = genericDao;
	}


	public Integer save(T obj) {
		return genericDao.persist(obj);
	}

	public List<T> getAll(Class<T> clazz) {
		return genericDao.findAll(clazz);
	}

	public void delete(T obj) {
		genericDao.delete(obj);
	}

	public void update(T obj) {
		genericDao.update(obj);
	}

	public void saveOrupdate(T obj) {
		genericDao.saveOrupdate(obj);
	}

	public T getObject(Class<T> clazz, Serializable oid) {
		return genericDao.getObject(clazz, oid);
	}
	
	@Override
	public T get(Class clazz, int id) {
		return genericDao.get(clazz, id);
	}

	public List<T> findAll(Class<T> clazz) {
		return genericDao.findAll(clazz);
	}

	public void add(T clazz) {
		genericDao.persist(clazz);
	}

	public void addPersist(T obj) {
		genericDao.add(obj);
	}
	public void saveOrupdate(List<T> objs) {
		for (T obj : objs) {
			genericDao.saveOrupdate(obj);
		}
	}


	public List<T> getListByProperty(Class<T> classes, String key, Object value) {
		return genericDao.getListByProperty(classes, key, value);
	}

	public T getObjectByProperty(Class<T> classes, String key, Object value) {
		return genericDao.getObjectByProperty(classes, key, value);
	}

	public List<T> getByPageDescTime(int pageNum, int pageSize, Class<T> classes) {
		return genericDao.getByPageDescTime(pageNum,pageSize,classes);
	}

	public List<T> getByPageAscTime(int pageNum, int pageSize, Class<T> classes) {
		return genericDao.getByPageAscTime(pageNum,pageSize,classes);
	}

	public List<T> getAllDescTime(Class<T> classes) {
		return genericDao.getAllDescTime(classes);
	}

	public List<T> getAllAscTime(Class<T> classes) {
		return genericDao.getAllAscTime(classes);
	}

	public List<T> getListByPropertyAsc(Class<T> classes, String key,
			Object value) {
		return genericDao.getListByPropertyAsc(classes, key, value);
	}

	public List<T> getListByPropertyDesc(Class<T> classes, String key,
			Object value) {
		return genericDao.getListByPropertyDesc(classes, key, value);
	}

}
