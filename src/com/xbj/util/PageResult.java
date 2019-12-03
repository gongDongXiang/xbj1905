package com.xbj.util;

import java.util.List;

/**
 * 分页工具类
 * @author 李帅
 *
 */
public class PageResult <E>{

	/** 当前页数 */
	Integer currentPage;
	/** 每页显示的条数 */
	Integer pageSize;
	/** 查询总条数 */
	Integer totalNo;
	/** 查询结果集 */
	List<E> list;
	
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalNo() {
		return totalNo;
	}
	public void setTotalNo(Integer totalNo) {
		this.totalNo = totalNo;
	}
	public List<E> getList() {
		return list;
	}
	public void setList(List<E> list) {
		this.list = list;
	}
	public PageResult(Integer currentPage, Integer pageSize, Integer totalNo,
			List<E> list) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalNo = totalNo;
		this.list = list;
	}
	
	public PageResult() {
	}
	@Override
	public String toString() {
		final int maxLen = 10;
		return "PageResult [currentPage="
				+ currentPage
				+ ", pageSize="
				+ pageSize
				+ ", totalNo="
				+ totalNo
				+ ", list="
				+ (list != null ? list
						.subList(0, Math.min(list.size(), maxLen)) : null)
				+ "]";
	}
	
	
	
	
}
