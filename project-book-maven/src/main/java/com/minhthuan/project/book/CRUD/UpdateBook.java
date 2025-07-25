package com.minhthuan.project.book.CRUD;

import com.minhthuan.project.book.IService.BookIService;
import com.minhthuan.project.book.model.BookModel;
import jakarta.inject.Inject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

@WebServlet(name = "UpdateBook", urlPatterns = {"/updatebook"})
public class UpdateBook extends HttpServlet {

    @Inject
    private BookIService bookService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        request.setAttribute("firstname", firstName);
        request.setAttribute("lastname", lastName);
        Long id = Long.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        Float price = Float.valueOf(request.getParameter("price"));
        String author = request.getParameter("author");
        Long cateID = Long.valueOf(request.getParameter("cateID"));
        String image = request.getParameter("image");
        BookModel book = new BookModel(id, cateID, name, author, image, price);
        try {
            bookService.editBook(book);
        } catch (Exception e) {
            System.out.println(e);
        }
        String url = "book?firstname=" + URLEncoder.encode(firstName, "UTF-8")
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
