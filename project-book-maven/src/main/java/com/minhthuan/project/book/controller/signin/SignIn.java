package com.minhthuan.project.book.controller.signin;

import com.minhthuan.project.book.IService.AccountIService;
import com.minhthuan.project.book.model.AccountModel;
import jakarta.inject.Inject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "SignIn", urlPatterns = {"/signin"})
public class SignIn extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignIn</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignIn at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Inject
    private AccountIService accountSer;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/register/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String error = null;
        String firstName = null;
        String lastName = null;
        int flag = 0;
        List<AccountModel> arrAcc = accountSer.findAllAcount();
        for (AccountModel accountModel : arrAcc) {
            if (accountModel.getEmail().equalsIgnoreCase(email)
                    && accountModel.getPassword().equalsIgnoreCase(password)) {
                firstName = accountModel.getFirstName();
                lastName = accountModel.getLastName();
                request.setAttribute("firstname", firstName);
                request.setAttribute("lastname", lastName);
                flag = 1;
                break;
            }
        }

        if (flag == 1) {
            request.getRequestDispatcher("/views/myapp/homepage.jsp").forward(request, response);
            //response.sendRedirect("homepage?firstname=" + firstName + "lastname=" + lastName);
        } else {
            error = "Sai Tài Khoản Hoặc Mật Khẩu....";
            request.setAttribute("error", error);
            request.getRequestDispatcher("/views/register/Register.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
