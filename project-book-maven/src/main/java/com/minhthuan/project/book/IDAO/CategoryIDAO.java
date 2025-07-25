package com.minhthuan.project.book.IDAO;

import com.minhthuan.project.book.model.CategoryModel;
import java.util.List;


public interface CategoryIDAO {
    List<CategoryModel> findAllCategory();
    List<CategoryModel> findByPage(int page);
    Long addCategory(CategoryModel book);
    void editCategory(CategoryModel book);
    void deleteCategory(Long id);
}
