package com.menuList.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menuList.dao.MenuListDAO;
import com.menuList.model.MenuListMain;

@WebServlet("/")
public class MenuListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MenuListDAO menuListDAO;

    public void init() {
        menuListDAO = new MenuListDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertMenu(request, response);
                    break;
                case "/delete":
                    deleteMenu(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateMenu(request, response);
                    break;
                case "/all-list":
                    allList(request, response);
                    break;    
                default:
                    listMenu(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    private void allList(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<MenuListMain> menuList = menuListDAO.AllMenus();
        request.setAttribute("menuList", menuList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("menu-details.jsp");
        dispatcher.forward(request, response);
    }

    private void listMenu(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<MenuListMain> menuList = menuListDAO.selectAllMenus();
        request.setAttribute("menuList", menuList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("menu-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("menu-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        MenuListMain existingMenu = menuListDAO.selectMenu(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("menu-form.jsp");
        request.setAttribute("menu", existingMenu);
        dispatcher.forward(request, response);
    }

    private void insertMenu(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String categoryID = request.getParameter("categoryID");
        String menuName = request.getParameter("menuName");
        String price = request.getParameter("price");
        MenuListMain newMenu = new MenuListMain(categoryID, menuName, price);
        menuListDAO.insertMenu(newMenu);
        response.sendRedirect("list");
    }

    private void updateMenu(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String categoryID = request.getParameter("categoryID");
        String menuName = request.getParameter("menuName");
        String price = request.getParameter("price");

        MenuListMain updatedMenu = new MenuListMain(id, categoryID, menuName, price);
        menuListDAO.updateMenu(updatedMenu);
        response.sendRedirect("list");
    }

    private void deleteMenu(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        menuListDAO.deleteMenu(id);
        response.sendRedirect("list");
    }
}
