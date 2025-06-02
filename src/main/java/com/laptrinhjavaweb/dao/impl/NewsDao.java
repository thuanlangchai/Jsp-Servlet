package com.laptrinhjavaweb.dao.impl;

import java.util.List;
import com.laptrinhjavaweb.dao.INewsDao;
import com.laptrinhjavaweb.mapper.NewMapper;
import com.laptrinhjavaweb.model.NewsModel;

public class NewsDao extends AbstractDAO<NewsModel> implements INewsDao {

	@Override
	public List<NewsModel> findByCategoryId(Long categoryId) {
		String sql = "SELECT * FROM news WHERE categoryid = ?;";
		return query(sql, new NewMapper(), categoryId);
	}

	@Override
	public Long save(NewsModel newsModel) {
		String sql = "INSERT INTO news(title, content, categoryid) VALUES(?, ?, ?)";		
		return insert(sql, newsModel.getTitle(), newsModel.getContent(), newsModel.getCategoryid());
	}

}
