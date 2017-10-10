package com.orm.commons.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.Disjunction;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.Pager;

public interface BaseService<E, ID extends Serializable> {

	void delete(ID id) throws ServiceException;

	void delete(Iterable<E> paramIterable) throws ServiceException;

	void deleteAll() throws ServiceException;

	void deleteBatch(String[] ids) throws ServiceException;

	List<E> findAll() throws ServiceException;

	E get(ID id) throws ServiceException;

	List<E> queryByMap(Map<String, Object> paramMap) throws ServiceException;

	List<E> queryByMap(Map<String, Object> paramMap, Sort sort) throws ServiceException;

	Page<E> queryPageByMap(Map<String, Object> paramMap, Pageable paramPageable) throws ServiceException;

	ObjectTools<E> queryPageByMap(Map<String, Object> map, String currentPage, Sort sort) throws ServiceException;
	
	ObjectTools<E> queryPageByMap(Map<String, Object> map, String currentPage, Sort sort,Pager pager) throws ServiceException;

	E save(E entity) throws ServiceException;

	Page<E> queryPageByCriteria(Criteria paramCriteria, Pageable paramPageable);

	List<E> queryByCriteria(Criteria paramCriteria, int paramInt);

	List<E> queryByCriteria(Criteria paramCriteria, Sort paramSort);

	Page<E> queryByPage(Pageable paramPageable);

	Disjunction createdDisjunction(Map<String, Object> paramMap);

	int nativeSqlUpdate(String paramString, Object... paramVarArgs);

	int nativeSqlUpdate(String paramString, Map<String, ?> paramMap);

	void insertInBatch(List<E> paramList);

	List<E> findByEntityList(Map<String, Object> paramMap);

    Page<E> queryPageByCriteria(Map<String, Object> paramMap, Pageable pageable);

}