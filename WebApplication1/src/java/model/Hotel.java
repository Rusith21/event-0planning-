package model;

public class Hotel {

    private String id = null;
    private String name = "";
    private String address = "";
    private String manager = "";
    private String mobile = "";
    private String description = "";

    public Hotel() {
    }
    
    public Hotel(String id, String name, String address, String manager, String mobile, String description) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.manager = manager;
        this.mobile = mobile;
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getManager() {
        return manager;
    }

    public String getMobile() {
        return mobile;
    }

    public String getDescription() {
        return description;
    }
    
    

}
