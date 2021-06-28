package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.ArticoloBean;
import model.ArticoloModelDS;
import model.ArticoloParzialeModelDS;
import model.CategoriaBean;
import model.CategoriaModelDS;
import model.UserModelDS;
import utils.Utility;

@WebServlet("/SearchParziale")
public class SearchParziale extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		Collection<ArticoloBean> collection = new LinkedList<ArticoloBean>();
		
		 
		ArticoloParzialeModelDS modelA = new ArticoloParzialeModelDS(ds);
		
		String criterio = request.getParameter("criterioRicerca");
		try {
			collection=modelA.doRetriveByCategory(criterio);
		} catch (SQLException e) {
			Utility.print(e);
			request.setAttribute("error", e.getMessage());
		}
		
		request.setAttribute("risultato", collection);
		getServletContext().getRequestDispatcher(response.encodeURL("/result.jsp")).include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
