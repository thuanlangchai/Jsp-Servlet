package com.minhthuan.project.book.CRUD;

import com.minhthuan.project.book.IService.CategoryIService;
import com.minhthuan.project.book.model.CategoryModel;
import jakarta.inject.Inject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

@WebServlet(name = "UpdateCategory", urlPatterns = {"/updatecategory"})
public class UpdateCategory extends HttpServlet {
    @Inject
    private CategoryIService cateService;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        request.setAttribute("firstname", firstName);
        request.setAttribute("lastname", lastName);
        Long id = Long.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String content = request.getParameter("content");
        CategoryModel category = new CategoryModel(id, name, content);              
        try {
            cateService.editCategory(category);
        } catch (Exception e) {
            System.out.println(e);
        }
        String url = "category?firstname=" + URLEncoder.encode(firstName, "UTF-8")
                + "&lastname=" + URLEncoder.encode(lastName, "UTF-8");
        response.sendRedirect(url);
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
