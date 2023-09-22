package mbmc.secondhandmobileshop.service;

import mbmc.secondhandmobileshop.database.DatabaseConnection;
import mbmc.secondhandmobileshop.models.Product;
import mbmc.secondhandmobileshop.utilities.QueryUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static mbmc.secondhandmobileshop.utilities.QueryUtils.*;

public class ProductService {
    //---------------------------insert product ----------------------------------//
    public static String insertProduct(Product product) {
        String msg;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(getInsertQuery("product"))
        ) {
            statement.setString(1, product.getName());
            statement.setString(2, product.getBrand());
            statement.setBytes(3, product.getAllImageBytes());
            statement.setInt(4, product.getOriginalPrice());
            statement.setInt(5, product.getDiscountedPrice());
            statement.setInt(6, product.getQuantity());
            statement.setString(7, product.getMemory());
            statement.setString(8, product.getColor());
            statement.setString(9, product.getDesc());
            //executeUpdate() returns how many rows are affected
            int rows = statement.executeUpdate();

            if (rows > 0) {
                msg = "New Product <strong>" + product.getName() + "</strong> Registration Success!";
            } else {
                msg = "New Product <strong>" + product.getName() + "</strong> Registration Failed!";
            }
        } catch (Exception e) {
            msg = "New Product <strong>" + product.getName() + "</strong> Registration Failed!";
            System.out.println("Product Insert :" + e);
        }
        //return msg
        return msg;
    }

    public static String updateProduct(Product product) {
        String msg;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(getUpdateQuery("products", product.getId()))) {
            statement.setString(1, product.getName());
            statement.setString(2, product.getBrand());
            statement.setBytes(3, product.getAllImageBytes());
            statement.setInt(4, product.getOriginalPrice());
            statement.setInt(5, product.getDiscountedPrice());
            statement.setInt(6, product.getQuantity());
            statement.setString(7, product.getMemory());
            statement.setString(8, product.getColor());
            statement.setString(9, product.getDesc());
            int rows = statement.executeUpdate();
            if (rows > 0) {
                msg = "Product <strong>" + product.getName() + "</strong> Updated Successfully!";
            } else {
                msg = "Product <strong>" + product.getName() + "</strong> Update Operation Failed!";
            }
        } catch (Exception ex) {
            msg = "Product <strong>" + product.getName() + "</strong> Update Operation Failed!";
            System.out.println("update product" + ex);
        }
        return msg;
    }

    public static String deleteProduct(int id) {
        String msg;
        Product product = ProductService.getProductById2(id);
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement()) {
            int rows = statement.executeUpdate(getDeleteQuery("products", id));
            if (rows > 0) {
                msg = "Product <strong>" + product.getName() + "</strong> Deleted Successfully!";
            } else {
                msg = "Product <strong>" + product.getName() + "</strong> Delete Operation Failed!";
            }
        } catch (Exception ex) {
            msg = "Product <strong>" + product.getName() + "</strong> Delete Operation Failed!";
            System.out.println("Delete product" + ex);
        }
        return msg;
    }

    //---------------------------get product list ----------------------------------//
    public static List<Product> getProductList() throws SQLException, ClassNotFoundException {
        List<Product> productList = new ArrayList<>();
        Product product;
        //all product with imageBytesList
        try (Connection connection = DatabaseConnection.getConnection()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(getSelectAllQuery("products"));
            while (resultSet.next()) {
                product = new Product(resultSet.getInt("p_id"),
                        resultSet.getString("p_name"),
                        resultSet.getString("p_brand"),
                        ImageService.separateImageBytes(resultSet.getBytes("p_image")),
                        resultSet.getInt("p_original_price"),
                        resultSet.getInt("p_discounted_price"),
                        resultSet.getInt("p_quantity"),
                        resultSet.getString("p_memory"),
                        resultSet.getString("p_color"),
                        resultSet.getString("p_description")
                );
                productList.add(product);
            }
        }
        return productList;
    }

    public static List<Product> getProductListByBrand(String brandName) throws SQLException, ClassNotFoundException {
        List<Product> productList = new ArrayList<>();
        Product product;
        //all product with imageBytesList
        try (Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement statement = connection.prepareStatement(QueryUtils.getSelectByBrandQuery());
            statement.setString(1,brandName);
           ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                product = new Product(resultSet.getInt("p_id"),
                        resultSet.getString("p_name"),
                        resultSet.getString("p_brand"),
                        ImageService.separateImageBytes(resultSet.getBytes("p_image")),
                        resultSet.getInt("p_original_price"),
                        resultSet.getInt("p_discounted_price"),
                        resultSet.getInt("p_quantity"),
                        resultSet.getString("p_memory"),
                        resultSet.getString("p_color"),
                        resultSet.getString("p_description")
                );
                productList.add(product);
            }
        }
        return productList;
    }

    public static Product getProductById(int id) throws SQLException {
        Product product = null;
        //gives imageBytesList
        try (Connection connection = DatabaseConnection.getConnection()) {

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(getSelectByIdQuery("products", id));
            while (resultSet.next()) {
                product = new Product(resultSet.getInt("p_id"),
                        resultSet.getString("p_name"),
                        resultSet.getString("p_brand"),
                        ImageService.separateImageBytes(resultSet.getBytes("p_image")),
                        resultSet.getInt("p_original_price"),
                        resultSet.getInt("p_discounted_price"),
                        resultSet.getInt("p_quantity"),
                        resultSet.getString("p_memory"),
                        resultSet.getString("p_color"),
                        resultSet.getString("p_description")
                );
            }
        } catch (Exception ex) {
            System.out.println("Get By id:" + ex);
        }
        return product;
    }

    public static Product getProductById2(int id) {
        // gives image bytes
        Product product = null;
        try (Connection connection = DatabaseConnection.getConnection()) {

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(getSelectByIdQuery("products", id));
            while (resultSet.next()) {
                product = new Product(resultSet.getInt("p_id"),
                        resultSet.getString("p_name"),
                        resultSet.getString("p_brand"),
                        resultSet.getBytes("p_image"),
                        resultSet.getInt("p_original_price"),
                        resultSet.getInt("p_discounted_price"),
                        resultSet.getInt("p_quantity"),
                        resultSet.getString("p_memory"),
                        resultSet.getString("p_color"),
                        resultSet.getString("p_description")
                );
            }
        } catch (Exception ex) {
            System.out.println("get by id:" + ex);
        }
        return product;
    }

}
