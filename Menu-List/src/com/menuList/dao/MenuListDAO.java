package com.menuList.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.menuList.model.MenuListMain;

public class MenuListDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/hotel?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345";

    private static final String INSERT_MENU_SQL = "INSERT INTO menu_list" +
            " (categoryID, menuName, price) VALUES (?, ?, ?);";

    private static final String SELECT_MENU_BY_ID = "SELECT id, categoryID, menuName, price FROM menu_list WHERE id = ?";
    private static final String SELECT_ALL_MENUS = "SELECT * FROM menu_list";
    private static final String DELETE_MENU_SQL = "DELETE FROM menu_list WHERE id = ?;";
    private static final String UPDATE_MENU_SQL = "UPDATE menu_list SET categoryID = ?, menuName = ?, price = ? WHERE id = ?;";

    public MenuListDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertMenu(MenuListMain menu) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MENU_SQL)) {
            preparedStatement.setString(1, menu.getCategoryID());
            preparedStatement.setString(2, menu.getMenuName());
            preparedStatement.setString(3, menu.getPrice());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public MenuListMain selectMenu(int id) {
        MenuListMain menu = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MENU_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String categoryID = rs.getString("categoryID");
                String menuName = rs.getString("menuName");
                String price = rs.getString("price");
                menu = new MenuListMain(id, categoryID, menuName, price);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menu;
    }

    public List<MenuListMain> selectAllMenus() {
        List<MenuListMain> menuList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MENUS);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String categoryID = rs.getString("categoryID");
                String menuName = rs.getString("menuName");
                String price = rs.getString("price");
                menuList.add(new MenuListMain(id, categoryID, menuName, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }
    
    
    public List<MenuListMain> AllMenus() {
        List<MenuListMain> menuList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MENUS);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String categoryID = rs.getString("categoryID");
                String menuName = rs.getString("menuName");
                String price = rs.getString("price");
                menuList.add(new MenuListMain(id, categoryID, menuName, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }
    

    public boolean deleteMenu(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_MENU_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateMenu(MenuListMain menu) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_MENU_SQL);) {
            statement.setString(1, menu.getCategoryID());
            statement.setString(2, menu.getMenuName());
            statement.setString(3, menu.getPrice());
            statement.setInt(4, menu.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
