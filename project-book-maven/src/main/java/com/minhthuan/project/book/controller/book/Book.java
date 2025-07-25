package com.minhthuan.project.book.controller.book;

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

@WebServlet(name = "Book", urlPatterns = {"/book"})
public class Book extends HttpServlet {

    @Inject
    private BookIService bookService;

    @Inject
    private CategoryIService cateService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String page = request.getParameter("page");
        int currentPage = (page == null) ? 1 : Integer.parseInt(page);
        List<BookModel> listBook = bookService.findAllBook();
        List<CategoryModel> listCate = cateService.findAllCategory();
        
        int numOfPage = listBook.size() / 4;
        
        if ((numOfPage * 4) != listBook.size())
            numOfPage++;
        
        listBook = bookService.findByPage(0L, currentPage);
        
        request.setAttribute("numOfPage", numOfPage);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("firstname", firstName);
        request.setAttribute("lastname", lastName);
        request.setAttribute("ListBook", listBook);
        request.setAttribute("ListCate", listCate);
        request.getRequestDispatcher("/views/book/book.jsp").forward(request, response);
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
