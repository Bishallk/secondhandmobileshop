package mbmc.secondhandmobileshop.utilities;

//-------------------This Class Provides Queries for different table-----------------------------//
public class QueryUtils {
    //-------------------------Insert Query-------------------------------------//
    public static String getInsertQuery(String model) {
        return switch (model) {
            case "brand" -> "INSERT INTO brands(brand_name,brand_desc) VALUES(?,?)";
            case "product" ->
                    "INSERT INTO products(p_name,p_brand,p_image,p_original_price,p_discounted_price,p_quantity,p_memory,P_color,P_description) VALUES(?,?,?,?,?,?,?,?,?)";
            case "user" -> "INSERT INTO users(u_name,u_email,u_contact,u_address,u_password) VALUES(?,?,?,?,?)";
            case "order" -> "INSERT INTO orders() VALUES()";
            default -> throw new IllegalStateException("Unexpected value: " + model);
        };
    }

    //-------------------------Update Query--------------------------------------//
    public static String getUpdateQuery(String table, int id) {
        return switch (table) {
            case "brands" -> "UPDATE brands SET brand_name=?,brand_desc=? WHERE brand_id = " + id;
            case "products" ->
                    "UPDATE products SET p_name=?,p_brand=?,p_image=?,p_original_price=?,p_discounted_price=?,p_quantity=?,p_memory=?,P_color=?,P_description=? WHERE p_id = " + id;
            case "users" -> "UPDATE users SET  WHERE id = " + id;
            case "orders" -> "UPDATE orders SET  WHERE id = " + id;
            default -> throw new IllegalStateException("Unexpected value: " + table);
        };
    }

    //-------------------------Select All  Query---------------------------------//
    public static String getSelectAllQuery(String table) {
        return "SELECT * FROM " + table;
    }

    //-------------------------Delete Query--------------------------------------//
    public static String getDeleteQuery(String table, int id) {
        return switch (table) {
            case "brands" -> "DELETE From brands WHERE id =" + id;
            case "products" -> "DELETE From products WHERE p_id = " + id;
            case "users" -> "DELETE From users WHERE id = " + id;
            case "orders" -> "DELETE From orders WHERE id = " + id;
            default -> throw new IllegalStateException("Unexpected value: " + table);
        };
    }

    //------------------------- Select By Id Query-------------------------------//
    public static String getSelectByIdQuery(String table, int id) {
        return "SELECT * FROM " + table + " WHERE p_id= " + id;
    }

    public static String getSelectByBrandQuery() {
        return "SELECT * FROM products WHERE p_brand= ?";
    }

    public static String getRowCountQuery() {
        return "SELECT COUNT(*) FROM ?;";
    }

}
