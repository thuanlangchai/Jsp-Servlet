package com.minhthuan.project.book.DAO;

import com.minhthuan.project.book.IDAO.CategoryIDAO;
import com.minhthuan.project.book.mapping.CategoryMapper;
import com.minhthuan.project.book.model.CategoryModel;
import java.util.List;


public class CategoryDAO extends AbstractDAO<CategoryModel> implements CategoryIDAO{

    @Override
    public List<CategoryModel> findAllCategory() {
        String sql = "select * from category_book";
        return find(sql, new CategoryMapper());
    }

    @Override
    public Long addCategory(CategoryModel book) {
        String sql = "insert into category_book(name, content) values(?, ?)";
        return insert(sql, book.getName(), book.getContent());
    }

    @Override
    public void editCategory(CategoryModel book) {
        String sql = "update category_book set name=?, content=? where id=?";
        update(sql, book.getName(), book.getContent(), book.getId());
    }

    @Override
    public void deleteCategory(Long id) {
        String sql = "delete from category_book where id=?";
        update(sql, id);
    }

    @Override
    public List<CategoryModel> findByPage(int page) {
        int quantity = ((page - 1) * 4);
        String sql = "select * from category_book limit ?, 4";        
        return find(sql, new CategoryMapper(), quantity);
           
    }
    
}
