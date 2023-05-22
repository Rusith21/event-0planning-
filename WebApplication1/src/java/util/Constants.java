package util;

public class Constants {

    public final static String UPDATE_PACKAGE = "UPDATE packages SET name=?,price=?,hotel_count=?,cater_count=?,decor_count=?,description=? WHERE id=?";
    public final static String SET_PACKAGE = "UPDATE users SET package=? WHERE id=?";

    public final static String INSERT_CATER = "INSERT INTO caters(name, address, manager, mobile, description) VALUES (?,?,?,?,?)";
    public final static String UPDATE_CATER = "UPDATE caters SET name=?,address=?,manager=?,mobile=?,description=? WHERE id=?";
    public final static String DELETE_CATER = "DELETE FROM caters WHERE id=?";

    public final static String INSERT_DECOR = "INSERT INTO decors(name, address, manager, mobile, description) VALUES (?,?,?,?,?)";
    public final static String UPDATE_DECOR = "UPDATE decors SET name=?,address=?,manager=?,mobile=?,description=? WHERE id=?";
    public final static String DELETE_DECOR = "DELETE FROM decors WHERE id=?";

    public final static String INSERT_HOTEL = "INSERT INTO hotels(name, address, manager, mobile, description) VALUES (?,?,?,?,?)";
    public final static String UPDATE_HOTEL = "UPDATE hotels SET name=?,address=?,manager=?,mobile=?,description=? WHERE id=?";
    public final static String DELETE_HOTEL = "DELETE FROM hotels WHERE id=?";

    public final static String REGISTER_USER = "INSERT INTO users (name, email, password, address, mobile, role, package, status) VALUES (?,?,?,?,?,1,0,1)";

    public final static String DELETE_USER = "DELETE FROM users WHERE id=?";
    public final static String UPDATE_USER = "UPDATE users SET name=?,password=?,address=?,mobile=? WHERE id=?";
}
