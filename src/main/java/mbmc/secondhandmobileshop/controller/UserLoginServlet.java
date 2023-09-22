package mbmc.secondhandmobileshop.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mbmc.secondhandmobileshop.database.DatabaseConnection;

import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
@WebServlet(name = "UserLoginServlet",urlPatterns = "/userLogin")
public class UserLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userEmail = req.getParameter("userEmail");
        String userPassword = req.getParameter("userPass");
        RequestDispatcher dispatcher=null;
        PrintWriter out=resp.getWriter();
        HttpSession session = req.getSession();
        String sql = "select * from users where u_email = ? and u_password = ?;";
        try (Connection connection= DatabaseConnection.getConnection();
             PreparedStatement statement=connection.prepareStatement(sql)){
            statement.setString(1,userEmail);
            statement.setString(2,userPassword);
            ResultSet rs=statement.executeQuery();
            while (rs.next()) {
                String uEmail=rs.getString("u_email");
                String userPass=rs.getString("u_password");
                String userName=rs.getString("u_name");
                if((uEmail.equals(userEmail))&&(userPass.equals(userPassword))){
                    session.setAttribute("name",userName);
                    dispatcher = req.getRequestDispatcher("index.jsp");
                    dispatcher.forward(req,resp);
                }else {
                    dispatcher = req.getRequestDispatcher("users/userLogin.jsp");
                    dispatcher.include(req,resp);
                }
//                if(userEmail.equals(uEmail)&&userPass.equals(userPassword)){
//                    req.getRequestDispatcher("/index.jsp");
//                }else {
//                    HttpSession s = req.getSession();
//                    String m="Login Failed!!";
//                    session.setAttribute("message", m);
//                    req.getRequestDispatcher("/users/userLogin.jsp");
//                }

            }

        }catch (Exception ex){
            System.out.println("userService:"+ex);
        }
    }
}
