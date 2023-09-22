package mbmc.secondhandmobileshop.service;

import mbmc.secondhandmobileshop.database.DatabaseConnection;
import mbmc.secondhandmobileshop.models.Brand;
import mbmc.secondhandmobileshop.utilities.QueryUtils;

import java.sql.*;
import java.util.ArrayList;

public class BrandService {
    //---------------------------insert brand ----------------------------------//
    public static String insertBrand(Brand brand) throws SQLException, ClassNotFoundException {
        String msg;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(QueryUtils.getInsertQuery("brand"));
        ) {
            statement.setString(1, brand.getName());
            statement.setString(2, brand.getDesc());
            //executeUpdate() returns how many rows are affected
            int rows = statement.executeUpdate();

            if (rows > 0) {
                msg = "New Brand <strong>" + brand.getName() + "</strong> Registration Success!";
            } else {
                msg = "New Brand <strong>" + brand.getName() + "</strong> Registration Failed!";
            }
        }
        //return msg
        return msg;
    }

    //---------------------------update brand ----------------------------------//
    public static boolean updateBrand(Brand brand) throws SQLException {
        boolean success;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(QueryUtils.getUpdateQuery("brands", brand.getId()))) {
            statement.setString(1, brand.getName());
            statement.setString(2, brand.getDesc());
            int rows = statement.executeUpdate();
            //success stores either ture or false
            success = rows > 0;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        //return true if update success and false if update failed
        return success;
    }

    //---------------------------get brand list ----------------------------------//
    public static ArrayList<Brand> getBrandList() throws SQLException, ClassNotFoundException {
        ArrayList<Brand> brandList = new ArrayList<>();
        Brand brand;
        try (Connection connection = DatabaseConnection.getConnection()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(QueryUtils.getSelectAllQuery("brands"));
            while (resultSet.next()) {
                brand = new Brand(resultSet.getInt("brand_id"),
                        resultSet.getString("brand_name"),
                        resultSet.getString("brand_desc"));
                brandList.add(brand);
            }
        }
        return brandList;
    }

    //---------------------------delete brand  ----------------------------------//
    public static String deleteBrand(int id) throws SQLException, ClassNotFoundException {
        String msg;
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();) {
            int rows = statement.executeUpdate(QueryUtils.getDeleteQuery("brands", id));
            ResultSet resultSet = statement.executeQuery(QueryUtils.getSelectByIdQuery("brands", id));
            String bName = resultSet.getString("brand_name");
            if (rows > 0) {
                msg = "Brand <strong>" + bName + "</strong>  Deletion Success!";
            } else {
                msg = "Brand <strong>" + bName + "</strong>  Deletion Failed!";
            }
        }
        return msg;
    }

}
