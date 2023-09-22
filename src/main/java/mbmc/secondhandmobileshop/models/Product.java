package mbmc.secondhandmobileshop.models;

import jakarta.servlet.http.Part;

import java.util.List;

public class Product {
    private int id;
    private int originalPrice;
    private int discountedPrice;
    private int quantity;
    private String name;
    private String brand;
    private String color;
    private String memory;
    private Part imagePart;
    private List<byte[]> imageBytesList;
    // it will store bytes of each images from imageParts
    private byte[] allImageBytes;
    //it will store concatenated bytes of all images
    private String desc;


    public Product() {
        //default constructor
    }

    public Product(int id, String name, String brand, List<byte[]> imageBytesList, int originalPrice, int discountedPrice, int quantity, String memory, String color, String desc) {
        //constructor without allImageBytes[];
        this.id = id;
        this.originalPrice = originalPrice;
        this.discountedPrice = discountedPrice;
        this.quantity = quantity;
        this.name = name;
        this.brand = brand;
        this.color = color;
        this.memory = memory;
        this.imageBytesList = imageBytesList;
        this.desc = desc;
    }

    public Product(int id, String name, String brand, byte[] allImageBytes, int originalPrice, int discountedPrice, int quantity, String memory, String color, String desc) {
        //constructor without imageByteList
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.color = color;
        this.memory = memory;
        this.originalPrice = originalPrice;
        this.discountedPrice = discountedPrice;
        this.quantity = quantity;
        this.allImageBytes = allImageBytes;
        this.desc = desc;
    }

    public Product(String name, String brand, byte[] allImageBytes, int originalPrice, int discountedPrice, int quantity, String memory, String color, String desc) {
        // constructor without id and imageBytesList;
        this.name = name;
        this.brand = brand;
        this.color = color;
        this.memory = memory;
        this.originalPrice = originalPrice;
        this.discountedPrice = discountedPrice;
        this.quantity = quantity;
        this.allImageBytes = allImageBytes;
        this.desc = desc;
    }

    public byte[] getAllImageBytes() {
        return allImageBytes;
    }

    public void setAllImageBytes(byte[] allImageBytes) {
        this.allImageBytes = allImageBytes;
    }

    public List<byte[]> getImageBytesList() {
        return imageBytesList;
    }

    public void setImageBytesList(List<byte[]> imageBytesList) {
        this.imageBytesList = imageBytesList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(int originalPrice) {
        this.originalPrice = originalPrice;
    }

    public int getDiscountedPrice() {
        return discountedPrice;
    }

    public void setDiscountedPrice(int discountedPrice) {
        this.discountedPrice = discountedPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMemory() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }

    public Part getImagePart() {
        return imagePart;
    }

    public void setImagePart(Part imagePart) {
        this.imagePart = imagePart;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
