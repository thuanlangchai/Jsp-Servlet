package com.minhthuan.project.book.controller.signup;

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

@WebServlet(name = "SignUp", urlPatterns = {"/signup"})
public class SignUp extends HttpServlet {

    @Inject
    private AccountIService accService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/register/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");
        String error1 = null;
        String error2 = null;
        String success = null;
        if (password == null ? confirmPassword != null : !password.equals(confirmPassword)) {
            error1 = "confirm incorrect";
            request.setAttribute("error1", error1);
            request.getRequestDispatcher("/views/register/Register.jsp").forward(request, response);
        }
        AccountModel acc = new AccountModel(firstName, lastName, email, password);
        List<AccountModel> arrAccount = accService.findAllAcount();

        for (AccountModel accountModel : arrAccount) {
            if (accountModel.getEmail().equalsIgnoreCase(email)) {
                error2 = "email đã tồn tại";
                break;
            }
        }

        if (error2 == null) {
            success = "Đăng ký thành công";
            accService.insertAccount(acc);
        }
        request.setAttribute("error2", error2);
        request.setAttribute("success", success);
        request.getRequestDispatcher("/views/register/Register.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
