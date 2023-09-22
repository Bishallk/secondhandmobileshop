package mbmc.secondhandmobileshop;

import mbmc.secondhandmobileshop.database.DatabaseConnection;
import mbmc.secondhandmobileshop.models.Brand;
import mbmc.secondhandmobileshop.models.Product;
import mbmc.secondhandmobileshop.service.BrandService;
import mbmc.secondhandmobileshop.service.ProductService;
import mbmc.secondhandmobileshop.service.Service;
import mbmc.secondhandmobileshop.service.UserService;
import mbmc.secondhandmobileshop.utilities.QueryUtils;

import java.util.Arrays;
import java.util.List;

public class Tester {
    public static void main(String[] args) {
        try{
            UserService.validUser("test@gmail.com","test");


               }catch (Exception ex){
            System.out.println("Tester : "+ex);
        }

    }
}
