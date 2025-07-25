package com.minhthuan.project.book.service;

import com.minhthuan.project.book.IDAO.CategoryIDAO;
import com.minhthuan.project.book.IService.CategoryIService;
import com.minhthuan.project.book.model.CategoryModel;
import jakarta.inject.Inject;
import java.util.List;

public class CategoryService implements CategoryIService{

    @Inject
    private CategoryIDAO cateDAO;
    
    @Override
    public List<CategoryModel> findAllCategory() {
        return cateDAO.findAllCategory();
    }

    @Override
    public Long addCategory(CategoryModel category) {
        return cateDAO.addCategory(category);
    }

    @Override
    public void editCategory(CategoryModel category) {
         cateDAO.editCategory(category);
    }

    @Override
    public void deleteCategory(Long id) {
        cateDAO.deleteCategory(id);
    }

    @Override
    public List<CategoryModel> findByPage(int Page) {
        return cateDAO.findByPage(Page);
    }
    
}
