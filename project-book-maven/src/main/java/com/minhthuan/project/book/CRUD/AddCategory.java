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
import java.util.List;

@WebServlet(name = "AddCategory", urlPatterns = {"/addcategory"})
public class AddCategory extends HttpServlet {
    @Inject
    private CategoryIService cateService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        request.setAttribute("firstname", firstName);
        request.setAttribute("lastname", lastName);
        List<CategoryModel> listCate = cateService.findAllCategory();
        request.setAttribute("ListCate", listCate);
        String name = request.getParameter("name");
        String content = request.getParameter("content");
        CategoryModel category = new CategoryModel(name, content);
        try {
            cateService.addCategory(category);
        } catch (Exception e) {
            System.out.println(e);
        }
        String redirectURL = "category?firstname=" + URLEncoder.encode(firstName, "UTF-8")
                + "&lastname=" + URLEncoder.encode(lastName, "UTF-8");
        response.sendRedirect(redirectURL);  
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    public String getServletInfo() {
        return "Short description";
    }

}
