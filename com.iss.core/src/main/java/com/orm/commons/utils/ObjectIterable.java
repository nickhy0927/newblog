package com.orm.commons.utils;

import java.util.Iterator;
import java.util.List;

public class ObjectIterable<T> implements Iterable<T> {
	// 存储所有学生类的数组
	private List<T> ts;

	public ObjectIterable(List<T> ts) {
		this.ts = ts;
	}

	// 实现Iterator接口的私有内部类，外界无法直接访问
	private class BaseIterator implements Iterator<T> {
		// 当前迭代元素的下标
		private int index = 0;

		// 判断是否还有下一个元素，如果迭代到最后一个元素就返回false
		public boolean hasNext() {
			return index != ts.size();
		}

		@Override
		public T next() {
			return ts.get(index++);
		}

		// 这里不支持，抛出不支持操作异常
		public void remove() {
			throw new UnsupportedOperationException();
		}
	}

	@Override
	public Iterator<T> iterator() {
		return new BaseIterator();
	}
}
