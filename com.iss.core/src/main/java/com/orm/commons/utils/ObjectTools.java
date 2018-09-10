package com.orm.commons.utils;

import java.util.List;

/**
 * 中间转化实体
 *
 * @描述：
 * @author HUANGYUAN
 *
 * @param <E>
 */
public class ObjectTools<E> {
	private List<E> entities;

	private Pager pager;

	public List<E> getEntities() {
		return entities;
	}

	public Pager getPager() {
		return pager;
	}

	public void setEntities(List<E> entities) {
		this.entities = entities;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

}
