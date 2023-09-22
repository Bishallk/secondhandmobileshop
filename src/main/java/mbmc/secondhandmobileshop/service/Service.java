package mbmc.secondhandmobileshop.service;

import mbmc.secondhandmobileshop.database.DatabaseConnection;
import mbmc.secondhandmobileshop.utilities.QueryUtils;

import java.sql.*;

import static mbmc.secondhandmobileshop.utilities.QueryUtils.getDeleteQuery;

public class Service {
    public static int rowCount(String table) {
        int rows = 0;
        String query = "select count(*) from " + table;
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            if (resultSet.next()) {
                rows = resultSet.getInt(1); // Get the count from the first column
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("row count: " + e);
        }
        return rows;
    }

}