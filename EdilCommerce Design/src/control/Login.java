package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.RuoloUserBean;
import model.RuoloUserModelDS;
import model.UserBean;
import model.UserModelDS;
import utils.Utility;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		UserModelDS model = new UserModelDS(ds);
		RuoloUserModelDS modelRuolo = new RuoloUserModelDS(ds);
		RequestDispatcher dispatcher = null;
		
		UserBean bean = new UserBean();
		try {
			bean = model.doRetriveByKey(request.getParameter("username"));
		} catch (SQLException e) {
			Utility.print(e);
			request.setAttribute("error", e.getMessage());
		}
		Utility.print(bean.toString());
		
		if(!bean.isEmpty()) {
			if((request.getParameter("password")).equals(bean.getUserPassword())) {
				try {
					Collection<RuoloUserBean> collection = modelRuolo.doRetriveByOneKey(bean.getUsername());
					request.getSession().setAttribute("userRole", false);
					request.getSession().setAttribute("adminRole", false);
					
					for(RuoloUserBean userBean: collection) {
						if(userBean.getNome().equals("user")) {
							request.getSession().setAttribute("userRole", true);
						} if(userBean.getNome().equals("admin")) {
							request.getSession().setAttribute("adminRole", true);
						}
					}
					request.getSession().setAttribute("loggedUsername", bean.getUsername());
					dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
				} catch (SQLException e) {
					Utility.print(e);
					request.setAttribute("error", e.getMessage());
				}
			} else {
				request.setAttribute("error", "Username o Password incoretta. Riprova.");
				dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
			}
		} else {
			request.setAttribute("error", "Username o Password incoretta. Riprova.");
			dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
		}
		
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
