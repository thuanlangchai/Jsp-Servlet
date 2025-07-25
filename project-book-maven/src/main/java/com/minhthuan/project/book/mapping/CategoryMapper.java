package com.minhthuan.project.book.mapping;

import com.minhthuan.project.book.model.CategoryModel;
import java.sql.ResultSet;
import java.sql.SQLException;


public class CategoryMapper implements ObjectMapper<CategoryModel>{

    @Override
    public CategoryModel mapping(ResultSet rs) {
        CategoryModel category = new CategoryModel();
        try {
            category.setId(rs.getLong("id"));
            category.setName(rs.getString("name"));
            category.setContent(rs.getString("content"));
            return category;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
    
}
