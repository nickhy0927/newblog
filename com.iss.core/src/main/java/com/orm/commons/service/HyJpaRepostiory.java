package com.orm.commons.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.Disjunction;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HyJpaRepostiory<T, ID extends Serializable> extends JpaRepository<T, ID> {

	List<T> queryByMap(Map<String, Object> paramMap);

	List<T> queryByCriteria(Criteria paramCriteria);

	Page<T> queryPageByMap(Map<String, Object> paramMap, Pageable paramPageable);

	Criteria createCriteria(Map<String, Object> paramMap);

	T saveEntity(T paramT);
	
	List<T> saveBatch(Iterable<T> iterables);

	List<T> queryByMap(Map<String, Object> paramMap,Sort sort);

	Page<T> queryPageByCriteria(Criteria paramCriteria, Pageable paramPageable);

	List<T> queryByCriteria(Criteria paramCriteria, int paramInt);

	List<T> queryByCriteria(Criteria paramCriteria, Sort paramSort);

	Page<T> queryByCriteria(Criteria paramCriteria, Pageable pageable);

	Page<T> queryByPage(Pageable paramPageable);

	Disjunction createdDisjunction(Map<String, Object> paramMap);

	int nativeSqlUpdate(String paramString, Object... paramVarArgs);

	int nativeSqlUpdate(String paramString, Map<String, ?> paramMap);

	void insertInBatch(List<T> paramList);

	List<T> findByEntityList(Map<String, Object> paramMap);



}
