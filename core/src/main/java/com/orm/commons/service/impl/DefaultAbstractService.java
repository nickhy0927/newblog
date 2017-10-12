package com.orm.commons.service.impl;

import com.orm.commons.exception.ServiceException;
import com.orm.commons.service.BaseService;
import com.orm.commons.service.HyJpaRepostiory;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.PageSupport;
import com.orm.commons.utils.Pager;
import org.hibernate.Criteria;
import org.hibernate.criterion.Disjunction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Transactional(readOnly = true)
public abstract class DefaultAbstractService<E, ID extends Serializable> implements BaseService<E, ID> {

    @Autowired
    protected HyJpaRepostiory<E, ID> dao;

    @Override
    @Transactional(readOnly = false)
    public void delete(ID id) throws ServiceException {
        E t = get(id);
        if (t != null) {
            this.dao.delete(id);
        }
    }

    @Override
    public void delete(Iterable<E> entities) throws ServiceException {
        this.dao.delete(entities);
    }

    @Override
    @Transactional(readOnly = false)
    public void deleteAll() throws ServiceException {
        this.dao.deleteAll();
    }

    @Override
    @SuppressWarnings("unchecked")
    public void deleteBatch(String[] ids) throws ServiceException {
        if (ids != null && ids.length > 0) {
            for (int i = 0; i < ids.length; i++) {
                String id = ids[i];
                delete((ID) id);
            }
        }
    }

    @Override
    public List<E> findAll() throws ServiceException {
        return dao.findAll();
    }

    @Override
    public E get(ID id) throws ServiceException {
        return this.dao.findOne(id);
    }

    @Override
    public List<E> queryByMap(Map<String, Object> map) throws ServiceException {
        return this.dao.queryByMap(map);
    }

    @Override
    public List<E> queryByMap(Map<String, Object> paramMap, Sort sort) throws ServiceException {
        return dao.queryByMap(paramMap, sort);
    }

    @Override
    public Page<E> queryPageByMap(Map<String, Object> map, Pageable pageable) throws ServiceException {
        return this.dao.queryPageByMap(map, pageable);
    }

    @Override
    public ObjectTools<E> queryPageByMap(Map<String, Object> map, String currentPage, Sort sort) throws ServiceException {
        List<E> list = queryByMap(map);
        Pager pager = new Pager(list.size(), currentPage);
        int page = 0;
        if (pager.getCurrentPage() - 1 >= 0) {
            page = pager.getCurrentPage() - 1;
        }
        PageSupport pageable = new PageSupport(page, pager.getPageSize(), sort);
        Page<E> pageInfo = queryPageByMap(map, pageable);
        ObjectTools<E> object = new ObjectTools<E>();
        object.setEntities(pageInfo.getContent());
        object.setPager(pager);
        return object;
    }
    
    @Override
    public ObjectTools<E> queryPageByMap(Map<String, Object> map, String currentPage, Sort sort, Pager pager)
    		throws ServiceException {
    	 List<E> list = queryByMap(map);
         int pageSize = pager.getPageSize();
    	 pager = new Pager(list.size(), currentPage);
         pager.setPageSize(pageSize);
         int page = 0;
         if (pager.getCurrentPage() - 1 >= 0) {
             page = pager.getCurrentPage() - 1;
         }
         PageSupport pageable = new PageSupport(page, pager.getPageSize(), sort);
         Page<E> pageInfo = queryPageByMap(map, pageable);
         ObjectTools<E> object = new ObjectTools<E>();
         object.setEntities(pageInfo.getContent());
         object.setPager(pager);
         return object;
    }

    @Override
    @Transactional(readOnly = false)
    public E save(E entity) throws ServiceException {
        return (E) this.dao.saveEntity(entity);
    }
    
    @Override
    @Transactional(readOnly = false)
    public List<E> saveBatch(Iterable<E> entity) throws ServiceException {
    	return this.dao.save(entity);
    }

    @Override
    public Page<E> queryByPage(Pageable paramPageable) {
        return this.dao.queryByPage(paramPageable);
    }

    @Override
    public int nativeSqlUpdate(String paramString, Map<String, ?> paramMap) {
        return this.dao.nativeSqlUpdate(paramString, paramMap);
    }

    @Override
    public List<E> findByEntityList(Map<String, Object> paramMap) {
        return dao.findByEntityList(paramMap);
    }

    @Override
    public Page<E> queryPageByCriteria(Criteria paramCriteria, Pageable paramPageable) {
        return dao.queryPageByCriteria(paramCriteria, paramPageable);
    }

    @Override
    public List<E> queryByCriteria(Criteria paramCriteria, int paramInt) {
        return dao.queryByCriteria(paramCriteria, paramInt);
    }

    @Override
    public List<E> queryByCriteria(Criteria paramCriteria, Sort paramSort) {
        return dao.queryByCriteria(paramCriteria, paramSort);
    }

    @Override
    public Disjunction createdDisjunction(Map<String, Object> paramMap) {
        return dao.createdDisjunction(paramMap);
    }

    @Override
    public int nativeSqlUpdate(String paramString, Object... paramVarArgs) {
        return dao.nativeSqlUpdate(paramString, paramVarArgs);
    }

    @Override
    public void insertInBatch(List<E> paramList) {
        dao.insertInBatch(paramList);
    }

    @Override
    public Page<E> queryPageByCriteria(Map<String, Object> paramMap, Pageable pageable) {
        Criteria criteria = this.dao.createCriteria(paramMap);
        return dao.queryByCriteria(criteria, pageable);
    }
}