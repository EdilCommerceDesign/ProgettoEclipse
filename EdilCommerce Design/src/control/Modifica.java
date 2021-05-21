package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.UserBean;
import model.UserModelDS;
import utils.Utility;

@WebServlet("/Modifica")
public class Modifica extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		UserModelDS model = new UserModelDS(ds);
		UserBean bean = new UserBean();
		
		String original = request.getParameter("originalUsername");
		
		bean.setUsername(request.getParameter("username"));
		bean.setNome(request.getParameter("nome"));
		bean.setCognome(request.getParameter("cognome"));
		bean.setEmail(request.getParameter("email"));
		bean.setUserPassword(request.getParameter("password"));
		bean.setTelefono(request.getParameter("telefono"));
		bean.setIndirizzo(request.getParameter("indirizzo"));
		
		try {
			model.doUpdate(bean, original);
		} catch (SQLException e) {
			Utility.print(e);
			request.setAttribute("error", e.getMessage());
		}
		
		request.getSession().setAttribute("loggedUsername", bean.getUsername());
		response.sendRedirect("./user/profilo.jsp");
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
