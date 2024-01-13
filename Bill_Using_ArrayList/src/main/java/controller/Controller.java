package controller;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DTO;

@WebServlet(urlPatterns = {"/orderLink","/billLink","/clearList"})
public class Controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path=req.getServletPath();
		System.out.println(path);
		switch(path)
		{
		case "/orderLink":order(req, resp);
		break;
		
		case "/billLink":coustomerBill(req, resp);
			break;
		case "/clearList":clearList(req, resp);
			break;
		}
	}
	
	private void clearList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("index.html").forward(req, resp);
		orders.clear();
	}
	
	private static List<DTO> orders = new ArrayList<>();
	
	private void order(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		 String dishName = req.getParameter("dishName");
	        double dishPrice = Double.parseDouble(req.getParameter("dishPrice"));
	        int dishQuantity = Integer.parseInt(req.getParameter("dishQuantity"));

	        DTO order = new DTO(dishName, dishPrice, dishQuantity);
	        orders.add(order);
	        resp.sendRedirect("index.html");
	}
	 public static List<DTO> getOrders() {
	        return orders;
	}
	 private void coustomerBill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setAttribute("result",Controller.getOrders());
			RequestDispatcher rd= req.getRequestDispatcher("bill.jsp");
			rd.forward(req, resp);
		}
}

