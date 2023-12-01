package com.menuList.model;

public class MenuListMain {
    protected int id;
    protected String categoryID;
    protected String menuName;
    protected String price;

    public MenuListMain() {
    }

    public MenuListMain(String categoryID, String menuName, String price) {
        super();
        this.categoryID = categoryID;
        this.menuName = menuName;
        this.price = price;
    }

    public MenuListMain(int id, String categoryID, String menuName, String price) {
        super();
        this.id = id;
        this.categoryID = categoryID;
        this.menuName = menuName;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
