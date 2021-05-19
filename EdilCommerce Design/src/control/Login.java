package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.UserBean;
import model.UserModelDS;
import utils.Utility;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		UserModelDS model = new UserModelDS(ds);
		
		UserBean bean = new UserBean();
		try {
			bean = model.doRetriveByKey(getInitParameter("username"));
		} catch (SQLException e) {
			Utility.print(e);
			request.setAttribute("error", e.getMessage());
		}
		
		if(!bean.isEmpty()) {
			(getInitParameter("password")).equals(bean.getUserPassword());
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
