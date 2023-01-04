package com.google.service;

import java.util.List;

import com.google.domain.Criteria;
import com.google.domain.NewsVO;

public interface NewsService {
	
	public List<NewsVO> getList(Criteria cri);
	
	public int getListTotal();
	
	public void register(NewsVO vo);//insert
	
	public NewsVO get(long bno);//read
	
	public void remove(long bno); //delete
	
	public void modify(NewsVO vo); //update
}
