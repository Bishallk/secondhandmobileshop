package mbmc.secondhandmobileshop.models;

public class Brand {
    private int id;
    private String name;
    private String desc;

    //default constructor//
    public Brand() {
    }
    //parameterized constructor --1 //
    public Brand(int id, String name, String desc) {
        this.id = id;
        this.name = name;
        this.desc = desc;
    }
    //parameterized constructor --2 //
    public  Brand(String name, String desc){
        this.name=name;
        this.desc=desc;
    }
    // ----------------getter & setters------------------//

    //--- for id ---//
    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    //--- for description ---//
    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }

    //--- for name ---//
    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
