package com.minhthuan.project.book.controller.search;

import com.minhthuan.project.book.IService.BookIService;
import com.minhthuan.project.book.IService.CategoryIService;
import com.minhthuan.project.book.model.BookModel;
import com.minhthuan.project.book.model.CategoryModel;
import jakarta.inject.Inject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "Search", urlPatterns = {"/search"})
public class Search extends HttpServlet {

    @Inject
    private BookIService book;

    @Inject
    private CategoryIService category;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String key = request.getParameter("key");
        String page = request.getParameter("page");        
        int currentPage = (page == null) ? 1 : Integer.parseInt(page);
        response.setContentType("text/html;charset=UTF-8");

        try {
            List<CategoryModel> arrCate = category.findAllCategory();
            List<BookModel> arrBook = null;
            Long id = (key == null) ? 0 : Long.valueOf(key);
            if (id == 0) {
                arrBook = book.findAllBook();               
            } else {
                arrBook = book.findByCateId(id);
            }        
                                   
            int numOfPage = arrBook.size() / 4;
            if ((numOfPage * 4) != arrBook.size())
                numOfPage++;
            
            
            arrBook = book.findByPage(id, currentPage);
                       
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("numOfPage", numOfPage);
            request.setAttribute("firstname", firstName);
            request.setAttribute("lastname", lastName);
            request.setAttribute("id", id);
            request.setAttribute("arrBook", arrBook);
            request.setAttribute("category", arrCate);
            request.getRequestDispatcher("/views/search/search.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println(e);
        }
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
