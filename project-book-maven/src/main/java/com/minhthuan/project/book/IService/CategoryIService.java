package com.minhthuan.project.book.IService;

import com.minhthuan.project.book.model.CategoryModel;
import java.util.List;


public interface CategoryIService {
    List<CategoryModel> findAllCategory();
    List<CategoryModel> findByPage(int Page);
    Long addCategory(CategoryModel category);
    void editCategory(CategoryModel category);
    void deleteCategory(Long id);
}
