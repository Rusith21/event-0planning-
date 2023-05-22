package model;

public class EventPacakge {

    private String id;
    private String name;
    private String price;
    private String hotel_count;
    private String cater_count;
    private String decor_count;
    private String description;

    public EventPacakge(String id, String name, String price, String hotel_count, String cater_count, String decor_count, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.hotel_count = hotel_count;
        this.cater_count = cater_count;
        this.decor_count = decor_count;
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPrice() {
        return price;
    }

    public String getHotel_count() {
        return hotel_count;
    }

    public String getCater_count() {
        return cater_count;
    }

    public String getDecor_count() {
        return decor_count;
    }

    public String getDescription() {
        return description;
    }
    
    

}
