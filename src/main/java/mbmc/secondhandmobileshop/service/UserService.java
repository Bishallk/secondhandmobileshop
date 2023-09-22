package mbmc.secondhandmobileshop.service;

import jakarta.servlet.http.HttpSession;
import mbmc.secondhandmobileshop.database.DatabaseConnection;
import mbmc.secondhandmobileshop.models.Product;
import mbmc.secondhandmobileshop.models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static mbmc.secondhandmobileshop.utilities.QueryUtils.getInsertQuery;

public class UserService {
    public static String insertUser(User user) {
        String msg;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(getInsertQuery("user"))
        ) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setLong(3, user.getContact());
            statement.setString(4, user.getAddress());
            statement.setString(5, user.getPassword());
            //executeUpdate() returns how many rows are affected
            int rows = statement.executeUpdate();

            if (rows > 0) {
                msg = "<strong>" + user.getName() + "</strong>, Your Registration is Successful!";
            } else {
                msg = "<strong>" + user.getName() + "</strong>, Your Registration is Failed!";
            }
        } catch (Exception e) {
            msg = "<strong>" + user.getName() + "</strong>, Your Registration is Failed!";
            System.out.println("Product Insert :" + e);
        }
        //return msg
        return msg;
    }
    public static void validUser(String email,String password){

    }


}
