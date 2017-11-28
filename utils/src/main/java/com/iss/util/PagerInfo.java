package com.iss.util;

import java.util.List;
import java.util.Map;

/**
 * 分页对象
 * 
 * @author yuanhuangd
 *
 * @param <T>
 */
public class PagerInfo<T> {

	private int size = 10; // 分页大小
	private int totalRecord;// 总记录数
	private int totalPage;// 总页数
	private int currentPage;// 当前页

	private List<T> content;

	private List<Map<String, Object>> maps;

	public PagerInfo(PageSupport support, List<T> content) {
		this.size = support.getPageSize();
		this.currentPage = support.getCurrentPage();
		this.totalRecord = support.getTotalRecord();
		this.totalPage = support.getTotalPage();
		this.content = content;
	}

	public PagerInfo(List<Map<String, Object>> maps) {
		this.maps = maps;
	}

	public int getSize() {
		return size;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<T> getContent() {
		return content;
	}

	public void setContent(List<T> content) {
		this.content = content;
	}

	public List<Map<String, Object>> getMaps() {
		return maps;
	}

	public void setMaps(List<Map<String, Object>> maps) {
		this.maps = maps;
	}

	@Override
	public String toString() {
		return "Pager [size=" + size + ", totalRecord=" + totalRecord + ", totalPage=" + totalPage + ", currentPage="
				+ currentPage + ", content=" + content + "]";
	}
}
