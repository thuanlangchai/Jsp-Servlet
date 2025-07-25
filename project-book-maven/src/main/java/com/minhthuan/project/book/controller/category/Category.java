package com.minhthuan.project.book.controller.category;

import com.minhthuan.project.book.IService.CategoryIService;
import com.minhthuan.project.book.model.CategoryModel;
import jakarta.inject.Inject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "Category", urlPatterns = {"/category"})
public class Category extends HttpServlet {

    @Inject
    private CategoryIService cateService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String page = request.getParameter("page");
        int currentPage = (page == null) ? 1 : Integer.parseInt(page);
        List<CategoryModel> listCategory = cateService.findAllCategory();
        
        int numOfPage = listCategory.size() / 4;
        if (numOfPage * 4 != listCategory.size())
            numOfPage++;
        
        listCategory = cateService.findByPage(currentPage);
        
        request.setAttribute("listCategory", listCategory);                        
        request.setAttribute("firstname", firstName);
        request.setAttribute("lastname", lastName);
        request.setAttribute("numOfPage", numOfPage);
        request.setAttribute("currentPage", currentPage);
        request.getRequestDispatcher("/views/category/category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
