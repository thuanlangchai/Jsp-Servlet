package com.minhthuan.project.book.CRUD;

import com.minhthuan.project.book.IService.BookIService;
import jakarta.inject.Inject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

@WebServlet(name = "DeleteBook", urlPatterns = {"/deletebook"})
public class DeleteBook extends HttpServlet {

    @Inject
    private BookIService bookService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        request.setAttribute("firstname", firstName);
        request.setAttribute("lastname", lastName);
        Long id = Long.valueOf(request.getParameter("id"));
        bookService.deleteBook(id);
        String redirectURL = "book?firstname=" + URLEncoder.encode(firstName, "UTF-8")
                + "&lastname=" + URLEncoder.encode(lastName, "UTF-8");
        response.sendRedirect(redirectURL);
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
