package com.minhthuan.project.book.CRUD;

import com.minhthuan.project.book.IService.BookIService;
import com.minhthuan.project.book.IService.CategoryIService;
import com.minhthuan.project.book.model.BookModel;
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

@WebServlet(name = "AddBook", urlPatterns = {"/addbook"})
public class AddBook extends HttpServlet {

    @Inject
    private BookIService bookService;

    @Inject
    private CategoryIService cateService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BookModel> listBook = bookService.findAllBook();
        List<CategoryModel> listCate = cateService.findAllCategory();
        request.setAttribute("ListBook", listBook);
        request.setAttribute("ListCate", listCate);
        request.getRequestDispatcher("/views/book/book.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        request.setAttribute("firstname", firstName);
        request.setAttribute("lastname", lastName);
        List<BookModel> listBook = bookService.findAllBook();
        List<CategoryModel> listCate = cateService.findAllCategory();
        request.setAttribute("ListBook", listBook);
        request.setAttribute("ListCate", listCate);
        String name = request.getParameter("name");
        Float price = Float.valueOf(request.getParameter("price"));
        String author = request.getParameter("author");
        Long cateID = Long.valueOf(request.getParameter("cateID"));
        String image = request.getParameter("image");
        BookModel book = new BookModel(cateID, name, author, image, price);
        try {
            bookService.addBook(book);
        } catch (Exception e) {
            System.out.println(e);
        }
        String redirectURL = "book?firstname=" + URLEncoder.encode(firstName, "UTF-8")
                + "&lastname=" + URLEncoder.encode(lastName, "UTF-8");
        response.sendRedirect(redirectURL);                

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
