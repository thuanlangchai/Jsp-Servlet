package com.laptrinhjavaweb.service.impl;

import java.util.List;
import javax.inject.Inject;
import com.laptrinhjavaweb.dao.INewsDao;
import com.laptrinhjavaweb.model.NewsModel;
import com.laptrinhjavaweb.service.INewsService;

public class NewsService implements INewsService {

	@Inject
	private INewsDao newsDao;

	@Override
	public List<NewsModel> findByCategoryId(Long categoryId) {		
		return newsDao.findByCategoryId(categoryId);
	}

	@Override
	public NewsModel save(NewsModel newsModel) {
		Long newId = newsDao.save(newsModel);
		System.out.println(newId);
		return null;
	}
	
	

}
