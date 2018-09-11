package com.iss.util;

import org.apache.commons.lang3.StringUtils;

public class PageSupport {

    private int pageSize = 10; // 分页大小
    private int totalRecord;// 总记录数
    private int totalPage;// 总页数
    private int currentPage;// 当前页
    private String order = "createTime";
    private String sort = Sortable.DESC.toString().toLowerCase();

    public PageSupport() {

    }

    public PageSupport(String currentPage) {
        int curr = 1;
        if (StringUtils.isNotEmpty(currentPage)) {
            try {
                curr = Integer.parseInt(currentPage);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        this.currentPage = curr > 0 ? curr : 1;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }


    public PageSupport(String currentPage, int pageSize) {
        int curr = 1;
        if (StringUtils.isNotEmpty(currentPage)) {
            try {
                curr = Integer.parseInt(currentPage);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        this.currentPage = curr > 0 ? curr : 1;
        this.pageSize = pageSize > 0 ? pageSize : this.pageSize;
    }

    public PageSupport(String currentPage, String pageSize) {
        int curr = 1;
        if (StringUtils.isNotEmpty(currentPage)) {
            try {
                curr = Integer.parseInt(currentPage);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        if (StringUtils.isNotEmpty(pageSize)) {
            try {
                int s = Integer.parseInt(pageSize);
                this.pageSize = s > 0 ? s : this.pageSize;
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        } else
            this.pageSize = 5;
        this.pageSize = curr > 0 ? curr : 1;

    }

    public void setTotalRecord(int totalRecord) {
        if (totalRecord > 0) {
            this.totalPage = (totalRecord % this.pageSize > 0 ? (totalRecord / this.pageSize + 1)
                    : (totalRecord / this.pageSize));
        }
        this.totalRecord = totalRecord;
    }

    public int getStartRow() {
        return (this.currentPage - 1 > 0 ? (this.currentPage - 1) : 0) * this.pageSize;
    }

    public int getEntRow() {
        return (this.currentPage > 0 ? this.currentPage - 1 : 0) * this.pageSize;
    }

    public int getpageSize() {
        return pageSize;
    }

    public void setpageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public String getOrder() {
        return order;
    }

    public String getSort() {
        return sort;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public enum Sortable {
        DESC, ASC
    }
}
